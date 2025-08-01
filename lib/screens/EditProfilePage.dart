import 'dart:io';

import 'package:chat_app/Helpers/ProfileImage.dart';
import 'package:chat_app/Helpers/uiComponents.dart';
import 'package:chat_app/service/stroageHelper.dart';
import 'package:chat_app/styles/AppColors.dart';
import 'package:flutter/material.dart';

class Editprofilepage extends StatefulWidget {
  const Editprofilepage({super.key});

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage> {
  String? _imagePath;
  String? _DummyimagePath;

  @override
  void initState() {
    super.initState();

    _loadImagePath();
  }

  Future<void> _loadDummyImagePath() async {
    String? path = await DummyStorageHelper.getProfileImagePath();
    setState(() {
      _DummyimagePath = path;
    });
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
      appBar: AppBar(
        backgroundColor: Appcolors.background,
        title: Text('Edit Profile', style: TextStyle(color: Appcolors.font1)),
        centerTitle: true,
        leading: BackButton(color: Appcolors.font1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child:
                          _DummyimagePath != null
                              ? Image.file(
                                File(_DummyimagePath!),
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                              : _imagePath == null
                              ? Image.asset(
                                'assets/img/user.png',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                              : Image.file(
                                File(_imagePath!),
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Appcolors.primary,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          ImageService().selectDummyImage();
                          _loadDummyImagePath();
                        },
                        icon: Icon(Icons.edit, size: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              AppTextField(hint: 'Username'),
              SizedBox(height: 16),
              AppTextField(hint: 'Bio'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  DummyStorageHelper.deleteProfileImagePath();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                child: Text('Update', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
