
// part of 'mars_repository.dart';

class DummyData {

  static final marsData = '''
  {
    "planetName": "Mars",
    "diameter": 6779,
    "imageThumbnail": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/OSIRIS_Mars_true_color.jpg/220px-OSIRIS_Mars_true_color.jpg",
    "extra": {
        "distanceToSun": 250710000,
        "distanceToEarth": 54600000,
        "facts": [
            "Mars' Tilt of Axis is 25 degrees",
            "The average temperature on Mars is -62.78 Celcius ",
            "1 year on Mars is 687 days on Earth",
            "Mars has two moons: Phobos and Deimos"
        ]
    }
  }''';

  static final String planetsData =
  '''{
    "planets": [
    {
      "planetName": "Mars",
      "diameter": 6779,
      "imageThumbnail": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/OSIRIS_Mars_true_color.jpg/220px-OSIRIS_Mars_true_color.jpg",
      "extra": {
          "distanceToSun": 250710000,
          "distanceToEarth": 54600000,
          "facts": [
              "Mars' Tilt of Axis is 25 degrees",
              "The average temperature on Mars is -62.78 Celcius ",
              "1 year on Mars is 687 days on Earth",
              "Mars has two moons: Phobos and Deimos"
          ]
      }
    },
    {
        "planetName": "Venus",
        "diameter": 12104,
        "imageThumbnail": "http://www.solstation.com/stars/venus.gif",
        "extra": {
            "distanceToSun": 108000000,
            "distanceToEarth": 40000000,
            "facts": [
                "Venus was a song by Banaarama",
                "The Soviet Union visited Venus ",
                "Venus is closer to the sun than earth",
                "Venus comes after Mercury"
            ]
          }
    }
    ]
  }''';

  static String getMars() => marsData;

  static String getPlanets() => planetsData;

}
  
