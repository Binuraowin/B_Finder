
import 'package:b_finder/Screens/widgets/cstegorySlider.dart';
import 'package:b_finder/models/categoryModel.dart';
import 'package:b_finder/services/database.dart';
import 'package:flutter/material.dart';

class SlectedCategory extends StatefulWidget {
  @override
  _SlectedCategoryState createState() => _SlectedCategoryState();
}

class _SlectedCategoryState extends State<SlectedCategory> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 25,
        child:StreamBuilder<List<CategoryModel>>(
          stream: DatabaseService().getCategories(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildCategory(
                    index,
                    snapshot.data[index].categoryName,
                  snapshot.data[index].id
                )
            );
          },
        ),



      ),
    );
  }
  Widget buildCategory(int index,String categoryName,String catId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ?  Color(0xFF535353) : Color(0xFF535353),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }



}

