import 'dart:convert';

import 'package:get/get.dart';
class ReadModel {
 late List<Words> words;

  ReadModel({required this.words});

  ReadModel.fromJson(Map<String, dynamic> json) {
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words.add(new Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.words != null) {
      data['words'] = this.words.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Words {
  late String yemsa;
  late String amharic;
  late String english;
  late RxBool isFavorite;
  late Example example;

  Words({required this.yemsa, required this.amharic, required this.english,required isFavorite, required this.example});

  Words.fromJson(Map<String, dynamic> json) {
    yemsa = json['yemsa'];
    amharic = json['amharic'];
    english = json['english'];
    english = json['english'];

    example =
        (json['example'] != null ? new Example.fromJson(json['example']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yemsa'] = this.yemsa;
    data['amharic'] = this.amharic;
    data['english'] = this.english;
    if (this.example != null) {
      data['example'] = this.example.toJson();
    }
    return data;
  }
}

class Example {
 late List<String> examYema;
 late List<String> examAmharic;
 late List<String> examEnglish;

  Example({required this.examYema, required this.examAmharic, required this.examEnglish});

  Example.fromJson(Map<String, dynamic> json) {
    examYema = json['examYema'].cast<String>();
    examAmharic = json['examAmharic'].cast<String>();
    examEnglish = json['examEnglish'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examYema'] = this.examYema;
    data['examAmharic'] = this.examAmharic;
    data['examEnglish'] = this.examEnglish;
    return data;
  }
}
