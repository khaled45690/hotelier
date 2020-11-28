import 'package:flutter/material.dart';

class HotelImageEditWidget extends StatelessWidget {
  final String imageURL;

  const HotelImageEditWidget(this.imageURL);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.6,
                  blurRadius: 7,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 5),
            child: Image.network(imageURL),
          ),
          Container(
            width: 60,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                InkWell(
                  onTap: (){print("hello");},
                  child: Container(
                    width: 17,
                    height: 17,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20),
                        ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1.5,
                          blurRadius: 8,
                          offset: Offset(-1, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(child: Text("X")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
