import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../tv_demo_detail_screen.dart';

class TvHomeScreen extends StatefulWidget {
  const TvHomeScreen({Key? key}) : super(key: key);

  @override
  State<TvHomeScreen> createState() => _TvHomeScreenState();
}

class _TvHomeScreenState extends State<TvHomeScreen> {
  List<String> bannerList = [
    'https://www.gstatic.com/webp/gallery/1.jpg',
    'https://www.gstatic.com/webp/gallery/2.jpg',
    'https://www.gstatic.com/webp/gallery/3.jpg',
    'https://www.gstatic.com/webp/gallery/4.jpg',
    'https://www.gstatic.com/webp/gallery/5.jpg',
  ];
  PageController controller = PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: Stack(
                children: [
                  ListView.builder(
                    itemBuilder: (context, pos) {
                      return pageItem('https://www.gstatic.com/webp/gallery/${pos + 2}.jpg');
                    },
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                  /*Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: bannerList.length,
                        effect: const WormEffect(
                          dotHeight: 5,
                          dotWidth: 20,
                          type: WormType.normal,
                          activeDotColor: Colors.blueAccent,
                        ),
                      ),
                    ),
                  )*/
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Most Watched',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, pos) {
                  return listItem('https://www.gstatic.com/webp/gallery/${pos + 1}.jpg');
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Recently Released',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, pos) {
                  return listItem('https://www.gstatic.com/webp/gallery/${pos + 1}.jpg');
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Today\'s Hit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemBuilder: (context, pos) {
                  return listItem('https://www.gstatic.com/webp/gallery/${pos + 1}.jpg');
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }

  listItem(String img) {
    return InkWell(
      focusColor: Colors.blue,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Image.network(
          img,
          height: 150,
          width: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  pageItem(String img) {
    return InkWell(
      focusColor: Colors.blue,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TvDemoDetailScreen()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Image.network(
          img,
          height: 230,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
