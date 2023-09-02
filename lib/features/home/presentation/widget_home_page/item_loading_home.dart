import 'package:flutter/material.dart';

import '../../../../components/widget/shimmer_loading.dart';

class ItemLoadingHome extends StatelessWidget {
  const ItemLoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(
            width: 46,
            height: 46,
          ),
          SizedBox(
            width: 16,
          ),
          // Expanded(
          //     child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     ShimmerLoading(
          //       width: 150,
          //       height: 16,
          //     ),
          //     SizedBox(
          //       height: 5,
          //     ),
          //     ShimmerLoading(
          //       width: double.infinity,
          //       height: 28,
          //     ),
          //     SizedBox(
          //       height: 5,
          //     ),
          //     ShimmerLoading(
          //       width: 70,
          //       height: 14,
          //     ),
          //   ],
          // ))
        ],
      ),
    );
  }
}
