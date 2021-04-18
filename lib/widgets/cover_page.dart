import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {

  CoverPage({this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            // Go to slideScreen.
            print('Tapping on cover page');
          },
          child: Container(
            padding: EdgeInsets.all(8.0),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(1.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            width: width,
            child: Column(
              children: [
                Text('Rabbit and Turtle'),
                Image(
                  image: AssetImage('images/turtle.png'),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text('rabbit&turtle'),
        Text('20 pages')
      ],
    );
  }
}
