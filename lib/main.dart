import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

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

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("ByteBank"),
      ),
      body: Column(children: <Widget>[
        TransferItem(Transfers(100.0, 1000)),
        TransferItem(Transfers(350.0, 987)),
        TransferItem(Transfers(600.0, 777)),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfers _transfers;

  TransferItem(this._transfers);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfers.valor.toString()),
        subtitle: Text(_transfers.numeroConta.toString()),
      ),
    );
  }
}

class Transfers {
  final double valor;
  final int numeroConta;

  Transfers(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transfers{valor: $valor, numeroConta: $numeroConta}';
  }
}
