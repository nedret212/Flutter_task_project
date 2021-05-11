class StringsModel{
  static String highlightTitle="Premier League Highlights";
  static String url="https://v3.football.api-sports.io/";
  static String fixtureAddress="fixtures";
  static String standingsAddress="standings";
  static String standings="STANDINGS";
  static String fixtures="FIXTURES";
  static String get="get";


  static Map<String, dynamic> fixtureParameters={
    "season": 2019,
    "league":39
  };
  static Map<String, dynamic> fixtureHeaders={
    "x-rapidapi-key": "12c6bdab2cce16ad261220703ea9e6c0",
    "x-rapidapi-host": "v3.football.api-sports.io"
  };
}