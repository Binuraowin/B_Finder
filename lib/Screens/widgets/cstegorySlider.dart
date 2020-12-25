import 'package:flutter/material.dart';

class CategoySlider extends StatefulWidget {
  final int index;
  final String categoryName;

  const CategoySlider({Key key, this.index, this.categoryName}) : super(key: key);
  @override
  _CategoySliderState createState() => _CategoySliderState(index , categoryName);
}

class _CategoySliderState extends State<CategoySlider> {
  int selectedIndex = 0;
  final int index;
  final String categoryName;

  _CategoySliderState(this.index, this.categoryName);
  @override
  Widget build(BuildContext context) {
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
                color: selectedIndex == index ? Color(0xFF535353) : Color(0xFF535353),
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
