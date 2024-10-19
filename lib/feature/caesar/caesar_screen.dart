import 'package:flutter/material.dart';
import 'package:kriptonalisis/feature/caesar/decrypt/decrypt_caesar_screen.dart';
import 'package:kriptonalisis/feature/caesar/encrypt/encrypt_caesar_screen.dart';

class CaesarScreen extends StatelessWidget {
  const CaesarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Caesar Chiper"),
          bottom: _buildTabBar(),
        ),
        body: _buildTabBarView(),
      ),
    );
  }

  TabBar _buildTabBar(){
    return TabBar(tabs: [
      Tab(text: "Encrypt",),
      Tab(text: "Decrypt",)
    ]);
  }

  Widget _buildTabBarView(){
    return TabBarView(children: [
      EncryptCaesarScreen(),
      DecryptCaesarScreen(),
    ]);
  }
}
