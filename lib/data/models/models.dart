class MyCharacters{
  late String name;
  late String gender;
  late String image;
  late String species;

  MyCharacters.fromJson(Map data){      //response["results"] is the list that we r gonna  map throw it to create the list of objects                            
    name=data["name"];
    gender=data["gender"];
    image=data["image"];
    species=data["species"];
  }
}
