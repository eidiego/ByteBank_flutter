import 'package:flutter/material.dart';

import 'main.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerFieldNumberAcc =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando transferencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerFieldNumberAcc,
                label: 'Número da Conta',
                tip: '0000'),
            Editor(
              controller: _controllerFieldValue,
              label: 'Valor',
              tip: '0000',
              iconField: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () {
                _createTransfer(context);
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(context) {
    final int? numeroConta = int.tryParse(_controllerFieldNumberAcc.text);
    final double? valor = double.tryParse(_controllerFieldValue.text);
    if (numeroConta != null && valor != null) {
      final createdTransfer = Transfers(valor, numeroConta);
      debugPrint('$createdTransfer');
      Navigator.pop(context, createdTransfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? tip;
  final IconData? iconField;

  const Editor({this.controller, this.label, this.tip, this.iconField});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: iconField != null ? Icon(iconField) : null,
          labelText: label,
          hintText: tip,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
