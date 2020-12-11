
import 'package:b_finder/cofig/palette.dart';
import 'package:b_finder/models/categoryModel.dart';
import 'package:b_finder/Screens/widgets/category_tile.dart';
import 'package:b_finder/services/database.dart';
import 'package:flutter/material.dart';

class CategoryMainPage extends StatefulWidget {
  @override
  _CategoryMainPageState createState() => _CategoryMainPageState();
}

class _CategoryMainPageState extends State<CategoryMainPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
            children: [

              Expanded(
                flex: 1,
                child: StreamBuilder<List<CategoryModel>>(
                  stream: DatabaseService().getCategories(),
                  builder: (context,snapshot){
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,index){
                          return CategoryTile(
                            imagePath:snapshot.data[index].imagePath,
                            categoryName: snapshot.data[index].categoryName,
                            id: snapshot.data[index].id,

                          );

                        }
                    );
                  },
                ),
              )
            ],
          )



      );










  }
}