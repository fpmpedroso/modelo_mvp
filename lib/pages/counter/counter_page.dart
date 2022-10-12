import 'package:flutter/material.dart';
import 'package:modelo_mvp/pages/counter/presenter/counter_presenter.dart';
import 'package:modelo_mvp/pages/counter/presenter/counter_presenter_impl.dart';
import 'package:modelo_mvp/pages/counter/view/counter_view.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> implements CounterView{

  //valor inicial do contador
  var counter = 0;

  //instancia-se a presenter para que possa ter acesso aos métodos & informa ao inicializar "init state"
  CounterPresenter presenter = CounterPresenterImpl();

  @override
  void initState() {

    //informa-se para o atributo "_view" da ConterPresenterImpl qual é a view que ela irá trabalhar
    presenter.view = this;

    super.initState();
  }

  @override
  void redirect() {

    //método proveniente da view para executar a navegação
    Navigator.of(context).pushNamed('/novaTela', arguments: counter);

  }

  @override
  void showMessage(String message) {
    //método para decrementar e apresentar menssagem
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  //método implementado que vem da CounterView
  @override
  void refreshState(int newCounter) {
    setState(() {

      //atualiza o contador
      counter = newCounter;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador MVP'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Contador clicado'),
            Text('$counter vezes'),
            ElevatedButton(
              onPressed: (){
                presenter.increment();
              },
              child: const Text('Incremente')
            ),
            ElevatedButton(
                onPressed: (){
                  presenter.incrementAndRedirect();
                },
                child: const Text('Incremente e redirecione')
            ),
            ElevatedButton(
                onPressed: (){
                  presenter.decrementAndMessage();
                },
                child: const Text('Decrementa + msg')
            )
          ],
        ),
      ),
    );
  }

}
