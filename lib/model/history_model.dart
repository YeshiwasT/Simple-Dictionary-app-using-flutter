
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yemsa_translation/controller/historyController.dart';
import 'package:yemsa_translation/hive/history_box.dart';

part 'history_model.g.dart';

@HiveType(typeId: 0)
class history_model extends HiveObject {
  @HiveField(0)
  late String yemsa;
  @HiveField(1)
  late String amharic;
  @HiveField(2)
  late String english;

  history_model({
    required this.yemsa,
    required this.amharic,
    required this.english,
  });

  add() {
    final HistoryController noteController = Get.find();
    List notes = noteController.notes;
    
    bool isThere = false;
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].yemsa ==yemsa) {
        isThere = true;
        break;
      }
    }
    if (!isThere) {
      notes.add(this);
      HistoryBox().putNotes(notes);
    }
  }

  delete() async {
    final HistoryController noteController = Get.put(HistoryController());
    List notes = noteController.notes;
     for (var i = 0; i < notes.length; i++) {
      if (notes[i].yemsa ==yemsa) {
       notes.remove(notes[i]);
       HistoryBox().putNotes(notes);
      }
    }
    notes.remove(this);
    HistoryBox().putNotes(notes);
  }
}
