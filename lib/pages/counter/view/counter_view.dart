abstract class CounterView{

  //método chamado pela "presenter" quando precisar atualizar a página
  void refreshState(int newCounter);

  //método para redirecinamento para página de sucesso
  void redirect();

  //método para decrementar e exibir menssagem
  void showMessage(String message);

}