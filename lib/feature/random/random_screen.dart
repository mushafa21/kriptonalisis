import 'package:flutter/material.dart';
import 'package:kriptonalisis/feature/caesar/decrypt/decrypt_caesar_screen.dart';
import 'package:kriptonalisis/feature/caesar/encrypt/encrypt_caesar_screen.dart';
import 'package:kriptonalisis/feature/random/decrypt/decrypt_random_screen.dart';
import 'package:kriptonalisis/feature/random/encrypt/encrypt_random_screen.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Random Substitution"),
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
      EncryptRandomScreen(),
      DecryptRandomScreen(),
    ]);
  }
}
