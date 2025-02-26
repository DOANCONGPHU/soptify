
import 'package:flutter/material.dart';

import '../view/trailer._view.dart';

class TrendingNow extends StatelessWidget {
   const TrendingNow({
    super.key, required this.img, required this.label, required this.overview, required this.id,
  });
  final ImageProvider img;
  final String label,overview;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                image: img,
                label: label,
                overview: overview,
                id: id
              ),
            ),
          );
        },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: img,),
      
              Text(label,  
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}