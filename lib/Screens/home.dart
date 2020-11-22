



import 'package:b_finder/Screens/details.dart';
import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue[100],
      body:ListView(
        
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                    IconButton(
            icon: Icon(Icons.arrow_back_ios), 
            color: Colors.white,
            onPressed: (){}),
          Container(
            width: 125.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list), 
                  color: Colors.white,
                  onPressed: (){}),
                   IconButton(
                  icon: Icon(Icons.menu), 
                  color: Colors.white,
                  onPressed: (){})
              ],
            ),
          )
              ],
            ),
            ),
            SizedBox(height: 25.0),
            Padding(padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('BLabs',
                style: TextStyle(
                  fontFamily: 'Monteserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
                ),
                ),
                SizedBox(width: 10.0,),
                Text('Finder',
                style: TextStyle(
                  fontFamily: 'Monteserrat',
                  color: Colors.white,
                  
                  fontSize: 25.0
                ),
                )
              ],
            ),
            ),
            SizedBox(height: 40.0),
            Container(
              height:MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0), bottomRight: Radius.circular(60.0))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height -300.0,
                    child: ListView(
                      children: <Widget>[
                          _buildItem('assets/download1.jpg', 'Foods', '\$24.0'),
                          _buildItem('assets/download2.jpg', 'Computer', '\$24.0'),
                      ],
                    ),
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 65.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:Colors.grey,
                            style: BorderStyle.solid,
                            width:1.0
                          ),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Center(
                          child: Icon(Icons.search, color:Colors.black ),
                        ),
                      ),
                       Container(
                        height: 65.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:Colors.grey,
                            style: BorderStyle.solid,
                            width:1.0
                          ),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Center(
                          child: Icon(Icons.shopping_cart, color:Colors.black),
                        ),
                      ),
                       Container(
                        height: 65.0,
                        width: 100.0,
                        
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:Colors.grey,
                            style: BorderStyle.solid,
                            width:1.0
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black,
                          
                        ),
                        child: Center(
                          child: Text('Checkout',
                          style: TextStyle(
                            
                            color: Colors.white
                          ),
                          ),
                          
                        ),
                      ),
                    ],
                  )
                ],
              )
              
            )
      
        ],
      ),
    );
  }
}

Widget _buildItem(String imgPath, String itemName, String price){
  return Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  child: InkWell(
    onTap: (){
       BuildContext context;
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
