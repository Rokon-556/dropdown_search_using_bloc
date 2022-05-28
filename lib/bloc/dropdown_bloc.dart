

import 'package:bloc/bloc.dart';


import '../dropdown_repository.dart';
import '../user_model.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DDLBloc extends Bloc<DDLEvent, DDLState> {
  final DDLRepository repository;
  DDLBloc({required this.repository}):super(DDLLoadingState()){
    on<DDLStartedEvent>(_onDDLStarted);
    //on<DDLSelectedEvent>(_onDDLSelected);
    on<DDLOnDistrictSelectEvent>(_onDDLSelectedDistrict);
    on<DDLOnThanaSelectEvent>(_onDDLSelectedThana);
  }

  void _onDDLSelectedDistrict(DDLOnDistrictSelectEvent event, Emitter<DDLState> emit) async {
    emit(DDLLoadingState());
    try{
      add(DDLStartedEvent(state: event.district,thana: null),);
    }catch(_){
      DDLErrorState();
    }
  }

  void _onDDLSelectedThana(DDLOnThanaSelectEvent event, Emitter<DDLState> emit) async {
    emit(DDLLoadingState());
    try{
      add(DDLStartedEvent(state: event.district,thana: event.thana),);
    }catch(_){
      DDLErrorState();
    }
  }

  void _onDDLStarted(DDLStartedEvent event, Emitter<DDLState> emit)async {
    emit(DDLLoadingState());
    try{
      List<String?>? selectedStates;
      List<StateModel> districts = repository.getStates();
      selectedStates = event.state != null ? districts.where((e) => e.district! == event.state!).toList().first.thanas : districts.first.thanas;
      //print('first:${districts.where((e) => e.district! == event.state!).toList().first.thanas}');
      emit(DDLLoadedState(event.state ?? districts.first.district!,districts,selectedStates,event.thana ?? selectedStates!.first!));
    }catch(_){
      DDLErrorState();
    }
  }
}
