import 'package:chat_app/screens/Chat_Page.dart';
import 'package:chat_app/screens/Search_Page.dart';
import 'package:chat_app/screens/User_Page.dart';
import 'package:chat_app/styles/AppColors.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Destination selectedPage = Destination.chat;
  final Pages = [ChatPage(), SearchPage(), UserPage()];
  int index =0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Pages[selectedPage.index]
        ),


      appBar: AppBar(
        backgroundColor: Appcolors.background,
        title: Text('Let\'s Chat', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      bottomNavigationBar: MyBottomNavigationBar(
        selectedPage: selectedPage,
        onClick: (value) {
          setState(() {
            selectedPage = value;
          });
        },
      ),
    );
  }
}

enum Destination { chat, search, user }

class MyBottomNavigationBar extends StatelessWidget {
 final Destination selectedPage;
  final ValueChanged onClick;

  MyBottomNavigationBar({
    super.key,
    required this.selectedPage,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: 87,
      margin: EdgeInsets.only(top: 24 , bottom: 15 , left: 24 , right: 24),
      padding: EdgeInsets.only(left: 12 , right: 12),
      child: Stack(
        children: [
          Positioned(
            top: 17,
            right: 0,
            left: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () => onClick(Destination.search),
                      icon: Icon(Icons.search),
                    ),
                  ),

                  Expanded(
                    child: IconButton(
                      onPressed: () => onClick(Destination.user),
                      icon: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => onClick(Destination.chat),
              child: Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Appcolors.primary,
                ),
                child: Icon(Icons.chat),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
