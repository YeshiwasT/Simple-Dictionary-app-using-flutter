import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemsa_translation/controller/historyController.dart';
import 'package:yemsa_translation/controller/readController.dart';
import 'package:yemsa_translation/hive/history_box.dart';
import 'package:yemsa_translation/model/history_model.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<Favorite> {
  ReadController textController = Get.find();
  HistoryController test = Get.find();
  getNotes() async {
    final HistoryController noteControllerP = Get.find();
    await noteControllerP.setNotes(HistoryBox().getNotes());
  }

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder(
              builder: (HistoryController noteController) {
                return noteController.notes.length == 0
                    ? Center(
                        child: Text("No favorite words found !"),
                      )
                    : ListView.builder(
                        itemCount: noteController.notes.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white70,
                            child: ListTile(
                              tileColor: Colors.white,
                              leading: CircleAvatar(
                                backgroundColor: Colors.redAccent[700],
                                child: Icon(Icons.mic), //Text("${index+1}"),
                              ),
                              title: Text(
                                noteController.notes[index].yemsa,
                                style: TextStyle(color: Colors.redAccent[700]),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(noteController.notes[index].amharic,
                                      style: TextStyle(
                                          color: Colors.redAccent[700])),
                                  Text(noteController.notes[index].english,
                                      style: TextStyle(
                                          color: Colors.redAccent[700])),
                                ],
                              ),
                              trailing: 
                              IconButton(
                                    onPressed: () {
                                      history_model note = history_model(
                                        yemsa:
                                            noteController.notes[index].yemsa,
                                        amharic:
                                            noteController.notes[index].amharic,
                                        english:
                                            noteController.notes[index].english,
                                      );
                                                                                       
                                      for (var i = 0; i < textController.dictionary.length; i++) {
                                         if (textController.dictionary[i].word.yemsa == noteController.notes[index].yemsa) {
                                                 textController.dictionary[i].isFavorite.value = false;
                                                     break;
                                                            }
                                                                   }                    
                                      note.delete();
 
                                     

                                      print(
                                          'Is Favorite : $noteController.isFavorite.value');
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: (textController.isFavorite(noteController.notes[index].yemsa)==false)
                                          ? Colors.white
                                          : Colors.redAccent[700],
                                    ),
                                  ),
                              
                            ),
                          );
                        });
              },
            ),
          ),
       
        ],
      ),
    );
  }
}
