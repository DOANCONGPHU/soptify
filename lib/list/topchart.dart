// import 'package:flutter/material.dart';


// class TopChart extends StatelessWidget {
//   final AssetImage img;
//   final String label;

//   const TopChart({super.key, required this.img, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white10,
//           borderRadius: BorderRadius.circular(4),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Row(
//           children: [
//             Image(
//               image: img,
//               height: 48,
//               width: 48,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(width: 8),
//             Text(label)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../view/topchart_view.dart';

class TopChart extends StatelessWidget {
  final ImageProvider img;
  final String label;

  final double size;
  const TopChart({
    super.key,
    required this.img,
    required this.label,
    this.size = 48,
  });

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
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * (0.45),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(4),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Image(
                image: img,
                height: size,
                width: size,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Text(label)
            ],
          ),
        ));
  }
}
