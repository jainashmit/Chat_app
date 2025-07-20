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
  int current_index = 0;
  final Pages = [
    ChatPage(),
    SearchPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Pages[current_index],
      appBar: AppBar(
        backgroundColor: Appcolors.background,
        elevation: 2,
        title: Text('Let\'s Chat',style: TextStyle(
          color: Colors.white,
          
        ),),
        centerTitle: true,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'User',
          ),
        ],
        currentIndex: current_index,
        onTap: (index) {
          setState(() {
            current_index = index;
          });
        },
        
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
