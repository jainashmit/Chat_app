import 'dart:io';

import 'package:chat_app/screens/EditProfilePage.dart';
import 'package:chat_app/screens/SignIn.dart';
import 'package:chat_app/service/stroageHelper.dart';
import 'package:chat_app/styles/AppColors.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? _imagePath;
  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  _clearData() {
    TokenStorage.deleteAccessToken();
    TokenStorage.deleteRefreshToken();
    UserStorage.deleteUser();
  }

  Future<void> _loadImagePath() async {
    String? path = await StorageHelper.getProfileImagePath();
    setState(() {
      _imagePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,

          decoration: BoxDecoration(
            color: Appcolors.background,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(201, 0, 0, 0),
                blurRadius: 16,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              ClipOval(
                child:
                    _imagePath == null
                        ? Image.asset(
                          'assets/img/user.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                        : Image.file(
                          File(_imagePath!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
              ),
              SizedBox(height: 20),
              Text('Ashmit Jain', style: TextStyle(color: Appcolors.font1)),

              SizedBox(height: 12),
              Text(
                'I am a polymath',
                style: TextStyle(color: Appcolors.font1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Editprofilepage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 12,
                  shadowColor: const Color.fromARGB(200, 0, 0, 0),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Appcolors.font1),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  _clearData();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 12,
                  shadowColor: const Color.fromARGB(200, 0, 0, 0),
                ),
                child: Text('Logout', style: TextStyle(color: Appcolors.font1)),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
