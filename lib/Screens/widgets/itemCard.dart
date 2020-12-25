import 'dart:math';

import 'package:b_finder/Screens/main_screens/description.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
 final String id;
 final String imageUrl;
 final String name;
 final double unitPrice;
 final double latitude;
 final double longitude;
 final String providerName;
 final int providerTel;
 final int units;
 final String description;


  const ItemCard({Key key, this.id, this.imageUrl, this.name, this.unitPrice, this.latitude, this.longitude, this.providerName, this.providerTel, this.units, this.description}) : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState(id,imageUrl,name,unitPrice,latitude,longitude,providerName,providerTel,units,description);
}

class _ItemCardState extends State<ItemCard> {
   final String id;
   final String imageUrl;
   final String name;
   final double unitPrice;
   final double latitude;
   final double longitude;
   final String providerName;
   final int providerTel;
   final int units;
   final String description;

  List colors = [Colors.blue, Colors.green, Colors.yellow];

  Random random = new Random();
   int j = 0;

  _ItemCardState(this.id, this.imageUrl, this.name, this.unitPrice, this.latitude, this.longitude, this.providerName, this.providerTel, this.units, this.description);
  @override
  void initState() {
    // TODO: implement initState
    changeIndex();
  }
   void changeIndex() {
     setState(() => j = random.nextInt(3));
   }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(

          context,
          // Create the SelectionScreen in the next step.
          MaterialPageRoute(builder: (context) => DescriptionPage(
            imageUrl: imageUrl,
            latitude: latitude,
            longitude: longitude,
            productName: name,
            providerTel: providerTel,
            units: units,
            description: description,
            unitPrice: unitPrice,
            providerName: providerName,
          )),


        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: colors[j],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: id,
                child: Image.network(imageUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(
              // products is out demo list
              name,
              style: TextStyle(color: Color(0xFFACACAC)),
            ),
          ),
          Text(
            unitPrice.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
