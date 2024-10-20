import 'package:flutter/material.dart';
import 'package:kriptonalisis/ui/color.dart';
import 'package:kriptonalisis/ui/dimen.dart';
import 'package:kriptonalisis/ui/type.dart';
import 'package:kriptonalisis/utilties/utility.dart';

class CaesarResultItemView extends StatelessWidget {
  final String text;
  final int cipherKey;
  const CaesarResultItemView({super.key, required this.text, required this.cipherKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: spacing4),
      decoration: BoxDecoration(
        border: Border.all(
          color: neutral400Color
        ),
        borderRadius: BorderRadius.circular(radiusM)
      ),
      padding: EdgeInsets.all(spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Kunci = $cipherKey",style: smallMedium,),
          SizedBox(width: spacing4,),
          Text(decryptCaesarCipher(text, cipherKey),style: normalRegular,maxLines: 1,overflow: TextOverflow.ellipsis,),

        ],
      ),
    );
  }
}
