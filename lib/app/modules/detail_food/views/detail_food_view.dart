import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_food_controller.dart';

class DetailFoodView extends GetView<DetailFoodController> {
  const DetailFoodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.30,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(color: Colors.red,),
              );
            },
          ),
        ],
      ),
    );
  }
}
