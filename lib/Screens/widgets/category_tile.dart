import 'package:b_finder/models/categoryModel.dart';
import 'package:b_finder/screens/main_screens/subCategoryPage.dart';
import 'package:b_finder/Screens/widgets/home.dart';
import 'package:b_finder/Screens/widgets/sub_category.dart';
import 'package:b_finder/services/database.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
final String imagePath;
final String categoryName;
final String id;

  const CategoryTile({Key key, this.imagePath, this.categoryName, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  child: InkWell(
    onTap: (){

           Navigator.push(context,
            MaterialPageRoute(
        builder:(context) =>SubCategory(id: id,)
         ),);

        //     Navigator.push(context,
        //     MaterialPageRoute(
        // builder:(context) => Details(
        //     name:brew.name,sugars:brew.strength,strength:brew.strength
        // )
        //  ),);
              // Navigator.pushNamed(context, '/');
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Image.network(imagePath),

                height: 75.0,
                width: 75.0,
              ),


        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categoryName,
              style: TextStyle(
                fontFamily: 'Monteserrat',
                fontSize: 17.0,
                fontWeight: FontWeight.bold
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