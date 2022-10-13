
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yemsa_translation/controller/readController.dart';
import 'package:yemsa_translation/model/readModel.dart';

class SearchBar extends StatelessWidget {
  final List<Words> data;
  var searchedItem;
  ReadController textController = Get.find();
  SearchBar(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:12,right:12,bottom:12),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      color: Colors.white,

      ),
      child: TextField(
        cursorColor: Colors.redAccent[700],
        style: TextStyle(
          backgroundColor: Colors.white,
          color: Colors.black,
        ),
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          searchedItem = searchText;
          textController.searchItem.value = data.where((u) {
            var yemsa = u.yemsa.toLowerCase();
            var amharic = u.amharic.toLowerCase();
            var english = u.english.toLowerCase();
            return yemsa.contains(searchText) ||
                amharic.contains(searchText) ||
                english.contains(searchText);
          }).toList(); 
          if (searchText == "") {
            textController.searchItem.clear();
            textController.textSearched.value = "";
          }
         
        },
        decoration: InputDecoration(
          iconColor: Colors.white,
          fillColor: Colors.white,
          focusColor: Colors.white,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.redAccent[700],
          ),
          hintText: 'Search..',
        ),
      ),
    );
  }
}
