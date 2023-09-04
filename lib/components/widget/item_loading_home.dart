import 'package:flutter/material.dart';

import 'shimmer_loading.dart';

class ItemLoadingHome extends StatelessWidget {
  const ItemLoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(
            width: 280,
            height: 100,
          ),
          SizedBox(
            width: 10,
          ),
          ShimmerLoading(
            width: 50,
            height: 100,
          ),
        ],
      ),
    );
  }
}
