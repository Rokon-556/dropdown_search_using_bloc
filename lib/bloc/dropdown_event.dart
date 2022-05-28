part of 'dropdown_bloc.dart';

abstract class DDLEvent{}
class DDLStartedEvent extends DDLEvent{
  final String? state;
  final String? thana;
  DDLStartedEvent({required this.state,required this.thana});
}

// class DDLSelectedEvent extends DDLEvent{
//   final List<String?> districtsValue ;
//   final List<String> thanasValue ;
//   final String selectedDistrictValue ;
//   final String selectedThanaValue ;
//   DDLSelectedEvent(this.districtsValue,this.thanasValue,this.selectedDistrictValue,this.selectedThanaValue);
// }
class DDLOnDistrictSelectEvent extends DDLEvent{
  final String district;
  DDLOnDistrictSelectEvent({required this.district});
}
class DDLOnThanaSelectEvent extends DDLEvent{
  final String? thana;
  final String? district;
  DDLOnThanaSelectEvent({required this.thana,required this.district});
}
