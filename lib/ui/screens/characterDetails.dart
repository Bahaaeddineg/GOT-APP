import 'package:flutter/material.dart';
import 'package:tvseries/data/models/models.dart';

class CharacterDetails extends StatelessWidget {
  final MyCharacters character;
  CharacterDetails({required this.character});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
    );
  }
}
