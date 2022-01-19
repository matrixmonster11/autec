import 'package:flutter/material.dart';
import 'package:autec/models/cases.dart';
import '../util/base_widget.dart';
import 'detailwidget.dart';
// import 'main/main_viewmodel.dart';

//
// class CasesList extends StatefulWidget {
//   final List<Cases> cases;
//
//   CasesList({Key? key, required this.cases}) : super(key: key);
//
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<CasesList> {

  // @override
  // Widget build(BuildContext context) {
  //
  //   return BaseWidget<MainViewModel>(
  //       viewModel: MainViewModel(),
  //   onModelReady: (model) => model.getCases(),
  //     builder:(context, viewModel, _) =>
  //     ListView.builder(
  //         itemCount: viewModel.listCases == null ? 0 : viewModel.listCases!.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return
  //             Card(
  //                 child: InkWell(
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => DetailWidget(viewModel.listCases![index]!)),
  //                     );
  //                   },
  //                   child: ListTile(
  //                     leading: Icon(Icons.person),
  //                     title: Text(viewModel.listCases![index]!.name),
  //                     subtitle: Text(viewModel.listCases![index]!.age.toString()),
  //                   ),
  //                 )
  //             );
  //         }));
  // }

// }