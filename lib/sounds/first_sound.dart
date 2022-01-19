import 'dart:ui';

import 'package:autec/sounds/animals_sound.dart';
import 'package:autec/gift.dart';
import 'package:autec/setting.dart';
/*import 'package:audioplayers/audioplayers.dart';*/
import 'package:flutter/material.dart';
import 'package:autec/services/shared_service.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../util/colors.dart';

class FirstSound extends StatefulWidget {
  @override
  _FirstSound createState() => _FirstSound();
}

class _FirstSound extends State<FirstSound> with TickerProviderStateMixin {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'FRENCH', 'locale': Locale('fr', 'FR')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  //late final AudioCache _audioCache;
  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('changelang'.tr),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.pink,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TabController controller =
        new TabController(initialIndex: 0, length: 4, vsync: this);
    /*  _audioCache = AudioCache(
      prefix: 'audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
      );*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.translate),
        //   color: AppColor.lightBlackColor,
        //   onPressed: () async {
        //     await buildLanguageDialog(context);
        //   },
        // ),
        title: Text(
          'Satisfactoria',
          style: TextStyle(fontFamily: '', fontSize: 41, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.translate),
            color: AppColor.lightBlackColor,
            onPressed: () async {
              await buildLanguageDialog(context);
            },
          ),
        ], // Icon
      ),
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
              child: Image.asset(
                'assets/animals.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimalsSound()),
                );
              },
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/transport.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: () {} //=> _audioCache.play('bee.mp3'),
                ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/locked.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: () {} //=> _audioCache.play('bee.mp3'),
                ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/bee.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: () {} //=> _audioCache.play('bee.mp3'),
                ),
            Container(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
