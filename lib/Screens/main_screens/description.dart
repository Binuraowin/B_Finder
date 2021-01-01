import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DescriptionPage extends StatefulWidget {
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String providerName;
  final int providerTel;
  final int units;
  final String description;
  final double unitPrice;
  final String productName;
  final DateTime date;
  final String address;



  const DescriptionPage({Key key, this.imageUrl, this.latitude, this.longitude, this.providerName, this.providerTel, this.units, this.description, this.unitPrice, this.productName, this.date, this.address}) : super(key: key);@override
  _DescriptionPageState createState() => _DescriptionPageState(imageUrl,latitude,longitude,providerName,providerTel,units,description,unitPrice,productName,date,address);
}

class _DescriptionPageState extends State<DescriptionPage> {
  final String imageUrl;
  final double latitude;
  final double longitude;
  final String providerName;
  final int providerTel;
  final int units;
  final String description;
  final double unitPrice;
  final String productName;
  final DateTime date;
  final String address;

  bool _isOpen = false;
  PanelController _panelController = PanelController();

  _DescriptionPageState(this.imageUrl, this.latitude, this.longitude, this.providerName, this.providerTel, this.units, this.description, this.unitPrice, this.productName, this.date, this.address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Container(
            alignment: Alignment.topCenter,
//            heightFactor: 0.7,
            child: Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }



  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
          Container(
            child: Text(
                DateFormat.yMMMd().format(date)
            ),
          ),
          Container(
            child: Text(
                address,style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 40.0,),
          Container(
            child: Text(
                description
            ),
          ),

//          GridView.builder(
//            primary: false,
//            shrinkWrap: true,
//            padding: EdgeInsets.zero,
//            itemCount: _imageList.length,
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 3,
//              mainAxisSpacing: 16,
//            ),
//            itemBuilder: (BuildContext context, int index) => Container(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage(_imageList[index]),
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//          )
        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => _launchURL(latitude,longitude),
              borderSide: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'Location',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isOpen,
          child: SizedBox(
            width: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: _isOpen
                  ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
                  : double.infinity,
              child: FlatButton(
                onPressed: () => _launchPhone(providerTel),
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Call',
                  style: TextStyle(
                    fontFamily: 'NimbusSanL',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Info Section
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _infoCell(title: 'Units', value: units.toString()),
        Container(
          width: 1,
          height: 40,
          color: Colors.grey,
        ),
        _infoCell(title: 'Unit Price', value: unitPrice.toString()),
//        Container(
//          width: 1,
//          height: 40,
//          color: Colors.grey,
//        ),
//        _infoCell(title: 'Location', value: 'Dusseldorf'),
      ],
    );
  }

  /// Info Cell
  Column _infoCell({String title, String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Text(
            productName,
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          providerName,
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
_launchURL(double lat, double lng) async {
  final String googleMapsUrl = "https://maps.google.com/?q=$lat,$lng";

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}
_launchPhone(int number) async {
  final String googleMapsUrl = "tel:$number";

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Could not launch $googleMapsUrl';
  }
}
