import 'package:flutter/material.dart';
import 'package:talkjs_demo/tv_demo_detail_screen.dart';

class TvDemoScreen extends StatefulWidget {
  const TvDemoScreen({Key? key}) : super(key: key);

  @override
  State<TvDemoScreen> createState() => _TvDemoScreenState();
}

class _TvDemoScreenState extends State<TvDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/1.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/2.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/3.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/1.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/2.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/3.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/1.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/2.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    child: Image.network(
                      'https://www.gstatic.com/webp/gallery/3.jpg',
                      height: 150,
                      width: 220,
                      fit: BoxFit.cover,
                    ))),
          ],
        ),

      ]),
    );
  }
}
