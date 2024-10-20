import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kriptonalisis/feature/caesar/widget/caesar_result_item_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../ui/color.dart';
import '../../../ui/dimen.dart';
import '../../../ui/type.dart';
import '../../../utilties/utility.dart';
import '../../caesar/widget/caesar_table.dart';


class DecryptRandomScreen extends StatefulWidget {


  DecryptRandomScreen({super.key});

  @override
  State<DecryptRandomScreen> createState() => _DecryptRandomScreenState();
}

class _DecryptRandomScreenState extends State<DecryptRandomScreen> {
  final TextEditingController _cipherTextController = TextEditingController();
  String _cipherText = "";

  final TextEditingController _resultController = TextEditingController();
  final _tooltip = TooltipBehavior(enable: true);
  late List<FrequencyModel> _frequencyList = [];
  late List<FrequencyModel> _chiperFrequencyList = [];
  final ScrollController _scrollController = ScrollController();
  bool _expandFrequency = false;
  bool _expandKeySearch = false;

  SortingOrder _sortingOrder = SortingOrder.none;


  List<FrequencyModel> sortFrequency({required  List<FrequencyModel> list}){
    List<FrequencyModel> resultList = [];
    resultList.addAll(list);
    if(_sortingOrder == SortingOrder.ascending){
      resultList.sort((a,b)=> a.frequency.compareTo(b.frequency));
    } else if(_sortingOrder == SortingOrder.descending){
      resultList.sort((a,b)=> a.frequency.compareTo(b.frequency));
      resultList = resultList.reversed.toList();
    }
    return resultList;

  }

  int _cipherKey = 0;


  void _decrypt(){
    _cipherText = _cipherTextController.text;
    _chiperFrequencyList = calculateLetterFrequency(_cipherText);
    _setKey(key: _cipherKey);
  }

  void _setKey({required int key}){
    _cipherKey = key;
    _resultController.text = decryptCaesarCipher(_cipherText, _cipherKey);
    setState(() {

    });
  }

  @override
  void initState() {
    _frequencyList = letterFrequencies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          children: [
            _buildCipherTextField(),
            if(_cipherText.isNotEmpty)
              Container(width: double.infinity,margin: EdgeInsets.symmetric(vertical: spacing4),height: 1,color: dividerColor,),
            if(_cipherText.isNotEmpty)
              _buildFrequencyAnalysisView(),
            if(_cipherText.isNotEmpty)
              SizedBox(height: spacing8,),
            if(_cipherText.isNotEmpty)
              _buildKeySearch(),
            if(_cipherText.isNotEmpty)
              SizedBox(height: spacing8,),
            if(_cipherText.isNotEmpty)
              _buildResultTextField()

          ],
        ),
      ),
    );
  }

  Widget _buildCipherTextField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cipher Text",style: normalMedium,),
        SizedBox(height: spacing4,),
        TextField(
          controller: _cipherTextController,
          minLines: 5,
          maxLines: 10,
          decoration: InputDecoration(
              hintText: "Masukan cipher text"
          ),
        ),
        SizedBox(height: spacing4,),
        SizedBox(width: double.infinity,
          child: ElevatedButton(onPressed: (){
            _decrypt();
          }, child: Text("Decrypt")),)

      ],
    );
  }

  Widget _buildFrequencyAnalysisView(){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            _expandFrequency = !_expandFrequency;
            setState(() {

            });
          },
          child: Container(
            color: transparentColor,
            child: Row(
              children: [
                Text("Analisis Frequensi",style: normalMedium,),
                Spacer(),
                FaIcon(_expandFrequency ? FontAwesomeIcons.chevronUp :  FontAwesomeIcons.chevronDown ,size: 20,)
              ],
            ),
          ),
        ),
        Visibility(
          visible: _expandFrequency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: spacing4,),
              Row(
                children: [
                  _sortItemView(text: "A to Z", sortingOrder: SortingOrder.none),
                  SizedBox(width: spacing4,),
                  _sortItemView(text: "Ascending", sortingOrder: SortingOrder.ascending),
                  SizedBox(width: spacing4,),
                  _sortItemView(text: "Descending", sortingOrder: SortingOrder.descending),
                ],
              ),
              SizedBox(height: spacing4,),
              Text("Frequensi Huruf (Bahasa Indonesia)",style: normalMedium,),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(interval: 1,edgeLabelPlacement: EdgeLabelPlacement.shift,),
                  primaryYAxis: NumericAxis(),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<FrequencyModel, String>>[
                    ColumnSeries<FrequencyModel, String>(
                        width: 0.5,
                        spacing: 0,
                        name: "Frequensi Huruf (Bahasa Indonesia)",
                        dataSource: _sortingOrder == SortingOrder.ascending || _sortingOrder == SortingOrder.descending ? sortFrequency(list: _frequencyList) : _frequencyList,
                        xValueMapper: (FrequencyModel data, _) => data.letter,
                        yValueMapper: (FrequencyModel data, _) => data.frequency,
                        // dataLabelMapper: (data,_)=> "${data.frequency}%",
                        // dataLabelSettings: DataLabelSettings(isVisible: true),
                        color: primaryColor),

                  ]),
              SizedBox(height: spacing4,),
              Text("Frequensi Huruf (Chiper Text)",style: normalMedium,),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(interval: 1,edgeLabelPlacement: EdgeLabelPlacement.shift,),
                  primaryYAxis: NumericAxis(),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<FrequencyModel, String>>[
                    ColumnSeries<FrequencyModel, String>(
                        width: 0.5,
                        spacing: 0,
                        name: "Frequensi Huruf (Chiper Text)",
                        dataSource: _sortingOrder == SortingOrder.ascending ||  _sortingOrder == SortingOrder.descending ? sortFrequency(list: _chiperFrequencyList) : _chiperFrequencyList,
                        xValueMapper: (FrequencyModel data, _) => data.letter,
                        yValueMapper: (FrequencyModel data, _) => data.frequency,
                        // dataLabelMapper: (data,_)=> "${data.frequency}%",
                        // dataLabelSettings: DataLabelSettings(isVisible: true),
                        color: successColor),

                  ]),

            ],
          ),
        ),

      ],
    );
  }

  Widget _sortItemView({required String text, required SortingOrder sortingOrder}){
    return InkWell(
      onTap: (){
        _sortingOrder = sortingOrder;
        setState(() {
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusS),
            border: Border.all(
                color: _sortingOrder == sortingOrder ? primaryColor : neutral400Color
            )
        ),
        padding: EdgeInsets.all(spacing3),
        child: Text(text,style: normalRegular.copyWith(color: _sortingOrder == sortingOrder ? primaryColor : neutral500Color),),
      ),
    );
  }

  Widget _buildKeySearch(){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            _expandKeySearch = !_expandKeySearch;
            setState(() {

            });
          },
          child: Container(
            color: transparentColor,
            child: Row(
              children: [
                Text("key Search",style: normalMedium,),
                Spacer(),
                FaIcon(_expandKeySearch ? FontAwesomeIcons.chevronUp :  FontAwesomeIcons.chevronDown ,size: 20,)
              ],
            ),
          ),
        ),
        SizedBox(height: spacing4,),
        Visibility(
          visible: _expandKeySearch,
          child: ListView.builder(itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  _setKey(key: index);
                  /// Scroll to bottom
                  var scrollPosition = _scrollController.position;

                  if (scrollPosition.viewportDimension < scrollPosition.maxScrollExtent) {
                    _scrollController.animateTo(
                      scrollPosition.maxScrollExtent,
                      duration: new Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: CaesarResultItemView(text: _cipherText, cipherKey: index));
          },itemCount: 25,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
        ),

      ],
    );
  }


  Widget _buildResultTextField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Key",style: normalMedium,),
        Row(
          children: [
            Text(_cipherKey.toString(),style: normalRegular,),
            SizedBox(width: spacing3,),
            Expanded(
              child: Slider(value: _cipherKey.toDouble(), onChanged: (value){
                _setKey(key: value.toInt());
              },min: 0,max: 24,inactiveColor: neutral100Color,),
            ),
          ],
        ),
        SizedBox(height: spacing4,),

        CaesarTable(chyiperKey: _cipherKey),
        SizedBox(height: spacing4,),
        Text("Hasil",style: normalMedium,),
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
