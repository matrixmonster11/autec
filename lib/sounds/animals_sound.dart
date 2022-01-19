import 'dart:ui';

import 'package:autec/gift.dart';
import 'package:autec/setting.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../util/colors.dart';

class AnimalsSound extends StatefulWidget {
  @override
  _AnimalsSound createState() => _AnimalsSound();
}

class _AnimalsSound extends State<AnimalsSound> with TickerProviderStateMixin {
  late AudioCache _audioCache;

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
      _audioCache = AudioCache(
      //prefix: 'audio/',
      fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
      );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  'assets/bee.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: ()=> {_audioCache.play('audio/bee.mp3')} ,
                ),
            Text(
              "bee".tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/dog.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: () => {_audioCache.play('audio/dog.mp3')},
                ),
            Text(
              "dog".tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/cat.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: ()=> {_audioCache.play('audio/cat.mp3')},
                ),
            Text(
              'cat'.tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/horse.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                onPressed: () => {_audioCache.play('audio/horse.mp3')},
                ),
            Text(
              'horse'.tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/lamb.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              onPressed: () => {_audioCache.play('audio/lamb.mp3')},
                ),
            Text(
              'lamb'.tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
                child: Image.asset(
                  'assets/cricket.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              onPressed: () => {_audioCache.play('audio/cricket.mp3')},
                ),
            Text(
              "cricket".tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
              child: Image.asset(
                'assets/seagull.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              onPressed: () => {_audioCache.play('audio/seagull.mp3')},
            ),
            Text(
              "seagull".tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              height: 20.0,
            ),
            Container(
              height: 20.0,
            ),
            RawMaterialButton(
              child: Image.asset(
                'assets/sparrow.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
              onPressed: () => {_audioCache.play('audio/sparrow.mp3')},
            ),
            Text(
              "sparrow".tr,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
