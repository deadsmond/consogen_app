import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:consogen_app/resources/objects/widgets/side_bar_menu.dart';
import 'package:consogen_app/resources/objects/widgets/app_bar.dart';
import 'package:consogen_app/resources/objects/widgets/text_styles.dart';


class GeneratorRoute extends StatefulWidget {
  @override
  _GeneratorRouteState createState() => _GeneratorRouteState();
}

class _GeneratorRouteState extends State<GeneratorRoute> {

  // query variables
  String _query = "Illuminati";
  String _depth = "3";

  // NETWORK PARSED RESPONSE
  Map <String, dynamic> parsedResponse = {"messages": [], "error": ""};

  //-------------------------- NETWORK CONTENT ---------------------------------
  Future<Map <String, dynamic>> sendRequest(String query, String depth) async {
    http.Response _response;
    _response = await http.post(
        'https://deadsmond.pythonanywhere.com/consogen/json',
        headers: {"Content-type": "application/json"},
        body: json.encode({"search": "$query", "depth": "$depth"})
    );

    return json.decode(_response.body);
  }

  // User Interface
  ListTile textInput(){
    return new ListTile(
      title: Text('Choose target', style: header()),
      trailing: new Container(
        width: 150.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              flex: 3,
              child: new TextField(
                textAlign: TextAlign.end,
                decoration:
                new InputDecoration.collapsed(hintText: '$_query'),
                onChanged: (text) {
                  _query = text;
                },
                toolbarOptions: ToolbarOptions(
                    copy: true,
                    selectAll: true,
                    cut: true,
                    paste: true
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile depthInput(){
    return new ListTile(
      title: Text('Set search depth', style: header()),
      trailing: new Container(
        width: 150.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              flex: 3,
              child: new DropdownButton<String>(
                items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                        value,
                        textAlign: TextAlign.right
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _depth = value;
                  });
                },
                value: _depth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded queryResults(){
    // QUERY RESULTS
    if(parsedResponse['messages'].isEmpty){
      return Expanded(child: new Card());
    } else {
      return new Expanded(
        child: new ListView.separated(
          itemCount:parsedResponse['messages'].length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.remove_red_eye),
              title:  SelectableText(
                  parsedResponse['messages'][index]['header'] + "\n\n" +
                      parsedResponse['messages'][index]['line'] + "\n" ,
                  showCursor: true,
                  toolbarOptions: ToolbarOptions(
                      copy: true,
                      selectAll: true,
                      cut: false,
                      paste: false
                  ),
                  style: bodyText()
              ),
              subtitle: !parsedResponse['messages'][index]['link'].isEmpty ?
                Text('Linked to: ' + parsedResponse['messages'][index]['link'] ?? '')
                : Text(''),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      );
    }
  }

  Card errorCard(){
    if(parsedResponse['error'].isEmpty){
      return Card();
    } else {
      return Card( //                           <-- Card widget
        child: ListTile(
          leading: Icon(Icons.error_outline),
          title: Text(
              parsedResponse['error'],
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  color: Colors.redAccent
              )
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body:

      // BODY
      new Column(
        children: <Widget>[
          // QUERY INPUT
          textInput(),
          // DEPTH DROPDOWN LIST
          depthInput(),
          // QUERY RESULTS - ternary operator
          queryResults(),
          // ERROR RESULTS
          errorCard(),
          // FOOTER TILE
          footerTile(),
        ],
      ),

      // SIDE PANEL MENU
      drawer: sideBarMenu(context),

      // NAVIGATION BAR
      floatingActionButton: new FloatingActionButton(
        elevation: 4.0,
        onPressed: () {
          sendRequest(_query, _depth).then((value){
            setState(() {
              parsedResponse = value;
            });
          });
        }, // run query
        tooltip: 'Search for conspiracy',
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
