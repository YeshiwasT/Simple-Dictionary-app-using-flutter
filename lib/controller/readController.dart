import 'package:get/get.dart';
import 'package:yemsa_translation/controller/historyController.dart';
import 'package:yemsa_translation/model/dictionary_model.dart';
import 'package:yemsa_translation/model/readModel.dart';
import 'package:yemsa_translation/services/api.dart';

class ReadController extends GetxController {
  // ignore: deprecated_member_use
  HistoryController favController = Get.find();
  var words = List<Words>.empty(growable: true).obs;
  var dictionary = List<Dictionary>.empty(growable: true).obs;

  var searchItem = List<Words>.empty(growable: true).obs;
  var textSearched = "".obs;
  @override
  void onInit() {
    getRead();
    super.onInit();
  }

  void getRead() async {
    try {
      var notifications = await API.getFile();

      if (notifications != null) {
        words.value = notifications.words;

        for (var i = 0; i < words.length; i++) {
          bool isFavorite = false;
          for (var j = 0; j < favController.notes.length; j++) {
            if (words[i].yemsa == favController.notes[j].yemsa) {
              isFavorite = true;
              // break;
            }
          }
          Dictionary d =
              new Dictionary(id: i, word: words[i]);
          d.isFavorite.value = isFavorite;
          dictionary.insert(
              i, d);
        }
      }

    } finally {
      // TODO
    }
  }

  bool isFavorite(String yemsa) {
    for (var i = 0; i < favController.notes.length; i++) {
      if (yemsa == favController.notes[i].yemsa) {
        return true;
      }
    }
    return false;
  }
 
}
