import 'package:flutter/material.dart';
import 'package:autec/clientt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:autec/services/shared_service.dart';
// import 'package:autec/ui/main/main_screen.dart';
import 'package:autec/ui/main/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:autec/util/colors.dart';
import 'data/langues.dart';

Widget _defaultHome = const loginPage();
Future main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = false;
  _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome =  Clientt();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Sizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        // GetX
        debugShowCheckedModeBanner: false,
        translations: LocalText(),
        locale: Locale('en','US'),
        theme: ThemeData(
          fontFamily: 'Sofia-Pro-Light',
          primarySwatch: Colors.orange,
        ),
        home: _defaultHome,
      );
    });
  }
}

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Satisfactoria',
//       theme: ThemeData(
//         primaryColor: Colors.white,
//         primarySwatch: Colors.blue,
//       ),
//       home: Clientt(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
