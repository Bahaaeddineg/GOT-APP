import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../screens/characterDetails.dart';

// ignore: non_constant_identifier_names
Padding CharactersWidget(List characters, BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: GridView.builder(
      itemCount: characters.length - 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) => Container(
        color: MyColors.white,
        padding: const EdgeInsetsDirectional.all(4),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed('/details', arguments: characters[index]),
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.black54,
              child: Text(
                characters[index].name,
                style: TextStyle(
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(characters[index].image),
            ),
          ),
        ),
      ),
    ),
  );
}
