import 'package:modelo_mvp/pages/counter/view/counter_view.dart';

abstract class CounterPresenter{

  //método que informa qual é a view (através de parâmetro) que esse presenter irá trabalhar
  set view(CounterView view);

  //método para incrementar no clique do botão
  void increment();

  //método para incrementar e navergar para uma página de sucesso
  void incrementAndRedirect();

  //método para decrementar e exibir menssagem
  void decrementAndMessage();

}