import 'package:flutter/material.dart';


FloatingActionButton navigationBarButton(context){
  return new FloatingActionButton(
    onPressed: () {Navigator.pop(context);},
    tooltip: 'Return',
    child: new Icon(Icons.keyboard_return),
    elevation: 4.0,
  );
}

Stack floatingActionButtonsStacked(
    FloatingActionButton leftButton, FloatingActionButton rightButton){
  return Stack(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left:31),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: leftButton,
        ),
      ),

      Align(
          alignment: Alignment.bottomRight,
          child: rightButton,
      ),
    ],
  );
}
