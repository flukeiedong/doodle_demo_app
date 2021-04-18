import 'package:flutter/material.dart';
import 'package:doodle_demo_app/widgets/slide.dart';
import 'package:doodle_demo_app/components/story.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class SlideScreen extends StatefulWidget {

  static String routeName = 'slide_screen';

  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {

  Story story = Story();
  bool _isFullScreen = false;

  // At the beginning, the slideList has 2 slides
  // and it's always load the next page in advance.
  List<Slide> slideList = [
    Slide(
        name: 'rabbit_and_turtle',
        paragraph: 0,
    ),
    Slide(
      name: 'rabbit_and_turtle',
      paragraph: 1,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SystemUiOverlayStyle slideStyle = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );

    SystemChrome.setSystemUIOverlayStyle(slideStyle);


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {


    int maxSlide = story.maximumParagraph(story.getId('rabbit_and_turtle'));
    print(maxSlide);

    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.transparent,
        appBar: !_isFullScreen ? AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Title", style: TextStyle(color: Colors.blueGrey)),
          iconTheme: IconThemeData(
              color: Colors.blueGrey,
          ),
        ) : null,

      body: GestureDetector(
        onTap: () {
          if (!_isFullScreen) {
            _isFullScreen = true;
            // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
            // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            //   statusBarColor: Colors.transparent,
            //   systemNavigationBarColor: Colors.transparent,
            // ));
          }
          else {
            _isFullScreen = false;
          }
          print('TAPPING');

          setState(() {

          });
        },
        child: Container(
          padding: EdgeInsets.only(top: 56.0),
          // color: Color(0xFF42E7F1),
          child: PageView.builder(
            onPageChanged: (value) {

              print(value);

              if (slideList.length < value + 2 && slideList.length < maxSlide) {
                print('Adding new Slide to slideList...');
                print(slideList.length);
                slideList.add(
                  Slide(
                    name: 'rabbit_and_turtle',
                    paragraph: slideList.length,
                  )
                );
                print('Current slideList length = ' + slideList.length.toString());
              }
              else {print('No more adding!!!');}
            },
            itemBuilder: (context, index) {
              if (index < maxSlide){
                print('Index value');
                print(index);
                return slideList[index];
              }
              return null;
            },
          ),
        ),
      )
    );
  }
}
