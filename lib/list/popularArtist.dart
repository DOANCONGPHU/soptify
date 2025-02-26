import 'package:flutter/material.dart';

class PopularArtist extends StatelessWidget {
  final ImageProvider image;
  final String label;
  const PopularArtist ({super.key, required this.image, required this.label});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
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
          const SizedBox(height: 7,),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}