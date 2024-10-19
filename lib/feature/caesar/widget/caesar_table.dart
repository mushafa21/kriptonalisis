import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kriptonalisis/ui/color.dart';
import 'package:kriptonalisis/ui/dimen.dart';
import 'package:kriptonalisis/ui/type.dart';
import 'package:kriptonalisis/utilties/utility.dart';

class CaesarTable extends StatelessWidget {
  final int chyiperKey;
  const CaesarTable({super.key, required this.chyiperKey});



  @override
  Widget build(BuildContext context) {
    final chiperMapping = generateCaesarChiper(chyiperKey);
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: spacing2,
      runSpacing: spacing2,
      children: chiperMapping.map((chiper){
        return Container(
          padding: EdgeInsets.all(spacing2),
          decoration: BoxDecoration(
            border: Border.all(
              color: neutral500Color
            )
          ),
          child: Column(
            children: [
              Text(chiper.keys.first,style: smallRegular,),
              FaIcon(FontAwesomeIcons.arrowDown,size: 12,),
              Text(chiper[chiper.keys.first] ?? "-",style: smallRegular,)
              
            ],
          ),
        );
      }).toList(),
    );
  }
}
