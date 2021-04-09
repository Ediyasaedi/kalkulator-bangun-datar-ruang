import 'package:flutter/material.dart';

class CardMenu extends StatefulWidget {
  final String title;
  final String imgUrl;
  final int index;

  CardMenu(this.title, this.imgUrl, this.index);
  @override
  _CardMenuState createState() => _CardMenuState(title, imgUrl, index);
}

class _CardMenuState extends State<CardMenu> {
  String title;
  String imgUrl;
  int index;

  _CardMenuState(this.title, this.imgUrl, this.index);

  @override
  Widget build(BuildContext context) {
    // void _navigatePage(int index) {
    //   switch (index) {
    //     case 0:
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => JournalPage()));
    //       break;
    //     case 1:
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => GroupPage()));
    //       break;
    //     case 2:
    //       Navigator.of(context).push(
    //           MaterialPageRoute(builder: (context) => BikeShowcasePage()));
    //       break;
    //     default:
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (context) => MeetupPage()));
    //   }
    // }

    return Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 25.0, top: 5.0, right: 25.0, bottom: 55.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: InkWell(
              onTap: () {
                // _navigatePage(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Expanded(child: Image.asset(imgUrl, fit: BoxFit.fitWidth)),
                  Center(
                    child: Text(title,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
