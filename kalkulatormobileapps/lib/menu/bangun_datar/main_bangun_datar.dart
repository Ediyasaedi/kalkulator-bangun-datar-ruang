import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'card_menu.dart';

class MainBangunDatar extends StatefulWidget {
  @override
  _MainBangunDatarState createState() => _MainBangunDatarState();
}

class BangunDatarModel {
  String name;
  String imgUrl;
  BangunDatarModel(this.name, this.imgUrl);
}

final List imgList = [
  BangunDatarModel('Segi Empat', 'assets/imgs/square.png'),
  BangunDatarModel('Persegi Panjang', 'assets/imgs/rectangle.png'),
  BangunDatarModel('Segitiga', 'assets/imgs/triangle.png'),
  BangunDatarModel('Layang-layang', 'assets/imgs/layang.png'),
  BangunDatarModel('Jajar Genjang', 'assets/imgs/jajargenjang.png'),
  BangunDatarModel('Belah Ketupat', 'assets/imgs/belahketupat.png'),
  BangunDatarModel('Trapesium', 'assets/imgs/trapesium.png'),
  BangunDatarModel('Lingkaran', 'assets/imgs/circle.png'),
];

final List<Widget> imageSliders = imgList
    .map((item) => CardMenu(item.name, item.imgUrl, imgList.indexOf(item)))
    .toList();

class _MainBangunDatarState extends State<MainBangunDatar> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: Text("Pilih Bangun Datar",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 400,
          width: SizeConfig.screenWidth,
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45.0, right: 45.0, top: 15.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(4.0)),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "BANGUN DATAR",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
