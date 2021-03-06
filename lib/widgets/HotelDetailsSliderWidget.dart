import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelier/Constant/Constant.dart';
import 'package:hotelier/screens/FullScreenPhotoViewer.dart';
import 'package:hotelier/screens/HotelImageViewer.dart';

class HotelDetailsSliderWidget extends StatelessWidget {
  final List imgList;
  final Function onChange;
  final int currentIndex;
  final String text;
  const HotelDetailsSliderWidget({Key key, this.text ,this.imgList , this.currentIndex ,this.onChange}) : super(key: key);

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
// aspectRatio: 1 / 0.2,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: false,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            scrollDirection: Axis.horizontal,
             onPageChanged: (index , reason) => onChange(index , reason),
          ),

          items: imgList.map((imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HotelImageViewer(imgList)));
                  },
                  child: Container(
                    width: 300,
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0.3,
                            blurRadius: 5,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        image: DecorationImage(fit: BoxFit.fill , image: Image.network(
                          '${anotherServerURL}Content/Images/$imgUrl', width: 100,
                        ).image)
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imgList, (index, url) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.black),
                shape: BoxShape.circle,

                color: currentIndex == index ? Colors.black : Colors.transparent,
              ),
            );
          }),
        ),

      ],),
    );
  }
}


