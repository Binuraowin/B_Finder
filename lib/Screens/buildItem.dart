import 'package:b_finder/Screens/details.dart';
import 'package:flutter/material.dart';

class buildItem extends StatefulWidget {
  buildItem(String s, String t, String u);


  @override
  _buildItemState createState() => _buildItemState();
}

class _buildItemState extends State<buildItem> {
  get imgPath => this.imgPath;

  get itemName => this.itemName;

  get price => this.price;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  child: InkWell(
    onTap: (){
      //  BuildContext context;
            Navigator.push(context,
            MaterialPageRoute(
        builder:(context) => Details(
            imgPath:imgPath,itemName:itemName,itemPrice:price
        )
         ),);
              // Navigator.pushNamed(context, '/');
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              
              Hero(tag: imgPath,
        child: Image(image: AssetImage(imgPath),
        fit: BoxFit.cover,
        height: 75.0,
        width: 75.0,
        ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              itemName,
              style: TextStyle(
                fontFamily: 'Monteserrat',
                fontSize: 17.0,
                fontWeight: FontWeight.bold
              ),
            ),
             Text(
              price,
              style: TextStyle(
                fontFamily: 'Monteserrat',
                fontSize: 15.0,
                color: Colors.grey
              ),
            )
          ],
        )
            ],
          
          )
        ),
        IconButton(
      icon: Icon(Icons.send),
      color: Colors.black,
      onPressed: (){
       
      },
    )
      ],
    ),
    
  ),
    );
  }
}