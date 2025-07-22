import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../cubit/charCubit/tvseries_cubit.dart';

// ignore: non_constant_identifier_names
Padding CharactersWidget(List characters, BuildContext ctx) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: GridView.builder(
      itemCount: characters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) => Container(
        color: MyColors.white,
        padding: const EdgeInsetsDirectional.all(4),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/details', arguments: characters[index]);
          },
          child: GridTile(
            footer: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.black54,
              child: Text(
                characters[index].fullName,
                style: TextStyle(
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            child: Hero(
              tag: characters[index].id,
              child:FadeInImage.assetNetwork(fit: BoxFit.cover,image: characters[index].image, placeholder: 'assets/images/loading.gif',),
              ),
            ),
          ),
        ),
      ),
    
  );
}
