import 'package:get/get.dart';
import 'package:yemsa_translation/controller/readController.dart';

class HistoryController extends GetxController {
  List _notes = [];
  var isFavorite = false.obs;
  var count = 0.obs;
  List get notes => _notes;

  setNotes(List data) {
    _notes = data;
    update();
  }
}
