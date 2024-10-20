import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kriptonalisis/feature/caesar/caesar_screen.dart';
import 'package:kriptonalisis/feature/random/random_screen.dart';
import 'package:kriptonalisis/ui/color.dart';
import 'package:kriptonalisis/ui/dimen.dart';
import 'package:kriptonalisis/ui/type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Kriptonalisis"),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(screenPadding),
          child: Column(
            children: [
              _buildMenuView(context: context)

            ],
          ),
        ),
      )),
    );
  }

  Widget _buildMenuView({required BuildContext context}){
    return Column(
      children: [
        _menuItemView(title: "Caesar Cipher", icon: Image.asset("assets/images/img_caesar.png",width: 30,height: 30,), onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CaesarScreen()));
        }),
        SizedBox(height: spacing4,),
        _menuItemView(title: "Random Substitution", icon: FaIcon(FontAwesomeIcons.shuffle,size: 30,), onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> RandomScreen()));
        }),
      ],
    );
  }

  Widget _menuItemView({required String title, required Widget icon,required Function() onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusM),
          border: Border.all(color: neutral400Color)
        ),
        padding: EdgeInsets.all(spacing4),
        child: Row(
          children: [
            icon,
            SizedBox(width: spacing4,),
            Text(title,style: normalMedium,)

          ],
        ),
      ),
    );
  }
}



