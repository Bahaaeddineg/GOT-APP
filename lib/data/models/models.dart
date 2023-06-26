class MyCharacters {
  late String fullName;
  late String title;
  late String image;
  late String family;
  late String id;

  MyCharacters.fromJson(Map data) {
    //response["results"] is the list that we r gonna  map throw it to create the list of objects
    fullName = data["fullName"];
    title = data["title"];
    image = data["imageUrl"];
    family = data["family"];
    id = data["id"].toString();
  }
}

class Quote {
  late List quote;
  Quote.fromJson(Map data) {
    quote = data["quotes"];
  }
}
