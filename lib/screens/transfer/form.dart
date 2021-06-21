import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criando transferência';
const _fieldValueLabel = 'valor';
const _fieldTipValue = '0.00';

const _accountNumberFieldLabel = 'Número da conta';
const _accountNumberTip = '000';

const _confirmButtonText = 'Confirmar';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberFieldController =
  TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();

  void createTransfer(BuildContext context) {
    debugPrint('clicou confirmar');
    final double value = double.tryParse(_valueFieldController.text);
    final int accountNumber = int.tryParse(_accountNumberFieldController.text);

    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(value, accountNumber);
      debugPrint('$createdTransfer');
      Navigator.pop(context, createdTransfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                  controller: _accountNumberFieldController,
                  tip: _accountNumberTip,
                  label: _accountNumberFieldLabel),
              Editor(
                  controller: _valueFieldController,
                  tip: _fieldTipValue,
                  label: _fieldValueLabel,
                  icon: Icons.monetization_on),
              ElevatedButton(
                onPressed: () {
                  createTransfer(context);
                },
                child: Text(_confirmButtonText),
              ),
            ],
          )),
    );
  }
}