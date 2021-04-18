import 'package:flutter/material.dart';
import 'package:doodle_demo_app/components/story.dart';


Story story = Story();

class Slide extends StatelessWidget {

  Slide({this.name, this.paragraph});

  String name;
  int paragraph;


  @override
  Widget build(BuildContext context) {
    int pageNumber = paragraph + 1;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Paragraph(
            text: story.getParagraph(story.getId(name), paragraph),
          //text: 'test'
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Image(
            image: AssetImage('images/turtle.png'),
          ),
        ),
        Flexible(
          flex: 1,
          child: Text('Page $pageNumber/' + story.maximumParagraph(story.getId(name)).toString()
          ),
        ),
      ],
    );
  }
}

class Paragraph extends StatelessWidget {

  Paragraph({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Text('\t' + text,
              style: TextStyle(fontSize: 28.0)
          ),
        )
    );
  }
}
