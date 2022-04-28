import 'package:flutter/material.dart';

import 'TransferForm.dart';

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
