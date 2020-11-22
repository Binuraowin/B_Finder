import 'package:flutter/material.dart';

class Details extends StatefulWidget {
   final imgPath;
    final itemName;
     final itemPrice;
    

  const Details({Key key, this.imgPath, this.itemName, this.itemPrice}) : super(key: key);

 

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[700],
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
         onPressed: (){
           Navigator.of(context).pop();
         }
         ),
         backgroundColor: Colors.transparent,
         elevation: 0.0,
         title: Text('Details',
         style: TextStyle(
           fontFamily: 'Monteserrat',
           fontSize: 18.0,
           color: Colors.white,
         ),
         ),
         centerTitle: true,
         actions: <Widget>[
           IconButton(icon: Icon(Icons.more_horiz),
            onPressed: (){},
            color: Colors.white,
            )
         ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 82.0,
            width:MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
          Positioned(
            top: 75.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                ),
                color: Colors.white
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            )
            )
        ],
      ),
    );
  }
}