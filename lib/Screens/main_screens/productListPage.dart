
import 'package:b_finder/Screens/widgets/categorySelectwidget.dart';
import 'package:b_finder/Screens/widgets/itemCard.dart';
import 'package:b_finder/models/subCategoryModel.dart';
import 'package:b_finder/services/database.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  String id = 'wQUQRzDTubHd8KwI2wLg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Bfinder'),
//        leading: IconButton(
//         icon: Ico,
//          onPressed: () {},
//        ),
//        actions: <Widget>[
//          IconButton(
//            icon: SvgPicture.asset(
//              "assets/icons/search.svg",
//              // By default our  icon color is white
//              color: Color(0xFF535353),
//            ),
//            onPressed: () {},
//          ),
//          IconButton(
//            icon: SvgPicture.asset(
//              "assets/icons/cart.svg",
//              // By default our  icon color is white
//              color: Color(0xFF535353),
//            ),
//            onPressed: () {},
//          ),
//          SizedBox(width: 20.0 / 2)
//        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'BFinder',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
//         GestureDetector(
//         onTap: () async{
//    final String catId = await Navigator.push(context,
//    // Create the SelectionScreen in the next step.
//    MaterialPageRoute(builder: (context) => SlectedCategory()),
//    );
//    id=catId;
//    },
//         ),

         SlectedCategory(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StreamBuilder<List<SubCategoryModel>>(
                stream: DatabaseService().getSubCategories(id),
                builder: (context, snapshot) {
                  return GridView.builder(
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return ItemCard(
                          imageUrl: snapshot.data[index].imageUrl,
                          name: snapshot.data[index].name,
                          id: snapshot.data[index].listId ,
                          unitPrice:snapshot.data[index].unitPrice,
                        );
                      }
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
