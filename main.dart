import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
class Opcao {
  String titulo;
  IconData icone;
  Opcao(this.titulo,this.icone);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Opcao> opcoes = <Opcao> [
    Opcao("Carro", Icons.directions_car),
    Opcao("Bicicleta", Icons.directions_bike),
    Opcao("Barco", Icons.directions_boat),
    Opcao("Ônibus", Icons.directions_bus),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: opcoes.length,
          itemBuilder: (context, index) {
            return Card(
              shadowColor: Colors.blueGrey,
              elevation: 3,
              margin: EdgeInsets.all(5),

              child: ListTile(
                onTap: (){
                  confirma(opcoes[index].titulo);

                },
                title: Text(opcoes[index].titulo),
                subtitle: Text("SubTítulo : " + opcoes[index].titulo ),
                leading: Icon(opcoes[index].icone),
                trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        confirma(opcoes[index].titulo);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),


              ),
            );
          }
      ),
    );
  }

  void confirma(String titulo){

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(

            title: Text("Atenção!"),
            content: Text(titulo),
            actions: <Widget>[

              FlatButton(
                child: Text("fechar"),
                onPressed: () {

                  Navigator.pop(context);
                },
              ),
            ],
          );
        }

    );

  }
}
