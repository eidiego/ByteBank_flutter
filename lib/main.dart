import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: TransferList(),
      appBar: AppBar(
        title: const Text("ByteBank"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    ),
  ));
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      TransferItem(Transfers(100.0, 1000)),
      TransferItem(Transfers(350.0, 1800)),
      TransferItem(Transfers(600.0, 777)),
    ]);
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
}
