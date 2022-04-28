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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerFieldNumberAcc,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                decoration: const InputDecoration(
                  labelText: 'Número da Conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerFieldValue,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final int? numeroConta =
                    int.tryParse(_controllerFieldNumberAcc.text);
                final double? valor =
                    double.tryParse(_controllerFieldValue.text);
                if (numeroConta != null && valor != null) {
                  final createdTransfer = Transfers(valor, numeroConta);
                  debugPrint('$createdTransfer');
                }
              },
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }
}
