import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/config/app_const.dart';
import './my_favorite_controller.dart';

class MyFavoriteScreen extends GetView<MyFavoriteController> {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child:
                            Image.asset(AppConst.assetsLogo, fit: BoxFit.fill),
                      ),
                      const SizedBox(
                        height: 151 * 1.2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
