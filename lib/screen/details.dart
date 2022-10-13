
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemsa_translation/model/readModel.dart';

class Details extends StatelessWidget {
  late Words words;

Details(this.words);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text(words.yemsa),
        actions: [
          FavoriteButton(
                                             isFavorite: false,
                                             valueChanged: (_isFavorite) {

                                                         },
                                                      ),
        ],

      ),
      body: Container(
  
        padding: EdgeInsets.all(10),
        child:ListView(

          children: [
           
               Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/yem.jpg"),
            fit: BoxFit.fill,
          ),
        ),      child: SizedBox(
          height: Get.size.height*0.4),
        ),
            
            Container(
              padding: EdgeInsets.only(top:10),

              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.size.width,
                    color: Colors.redAccent[700],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Yemsa",style:TextStyle(fontSize: 14,color: Colors.white)),
                    )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(words.yemsa,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Example : "),
                  ),

                  ListView.builder(
                      itemCount: words.example.examYema.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          words.example.examYema[index],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      )),
                  
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(top:10),
              
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                    width: Get.size.width,
                    color: Colors.redAccent[700],
      
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("አማረኛ",style:TextStyle(fontSize: 14,color: Colors.white)),
                      
                    )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(words.amharic,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("ምሳሌ : "),
                  ),
                  ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: words.example.examAmharic.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          words.example.examAmharic[index],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      )),
                  
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(top:10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    width: Get.size.width,
                    color: Colors.redAccent[700],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("English",style:TextStyle(fontSize: 14,color: Colors.white)),
                    )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(words.english,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Example : "),
                  ),

                  ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: words.example.examEnglish.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          words.example.examEnglish[index],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                      )),
                  
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}