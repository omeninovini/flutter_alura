import 'package:alura_test/models/transferencia.dart';
import 'package:alura_test/screens/transferencias/formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  @override
  ListaFormularioState createState() => ListaFormularioState();
}

class ListaFormularioState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(Transferencia transferencia) {
    if (transferencia != null) {
      setState(() {
        _transferencias.add(transferencia);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}
