/*
* Construção básica do MVP
* 1- cria-se a página;
* 2- cria-se a view: aquela que possui ferramentas para atualização da página e faz o link com a presenter;
* 3- implementa-se a view na página e prepara o método setState() para alteração do widget;
* 4- cria-se a presenter: é a responsável pelo processamento das informações e quando tudo está pronto,
*     faz a conexão com a view que por sua vez altera a página;
* 5- para lincar a view com a presernter: através do método set;
* 6- para funcionar a presenter, está faltando informar qual é a view que irá trabalhar, então na página
*     instancia-se a presenter e na inicialização do estado (initState()) informa-se a instância da própria
*     classe que se encontra para, através do parâmetro, ser informado para presenter;
* 7- têm-se acesso aos atributos e métodos da presenter dentro da página para alimentar as necessidades.
*
* */


import 'package:flutter/material.dart';
import 'package:modelo_mvp/pages/counter/counter_page.dart';
import 'package:modelo_mvp/pages/nova_tela/nova_tela_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const CounterPage(),
        '/novaTela': (context) => const NovaTelaPage()
      },
    );
  }
}