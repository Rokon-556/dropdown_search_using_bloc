import 'package:dropdown_search/dropdown_search.dart';
import 'package:final_search_ddl/bloc/dropdown_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dropdown_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DDLBloc(repository: DDLRepository())
        ..add(DDLStartedEvent(state: null, thana: null)),
      child: MaterialApp(
        title: 'dropdownSearch Demo',
        home: MyHomePage(),
      ),
    );
    // return BlocProvider(
    //     create: (context) => DropdownCubit(),
    //     child: MaterialApp(
    //       title: 'dropdownSearch Demo',
    //       home: MyHomePage(),
    //     ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DDLRepository repo = DDLRepository();

  final _formKey = GlobalKey<FormState>();
  List<String> test = [];
  List<String> test1 = [];

  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');

  @override
  void initState() {
    test = repo.districtDropdown();
    print('test1:$test1');
    repo.getLocalByState('thana');
    print('errr:${repo.getStates()}');

    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   print('heelllloooo');
  //   return Scaffold(
  //     appBar: AppBar(title: Text("DropdownSearch Demo")),
  //     body: Padding(
  //       padding: const EdgeInsets.all(25),
  //       child: Form(
  //         key: _formKey,
  //         autovalidateMode: AutovalidateMode.onUserInteraction,
  //         child: BlocBuilder<DDLBloc, DDLState>(
  //           builder: (context, state) {
  //             return ListView(
  //               padding: EdgeInsets.all(4),
  //               children: <Widget>[
  //                 onDropdown(),
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    print('heelllloooo');
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: BlocBuilder<DDLBloc, DDLState>(
            //child: BlocBuilder<DropdownCubit, StateModel>(
            builder: (context, state) {
              return ListView(
                padding: EdgeInsets.all(4),
                children: <Widget>[
                  onDropdown(),
                  onButtonPressed(),
                  // onCubitDropdown(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // onCubitDropdown() {
  //   return BlocBuilder<DropdownCubit, StateModel>(
  //     builder: (context, state) {
  //       return Container(
  //         child: Column(
  //           children: [
  //             DropdownSearch<String>(
  //               showSearchBox: true,
  //               items: test,
  //               dropdownSearchDecoration:
  //                   InputDecoration(labelText: "District Name"),
  //               onChanged: (val){
  //                 DistrictDropDownChange(val!);
  //               },
  //             ),
  //             DropdownSearch<String>(
  //               showSearchBox: true,
  //               items: test1,
  //               dropdownSearchDecoration:
  //               InputDecoration(labelText: "Thana Name"),
  //               onChanged: (val){
  //                 ThanaDropDownChange(val!,state.district!);
  //                 context.read<DropdownCubit>().thana;
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  onButtonPressed(){
    final bloc = BlocProvider.of<DDLBloc>(context);
    return BlocBuilder<DDLBloc,DDLState>(builder: (context, state) {
      if(state is DDLLoadedState){
        return ElevatedButton(onPressed: (){
          print('tapppeeeddd');
         // BlocProvider.of<DDLBloc>(context).add(DDLStartedEvent(state: null, thana: null));
          //bloc.add(DDLStartedEvent(state: null, thana: null));
         // bloc.add(DDLStartedEvent(state: state.district, thana: state.thana));
          BlocProvider.of<DDLBloc>(context).add(DDLOnThanaSelectEvent(thana: state.thana, district: state.district));
        }, child: Text('Clear Data'));
      }else{
        return Text('heloo');
      }
    });
  }

  onDropdown() {
    final bloc = BlocProvider.of<DDLBloc>(context);
    return BlocBuilder<DDLBloc, DDLState>(builder: (context, state) {
      if (state is DDLLoadedState) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownSearch<dynamic>(
                showSearchBox: true,
                items: test,
                dropdownSearchDecoration:
                    InputDecoration(labelText: "District Name"),
                // onChanged: (newVal){
                //   setState(() {
                //     test1=repo.getThanaFinal(newVal);
                //   });
                //   //repo.getThanaFinal(newVal);
                // },
                onChanged: (value) {
                  bloc.add(DDLOnDistrictSelectEvent(
                    district: value!,
                  ));
                },
                // onChanged: print,
                //onFind: (String? filter) => _runFilterDistrict(filter!),
                //selectedItem: "Choose District",
              ),
              DropdownSearch<dynamic>(
                showSearchBox: true,

                items: repo.getThanaFinal(state.district),

                dropdownSearchDecoration:
                    InputDecoration(labelText: "Thana Name"),
                onChanged: (value) {
                  //value=state.thana;
                  bloc.add(DDLOnThanaSelectEvent(
                      thana: value!, district: state.district));
                },
                // onChanged:(val) {
                //   print;
                //   //repo.getSelectedThana(val);
                //   //print;
                // },
                //onChanged: print,
                //onFind: (String? filter) => _runFilterThana(filter!),
                //selectedItem: "Choose Thana",
              ),
            ],
          ),
        );
      } else {
        return Text('Nothing found');
      }
    });
  }

  // onDropDownReturn() {
  //
  //   return
  // }

}

///previously checking
// List<String> _foundDistrict = [];
//Future<List<String>> _runFilterDistrict(String enteredKeyword) async {
//    List<String> results = [];
//    if (enteredKeyword.isEmpty) {
//      // if the search field is empty or only contains white-space, we'll display all users
//      results = test;
//      print('first:$results');
//    } else {
//      results = test
//          .where((user) =>
//              user.toLowerCase().contains(enteredKeyword.toLowerCase()))
//          .toList();
//      print('second:$results');
//      //we use the toLowerCase() method to make it case-insensitive
//    }
//
//    // Refresh the UI
//    setState(() {
//      test = results;
//      print('three:$results');
//    });
//    print('four:$results');
//    return test;
//  }
