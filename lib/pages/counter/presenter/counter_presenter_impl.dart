import 'package:modelo_mvp/pages/counter/presenter/counter_presenter.dart';
import 'package:modelo_mvp/pages/counter/view/counter_view.dart';

class CounterPresenterImpl implements CounterPresenter{

  //início do contador
  var _counter = 0;

  //instancia-se a view que irá trabalhar "lincar a presenter com a view"
  late final CounterView _view;

  //ação para obter qual será a view que esta presenter trabalhará
  @override
  set view(CounterView view) {
    _view = view;
  }

  //ações para incrementar o valor
  @override
  void increment() {

    //incrementa-se o contador
    _counter++;

    //após o cálculo, chama-se a view para que ela atualize a página e informa o counter incrementado
    _view.refreshState(_counter);
  }

  //ações para incrementar o valor e navegar para tela de sucesso
  @override
  void incrementAndRedirect() {

    //incrementa-se o contador
    _counter++;

    //após o cálculo, chama-se a view para que ela atualize a página e informa o counter incrementado
    _view.refreshState(_counter);

    //note que não se possui o context, ou seja, não se faz a navegação deste local
    //quem será responsável pela navegação será a view, portanto a presenter somente se preocupa em
    //informar a view sobre a necessidade
    _view.redirect();


  }

  @override
  void decrementAndMessage() {
    _counter--;
    _view.refreshState(_counter);
    _view.showMessage('Valor decrementado');
  }

}