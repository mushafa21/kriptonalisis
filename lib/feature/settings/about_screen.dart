import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }
  
  Widget _buildMainView(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
      ),
    );
  }
}
