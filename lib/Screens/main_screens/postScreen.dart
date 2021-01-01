
import 'package:b_finder/models/categoryModel.dart';
import 'package:b_finder/models/subCategoryModel.dart';
import 'package:b_finder/services/database.dart';
import 'package:b_finder/Screens/widgets/PostContainer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatefulWidget {
  final String clubName;

  const ProductPage({Key key, this.clubName}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState(clubName);
}

class _ProductPageState extends State<ProductPage> {
  final String clubName;
  String id ;
  int selectedIndex = 0;
  String district;

  _ProductPageState(this.clubName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0,),
            Padding(
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
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('district').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
//                      child: CupertinoActivityIndicator(),
                    );

                  return Container(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(12.0, 10.0, 10.0, 10.0),
                              child: Text(
                                "District",
                              ),
                            )),
                        new Expanded(
                          flex: 4,
                          child: DropdownButton(
                            value: district,

                            isDense: true,
                            onChanged: (valueSelectedByUser) {
                              this.district = valueSelectedByUser;
                              print(district);
//                              _onShopDropItemSelected(valueSelectedByUser);
                            },
                            hint: Text('Sort By District'),
                            items: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return DropdownMenuItem<String>(
                                value: document.data()['Name'],

                                child: Text(document.data()['Name'] ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
           district  == null ?  Expanded(
             flex: 1,
             child: StreamBuilder<List<SubCategoryModel>>(
               stream: DatabaseService().getSubCategories(id),
               builder: (context,snapshot){
                 return ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (context,index){
                       return PostContainer(
                         id: snapshot.data[index].listId,
                         likes: snapshot.data[index].likes,
                         views: snapshot.data[index].views,
                         imageUrl: snapshot.data[index].imageUrl,
                         longitude: snapshot.data[index].longitude,
                         latitude: snapshot.data[index].latitude,
                         providerName: snapshot.data[index].providerName,
                         providerTel: snapshot.data[index].providerTel,
                         units: snapshot.data[index].units,
                         description: snapshot.data[index].description,
                         unitPrice: snapshot.data[index].unitPrice,
                         name: snapshot.data[index].name,
                         date: snapshot.data[index].date,
                         providerId: snapshot.data[index].providerId,
                         categoryId: snapshot.data[index].categoryId ,
                         providerImage: snapshot.data[index].providerImage,
                         district: snapshot.data[index].district,
                         address: snapshot.data[index].address,

                       );
                     }
                 );
               },
             ),
           ):
           Expanded(
             flex: 1,
             child: StreamBuilder<List<SubCategoryModel>>(
               stream: DatabaseService().getSortedSubCategories(id, district),
               builder: (context,snapshot){
                 return ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (context,index){
                       return PostContainer(
                         id: snapshot.data[index].listId,
                         likes: snapshot.data[index].likes,
                         views: snapshot.data[index].views,
                         imageUrl: snapshot.data[index].imageUrl,
                         longitude: snapshot.data[index].longitude,
                         latitude: snapshot.data[index].latitude,
                         providerName: snapshot.data[index].providerName,
                         providerTel: snapshot.data[index].providerTel,
                         units: snapshot.data[index].units,
                         description: snapshot.data[index].description,
                         unitPrice: snapshot.data[index].unitPrice,
                         name: snapshot.data[index].name,
                         date: snapshot.data[index].date,
                         providerId: snapshot.data[index].providerId,
                         categoryId: snapshot.data[index].categoryId ,
                         providerImage: snapshot.data[index].providerImage,
                         district: snapshot.data[index].district,
                         address: snapshot.data[index].address,

                       );
                     }
                 );
               },
             ),
           ),


          ],
        ));
  }

  Widget buildCategory(int index,String categoryName,String catId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          id= catId;
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
