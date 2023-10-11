
import 'package:flutter/material.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({
    super.key, required this.img, required this.label,
  });
  final ImageProvider img;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: img,
          width: 120,
          height: 120,),
          const SizedBox(height: 5,),
          Text(label,  
          softWrap: true,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}