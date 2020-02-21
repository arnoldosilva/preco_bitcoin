import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = '0';

  void recuperarPreco() async {
    String url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(url);

    Map<String, dynamic> retono = json.decode(response.body);

    setState(() {
      _preco = retono['BRL']['buy'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('img/bitcoin.png'),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'R\$ ' + _preco,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              RaisedButton(
                color: Colors.orange,
                onPressed: recuperarPreco,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Text(
                  'Atualizar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
