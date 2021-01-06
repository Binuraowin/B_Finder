
import 'package:b_finder/Screens/widgets/PostContainer.dart';
import 'package:b_finder/models/subCategoryModel.dart';
import 'package:b_finder/services/database.dart';
import 'package:b_finder/shared/loading.dart';
import 'package:flutter/material.dart';

class Streammm extends StatefulWidget {
  final String id;

  const Streammm({Key key, this.id}) : super(key: key);
  @override
  _StreammmState createState() => _StreammmState(id);
}

class _StreammmState extends State<Streammm> {
  final String id;

  _StreammmState(this.id);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: StreamBuilder<List<SubCategoryModel>>(
        stream: DatabaseService().getSubCategories(id),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Loading();
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
    );
  }
}
