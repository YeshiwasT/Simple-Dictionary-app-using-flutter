import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yemsa_translation/controller/historyController.dart';
import 'package:yemsa_translation/controller/readController.dart';
import 'package:yemsa_translation/model/history_model.dart';
import 'package:yemsa_translation/screen/yemsa_dashboard.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive..init(document.path)..registerAdapter(historymodelAdapter());

  await Hive.openBox("historyBox");
  // await Hive.openBox("historyBox");
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.redAccent[700], // navigation bar color
    statusBarColor: Colors.redAccent[700], // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  HistoryController hiController = Get.put(HistoryController());

  ReadController textController = Get.put(ReadController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'yemsa_dictionary',
      debugShowCheckedModeBanner: false,
     theme:  ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(

      primary: Colors.redAccent[700],
      secondary: Colors.redAccent[700]


    ),
  ),
      home: YemsaDashBoard(),
    );
  }
}
