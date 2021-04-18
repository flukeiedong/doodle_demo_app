import 'package:doodle_demo_app/constants.dart';
import 'package:doodle_demo_app/screens/preference_screen.dart';
import 'package:doodle_demo_app/screens/slide_screen.dart';
import 'package:flutter/material.dart';
import 'package:doodle_demo_app/components/story.dart';
import 'package:doodle_demo_app/widgets/cover_page.dart';
import 'package:doodle_demo_app/widgets/button_with_icon.dart';

class CatalogScreen extends StatefulWidget {

  static String routeName = 'catalog_screen';

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

  PageController controller = PageController(
    initialPage: 0,
  );

  Container _buildNavigationBar(PageController pageController){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      color: Color(0x99FFCE2F),
      // color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ButtonWithIcon(
              icon: Icons.home,
              name: 'Main',
              onTap: (){
                print('TAPPING');
                pageController.animateToPage(
                    0,
                    duration: Duration(milliseconds: 50),
                    curve: Curves.easeIn
                );
              },
            ),
          ),
          Expanded(
            child: ButtonWithIcon(
              icon: Icons.thumb_up,
              name: 'Recommend',
              onTap: (){
                print('TAPPING');
                pageController.animateToPage(
                    1,
                    duration: Duration(milliseconds: 50),
                    curve: Curves.easeIn
                );
              },
            ),
          ),
          Expanded(
            child: ButtonWithIcon(
              icon: Icons.favorite,
              name: 'Favorite',
              onTap: (){
                print('TAPPING');
                pageController.animateToPage(
                    2,
                    duration: Duration(milliseconds: 50),
                    curve: Curves.easeIn
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<CoverPage> coverPages = [
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
      CoverPage(width: screenWidth/3),
    ];

    return Scaffold(
      bottomNavigationBar: _buildNavigationBar(controller),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.table_rows_rounded, color: Colors.white,),
        ),
        title: Text('CatalogScreen', style: kTitleTextStyle),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, PreferenceScreen.routeName);
              },
              icon: Icon(Icons.face, size: 32.0, color: Colors.white,),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, SlideScreen.routeName);
          // Story story = Story();
          // print(story.getId('rabbit_and_turtle'));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: PageView(
        controller: controller,
        children: [
          Catalog(
            // Main catalog
            coverPages: coverPages,
          ),
          Catalog(
            // Recommend catalog
            coverPages: [CoverPage(width: screenWidth/3),CoverPage(width: screenWidth/3),],
          ),
          Catalog(
            // Favorite catalog
            coverPages: [CoverPage(width: screenWidth/3),],
          ),
        ]
      ),
    );
  }
}

class Catalog extends StatefulWidget {

  Catalog({this.coverPages});

  List<CoverPage> coverPages;

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),

        padding: EdgeInsets.all(16.0),
        itemCount: widget.coverPages.length,
        itemBuilder: (context, index) {
          return widget.coverPages[index];
        }
    );
  }
}


