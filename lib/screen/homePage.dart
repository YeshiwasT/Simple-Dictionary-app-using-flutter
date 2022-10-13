import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yemsa_translation/controller/favController.dart';
import 'package:yemsa_translation/controller/readController.dart';
import 'package:yemsa_translation/controller/historyController.dart';

import 'package:yemsa_translation/model/history_model.dart';
import 'package:yemsa_translation/screen/details.dart';
import 'package:yemsa_translation/screen/searchbar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HistoryController hiController = Get.find();

  ReadController textController = Get.find();
  FavController noteController = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          brightness: Brightness.dark,
          systemOverlayStyle: SystemUiOverlayStyle.dark, // status bar brightness
        ),

          body: Container(
              color:Colors.redAccent[700],
              child: Column(
                children: [
                  Container(
                    
                    color: Colors.redAccent[700],
                    child: SearchBar(textController.words)),
                  
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        color:Colors.white,
                         borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))),
                      child: Obx(() {
                        return ListView.builder(
                            itemCount: (textController.searchItem.isNotEmpty)
                                ? textController.searchItem.length
                                : textController.words.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                             
                              return (textController.searchItem.isNotEmpty)
                                  ? Card(
                                    
                                      color: Colors.white70,
                                      child: InkWell(
                                        onTap: () async {
                                       
                                          await Get.to(() => Details(
                                              textController.searchItem[index]));
                                        },
                                        child: ListTile(
                                          tileColor: Colors.white,
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.redAccent[700],
                                            child: Icon(
                                                Icons.mic), //Text("${index+1}"),
                                          ),
                                          title: Text(
                                            textController.searchItem[index].yemsa,
                                            style: TextStyle(
                                                color: Colors.redAccent[700]),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  textController
                                                      .searchItem[index].amharic,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.redAccent[700])),
                                              Text(
                                                  textController
                                                      .searchItem[index].english,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.redAccent[700])),
                                            ],
                                          ),
                                   trailing: Obx(() => IconButton(
                                                onPressed: () {
                                                  history_model note =
                                                      history_model(
                                                    yemsa: textController
                                                        .searchItem[index].yemsa,
                                                    amharic: textController
                                                        .searchItem[index].amharic,
                                                    english: textController
                                                        .searchItem[index].english,
                                                  );
                  
                                                  if (textController.isFavorite(textController.searchItem[index].yemsa) ==
                                                      false) {
                                                    note.add();
                                                    textController.dictionary[textController.dictionary[index].id]
                                                        .isFavorite.value = true;
                                                  
                                                  } else {
                                                    note.delete();
                  
                                                    textController.dictionary[textController.dictionary[index].id]
                                                        .isFavorite.value = false;
                                        
                                                  }
                  
                                                },
                                                icon: Icon(
                                                   (textController
                                                              .dictionary[textController.dictionary[index].id]
                                                              .isFavorite
                                                              .value ==
                                                          false)
                                                      ? Icons.favorite_border_rounded
                                                      : Icons.favorite,
                                                      color:  (textController
                                                              .dictionary[textController.dictionary[index].id]
                                                              .isFavorite
                                                              .value ==
                                                          false)?
                                                          Colors.grey:Colors.redAccent[700],
                                                ),
                                              )),
                                         
                                        ),
                                      ),
                                    )
                                  : Card(
                                    margin:EdgeInsets.only(top:8,left:8,right:8),
                                      color: Colors.grey,
                                      child: InkWell(
                                        onTap: () async {
                                          await Get.to(() =>
                                              Details(textController.words[index]));
                                        },
                                        child: ListTile(
                                          tileColor: Colors.white,
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.redAccent[700],
                                            child: Icon(
                                                Icons.mic), //Text("${index+1}"),
                                          ),
                                          title: Text(
                                            textController.words[index].yemsa,
                                            style: TextStyle(
                                                color: Colors.redAccent[700]),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  textController
                                                      .words[index].amharic,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.redAccent[700])),
                                              Text(
                                                  textController
                                                      .words[index].english,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.redAccent[700])),
                                            ],
                                          ),
                                          trailing: Obx(() => IconButton(
                                                onPressed: () {
                                                  history_model note =
                                                      history_model(
                                                    yemsa: textController
                                                        .words[index].yemsa,
                                                    amharic: textController
                                                        .words[index].amharic,
                                                    english: textController
                                                        .words[index].english,
                                                  );
                                                  if (textController
                                                          .dictionary[textController.dictionary[index].id]
                                                          .isFavorite
                                                          .value ==
                                                      false) {
                                                    note.add();
                                                    textController.dictionary[textController.dictionary[index].id]
                                                        .isFavorite.value = true;
                                                  
                                                  } else {
                                                    note.delete();
                  
                                                    textController.dictionary[textController.dictionary[index].id]
                                                        .isFavorite.value = false;
                                                
                                                  }
          
                                                },
                                                icon: Icon(
                                                   (textController
                                                              .dictionary[textController.dictionary[index].id]
                                                              .isFavorite
                                                              .value ==
                                                          false)
                                                      ? Icons.favorite_border_rounded
                                                      : Icons.favorite,
                                                      color:  (textController
                                                              .dictionary[textController.dictionary[index].id]
                                                              .isFavorite
                                                              .value ==
                                                          false)?
                                                          Colors.grey:Colors.redAccent[700],
                                                ),
                                              )),
                                          
                                        ),
                                      ),
                                    );
                            });
                      }),
                    ),
                  ),
                ],
              ))),
    );
  }
}
