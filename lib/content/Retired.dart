import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';

class Retired extends StatefulWidget {
  Retired({Key key}) : super(key: key);

  @override
  _RetiredState createState() => _RetiredState();
}

class _RetiredState extends State<Retired> {
  final translator = GoogleTranslator();
  bool _loading = false;
  String _currentSelectedValue = 'English';
  String translatedTh1;
  String translatedText1;
  String translatedText2;
  String translatedTh2;
  String translatedText3;
  String translatedTh3;
  String translatedText4;
  String translatedTh4;
  String translatedText5;
  String translatedTh5;
  String translatedText6;
  String translatedTh6;
  String translatedText7;
  String translatedTh7;
  String translatedText8;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Retired Page"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
            // YoutubePlayer(
            //   controller: _controller,
            //   showVideoProgressIndicator: true,
            //   progressIndicatorColor: Colors.amber,
            //   onReady: () {
            //     // _controller.addListener(listener);
            //   },
            // ),
 Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ytmidschool,
                    
                    onLoadStart: (InAppWebViewController controller, String url) {

                    },
                    onLoadStop: (InAppWebViewController controller, String url) {

                    },
                  ),
                ),
              
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Center(
                    child: Text(
                      "Motivation",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            "English",
                            style: TextStyle(fontSize: 18),
                          ),
                          iconDisabledColor: Colors.transparent,
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) async {
                            setState(() {
                              _loading = true;
                            });
                                Translation translated1 = await translator.translate(
                                LanguageCodes.retiredh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.retiredText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.retiredText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.retiredh2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.retiredText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated6 = await translator.translate(
                                LanguageCodes.retiredh3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated7 = await translator.translate(
                                LanguageCodes.retiredText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated8 = await translator.translate(
                                LanguageCodes.retiredh4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated9 = await translator.translate(
                                LanguageCodes.retiredText5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated10 = await translator.translate(
                                LanguageCodes.retiredh5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated11 = await translator.translate(
                                LanguageCodes.retiredText6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated12 = await translator.translate(
                                LanguageCodes.retiredh6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated13 = await translator.translate(
                                LanguageCodes.retiredText7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated14 = await translator.translate(
                                LanguageCodes.retiredh7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated15 = await translator.translate(
                                LanguageCodes.retiredText7,
                                to: LanguageCodes.launguage_codes[newValue]);

                            setState(() {
                              _currentSelectedValue = newValue;
                              translatedTh1 = translated1.text;
                              translatedText1 = translated2.text;
                              translatedText2 = translated3.text;
                              translatedTh2 = translated4.text;
                              translatedText3 = translated5.text;
                              translatedTh3 = translated6.text;
                              translatedText4 = translated7.text;
                              translatedTh4 = translated8.text;
                              translatedText5 = translated9.text;
                              translatedTh5 = translated10.text;
                              translatedText6 = translated11.text;
                              translatedTh6 = translated12.text;
                              translatedText7 = translated13.text;
                              translatedTh7 = translated14.text;
                              translatedText8 = translated15.text;

                              _loading = false;
                            });
                          },
                          items: <String>[
                            'English',
                            'Hindi',
                            'Marathi',
                            'Punjabi','Telugu','Tamil'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                Text(translatedTh1 ?? "Please Select Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),  
                  ),

                 Image.network("https://media2.s-nbcnews.com/j/newscms/2020_17/3322721/200424-helping-seniors-al-0943_40686507b94677088f93ed2cb2780dac.fit-2000w.jpg"),

                 Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText1 ?? ""),
            ), 
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText2 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh2 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText3 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh3 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText4 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh4 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText5 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh5 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText6 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh6 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText7 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh7 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText8 ?? ""),
            ),



              ],)
            )
          ],
        ));
  }
}
