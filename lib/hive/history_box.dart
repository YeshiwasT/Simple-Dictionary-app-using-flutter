
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yemsa_translation/controller/historyController.dart';

class HistoryBox{

  getNotes(){
    return Hive.box("historyBox").get("history", defaultValue: []);
  }

  putNotes(List data) async {
    final HistoryController noteController = Get.find();
    await Hive.box("historyBox").put("history", data);
    List notes = getNotes();
    noteController.setNotes(notes);
  }

}
