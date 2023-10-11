import 'package:flutter/material.dart';

class PopularArtist extends StatelessWidget {
  final AssetImage image;

  const PopularArtist ({super.key, required this.image});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          CircleAvatar(
            radius: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            "G Dragon, Son Tung, MCK, Tlinh",
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}