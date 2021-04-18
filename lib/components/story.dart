class Story {

  var id = {
    'rabbit_and_turtle': 0
  };

  List<List<String>> data = [


    // story of Rabbit&Turtle accesses through specifying the id
    [
      'A turtle challenge a rabbit for a run.',
      'A rabbit is quite surprise that the turtle said that.',
      'Because he is confident that the turtle can\'t beat him.',
      'A turtle is known for its slow work.',
      'On the other hand, a rabbit is super fast.',
    ]
  ];

  int getId(String keyName) => id[keyName];

  List<String> getStory(int storyId) => data[storyId];

  String getParagraph(int storyId, int whichParagraph) => data[storyId][whichParagraph];

  int maximumParagraph(int storyId) => data[storyId].length;
}