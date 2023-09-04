import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/config/app_const.dart';
import '../../../components/widget/card_item.dart';

import './my_favorite_controller.dart';

class MyFavoriteScreen extends GetView<MyFavoriteController> {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favorite Team'),
            centerTitle: true,
          ),
          body: SafeArea(
              child: FirebaseAnimatedList(
                  padding: const EdgeInsets.only(top: 10, bottom: 100),
                  query: ctrl.fb.child("listFav"),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    final data = snapshot.value as Map;
                    return CardItem(
                      strTeam: data['strTeam'] as String,
                      strTeamBadge: data['strTeamBadge'],
                      onTap: () => ctrl.toDetailProduct(data),
                      handleRight: () =>
                          ctrl.toDeleteListFav(snapshot.key, data['index']),
                      assetItem: AppConst.assetTrash,
                    );
                  })),
        );
      },
    );
  }
}
