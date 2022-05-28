import 'package:final_search_ddl/user_model.dart';

List bangladesh = [
  {
    "district": "Choose District",
    "thana": ["Choose Thana"]
  },
  {
    "district": "Chandpur",
    "thana": [
      //"Choose Thana",
      "Chandpur Sadar",
      "Haimchar",
      "Hajiganj",
      "Faridganj",
      "Kochua",
      "Matlab South",
      "Matlab North",
    ]
  },
  {
    "district": "Dhaka",
    "thana": [
      //"Choose Thana",
      "Kafrul",
      "Dokkhin Khan",
      "Gulshan",
      "Dhanmondi",
      "Airport",
      "Niketon",
    ]
  },
];

class DDLRepository {
  getAll() => bangladesh;
  var thanaList = [];
  var distlist = [];

  getThanaFinal(String check) {
    for (int i = 0; i < bangladesh.length; i++) {
      print('gffgf:${bangladesh[0]['thana']}');
      //thanaList.add(bangladesh[i]['thana']);
      if (bangladesh[i]['district'] == check) {
        thanaList = bangladesh[i]['thana'];
      }
      // (bangladesh[i]['thana']).forEach(
      //   (e) {
      //     print('eeeeeee:$e');
      //     thanaList.add(e);
      //     // if(getCountryName==e){
      //     //   print('eeeeeee:$e');
      //     //   thanaList.add(e);
      //     // }
      //   },
      // );
    }
    return thanaList;
  }
  // getSelectedThana(String districtName) {
  //   for (int i = 0; i < bangladesh.length; i++) {
  //     print('gffgf:${bangladesh[0]['thana']}');
  //     //thanaList.add(bangladesh[i]['thana']);
  //     (bangladesh[i]['thana']).forEach(
  //       (e) {
  //         print('eeeeeee:$e');
  //         //thanaList.add(e);
  //         if(districtName==bangladesh[i]['district'])
  //         {
  //           thanaList.add(e);
  //         }
  //       },
  //     );
  //   }
  //   return thanaList;
  // }

//   thanaDropdown() {
//     //List<String> thanas=['choose thana','sadar','dmp','smp'];
//     List<String> thanas = [];
//     for (int i = 0; i < bangladesh.length; i++) {
//       print(bangladesh[i]['thana']);
//       thanas.add(bangladesh[2]['thana'].toString());
//       return thanas;
//     }
//
// //     var x = [];
// //     var y = [];
// //     for (int i = 0; i < bangladesh.length; i++) {
// //       // var thana=bangladesh[i]['thana'];
// //       //x.add(bangladesh[i]['district']);
// //       //print('bangladesh[i]:${bangladesh[i]['thana'].toString()}');
// //
// // //print('bangladesh:${bangladesh[i].thana}');
// //       for (var intel in bangladesh) {
// //         print('thana:${intel}');
// //         for(var y in intel){
// //           print('y:$y');
// //         }
// //       }
//     // y.add(bangladesh[i]);
//     //
//     // print('yyyyy:$y');
//     // y.map((e) {
//     //   print('item;$e');
//     // });
//     // for (int a = 0; a < y.length; a++) {
//     //   //x.add(y[a]);
//     //   print('item:${y[a]}');
//     // }
//
//     // if(bangladesh[i]['district']=='Dhaka'){
//     //   print('thana 32232');
//     //   x=bangladesh[i]['thana'];
//     // }
//
//     return null;
//   }

  districtDropdown() {
    List<String> x = [];
    for (int i = 0; i < bangladesh.length; i++) {
      x.add(bangladesh[i]['district']);
    }
    print('x:$x');
    return x;
  }

  getLocalByState(String state) => bangladesh.map((map) {
        print('StateModel.fromJson(map):${StateModel.fromJson(map)}');
        return StateModel.fromJson(map);
      }).where((item) {
        print(' item.district == state:${item.district == state}');
        return item.district == state;
      }).map((item) {
        print('item.thanas:${item.thanas}');
        return item.thanas;
      }).toList();

  List<StateModel> getStates() =>
      bangladesh.map((map) => StateModel.fromJson(map)).toList();
}
