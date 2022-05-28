part of 'dropdown_bloc.dart';

abstract class DDLState{}
class DDLLoadingState extends DDLState{}
class DDLLoadedState extends DDLState{
  String district;
  String thana;
  List<StateModel> states;
  List<String?>? selectedModel;
  DDLLoadedState(this.district,this.states,this.selectedModel,this.thana);

}
class DDLErrorState extends DDLState{}
