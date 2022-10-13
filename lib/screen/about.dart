import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.size.width,
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Yemsa Dictionary",style:TextStyle(fontWeight:FontWeight.bold)),
             Text("DEVELOPED BY"),
             Text("Yeshiwas Tikimu")
          ]
        )
      ),
    );
  }
}