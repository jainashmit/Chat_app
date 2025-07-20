import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Image.asset('assets/img/user.png',height:100,width: 100,),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: 190,bottom: 190),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Row(
              children: [
              Spacer(),
                Column(
                  children: [
                    Spacer(),
                    Text('Name:'),
                    SizedBox(height: 10,),
                    Text('Email:'),
                    Spacer()
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Spacer(),
                    Text('Ashmit'),
                    SizedBox(height: 10,),
                    Text('jainashmit@gmail.com'),
                    Spacer()
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        )
        ],
      ),
    );
  }
}