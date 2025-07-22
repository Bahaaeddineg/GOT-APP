import 'package:equatable/equatable.dart';

class MyCharacters {
  late String fullName;
  late String title;
  late String image;
  late String family;
  late String id;
  late String quote;
  MyCharacters.fromJson(Map data) {
    fullName = data["fullName"];
    title = data["title"];
    image = data["imageUrl"];
    family = data["family"];
    id = data["id"].toString();
    quote='';
  }
}

class Quote extends Equatable{
  late List quote;
  Quote.fromJson(Map data) {
    quote = data["quotes"];
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [quote];

}
