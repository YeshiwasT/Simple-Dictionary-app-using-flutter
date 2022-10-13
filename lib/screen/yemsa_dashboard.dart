
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yemsa_translation/controller/yemsa_dashboard_Controller.dart';

import 'about.dart';
import 'favorite.dart';
import 'homePage.dart';

class YemsaDashBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YemsaDashBoardController>(
     init:YemsaDashBoardController(), 
      builder: (controller) {
      
      return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.buttomIndex,
            children: [
              HomePage(),
              Favorite(),
              About(),
            ],
          )),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
              ),
              
            ],
            currentIndex: controller.buttomIndex,
            selectedItemColor: Colors.redAccent[700],
            onTap: controller.changeButtomIndex,
          ));
    });
  }
}
