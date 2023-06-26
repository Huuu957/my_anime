import 'package:flutter/material.dart';
import 'package:my_anime_list/constants.dart';

class AddFavoriteButton extends StatefulWidget {
  const AddFavoriteButton({super.key});

  @override
  _AddFavoriteButtonState createState() => _AddFavoriteButtonState();
}

class _AddFavoriteButtonState extends State<AddFavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });

        if (isFavorite) {
          // Add the anime to favorites
          print('Anime added to favorites');
        } else {
          // Remove the anime from favorites
          print('Anime removed from favorites');
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isFavorite ? kPrimaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          side: BorderSide(
            color: isFavorite ? Colors.white : kPrimaryColor,
          ),
        ),
      ),
      child: Text(
        isFavorite ? 'Got Added' : 'Add To My Favorites',
        style: TextStyle(
          color: isFavorite ? Colors.white : kPrimaryColor,
        ),
      ),
    );
  }
}
