import 'package:flutter/material.dart';
import 'package:kriptonalisis/feature/caesar/widget/caesar_table.dart';
import 'package:kriptonalisis/ui/color.dart';
import 'package:kriptonalisis/ui/dimen.dart';
import 'package:kriptonalisis/ui/type.dart';
import 'package:kriptonalisis/utilties/utility.dart';

class EncryptCaesarScreen extends StatefulWidget {


  EncryptCaesarScreen({super.key});

  @override
  State<EncryptCaesarScreen> createState() => _EncryptCaesarScreenState();
}

class _EncryptCaesarScreenState extends State<EncryptCaesarScreen> {
  final TextEditingController _plainTextController = TextEditingController();

  final TextEditingController _resultController = TextEditingController();

  int _cipherKey = 0;


  void _encrypt(){
    _resultController.text = encryptCaesarCipher(_plainTextController.text, _cipherKey);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          children: [
            _buildEncryptTextField(),
            Container(width: double.infinity,margin: EdgeInsets.symmetric(vertical: spacing6),height: 1,color: dividerColor,),
            _buildResultTextField()

          ],
        ),
      ),
    );
  }

  Widget _buildEncryptTextField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Plain Text",style: normalMedium,),
        SizedBox(height: spacing4,),
        TextField(
          controller: _plainTextController,
          minLines: 5,
          maxLines: 10,
          decoration: InputDecoration(
            hintText: "Masukan plain text"
          ),
        ),
        SizedBox(height: spacing4,),
        Text("Key",style: normalMedium,),

        Row(
          children: [
            Text(_cipherKey.toString(),style: normalRegular,),
            SizedBox(width: spacing3,),
            Expanded(
              child: Slider(value: _cipherKey.toDouble(), onChanged: (value){
                _cipherKey = value.toInt();
                setState(() {

                });
              },min: 0,max: 24,inactiveColor: neutral100Color,),
            ),
          ],
        ),
        SizedBox(height: spacing4,),

        CaesarTable(chyiperKey: _cipherKey),
        SizedBox(height: spacing4,),

        SizedBox(width: double.infinity,
        child: ElevatedButton(onPressed: (){
          _encrypt();
        }, child: Text("Encrypt")),)

      ],
    );
  }

  Widget _buildResultTextField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cipher Text",style: normalMedium,),
        SizedBox(height: spacing4,),
        TextField(
          controller: _resultController,
          minLines: 5,
          maxLines: 10,
          decoration: InputDecoration(
          ),
        )

      ],
    );
  }
}
