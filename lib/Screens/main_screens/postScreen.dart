import "dart:async";
import 'package:b_finder/models/categoryModel.dart';
import 'package:b_finder/models/subCategoryModel.dart';
import 'package:b_finder/services/auth.dart';
import 'package:b_finder/services/database.dart';
import 'package:b_finder/Screens/widgets/PostContainer.dart';
import 'package:b_finder/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatefulWidget {

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  String id;
  int selectedIndex = 0;
  String district;
  bool loading = false;
  final AuthService _auth = AuthService();

  _ProductPageState();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
//        title:  Text('B FINDER',
//          style: TextStyle(
//              fontFamily: 'Monteserrat',
//              color: Colors.blue[200],
//              fontWeight: FontWeight.bold,
//              fontSize: 25.0
//          ),
//        ),

        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person , color: Colors.grey[500],),
              label: Text('logout',
                style: TextStyle(color: Colors.grey[500]),
              )
          ),
        ],
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                              setState(() {
                                this.district = valueSelectedByUser;
                              });

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
            (id == null)?
            Expanded(
              flex: 1,
              child: StreamBuilder<List<SubCategoryModel>>(
                stream:DatabaseService().getSubCategorieswithoutid(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
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
                            categoryId: snapshot.data[index].categoryId,
                            providerImage: snapshot.data[index].providerImage,
                            district: snapshot.data[index].district,
                            address: snapshot.data[index].address,

                          );
                        }
                    );
                  }
                },
              ),
            )
            :district   == null ?
            Expanded(
             flex: 1,
             child: StreamBuilder<List<SubCategoryModel>>(
               stream:DatabaseService().getSubCategories(id),
               builder: (context,snapshot){
                 if(!snapshot.hasData){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }else {
                   return ListView.builder(
                       itemCount: snapshot.data.length,
                       itemBuilder: (context, index) {
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
                           categoryId: snapshot.data[index].categoryId,
                           providerImage: snapshot.data[index].providerImage,
                           district: snapshot.data[index].district,
                           address: snapshot.data[index].address,

                         );
                       }
                   );
                 }
               },
             ),
           ):
           Expanded(
             flex: 1,
             child: StreamBuilder<List<SubCategoryModel>>(
               stream: DatabaseService().getSortedSubCategories(id, district),
               builder: (context,snapshot){
                    if(!snapshot.hasData){
                    return Center(
                    child: CircularProgressIndicator(),
                    );
                    }else {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
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
                              categoryId: snapshot.data[index].categoryId,
                              providerImage: snapshot.data[index]
                                  .providerImage,
                              district: snapshot.data[index].district,
                              address: snapshot.data[index].address,

                            );
                          }
                      );
                    }
               },
             ),
           ),

          ],
        )

    );

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

  Future<void> _shoeerror() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank you For Join with Us !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
//                    Icon(Icons.error_outline,color: Colors.red,),
                    Text('Select the Category to proceed '),
                 //   Text(' and Location',style: TextStyle(color: Colors.red),),
                  ],
                )


              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  id=' RN62p5KZAtk48mGL2n66';
                });
              },
            ),
          ],
        );
      },
    );
  }
}
