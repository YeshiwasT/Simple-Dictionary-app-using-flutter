import 'package:get/get.dart';
import 'package:yemsa_translation/model/readModel.dart';

class Dictionary {
  late int id;
  late RxBool isFavorite=false.obs;
  late Words word;

  Dictionary({required this.id, required this.word});
}
