import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/get_reward_two_controller.dart';

class GetRewardTwoView extends GetView<GetRewardTwoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetRewardTwoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GetRewardTwoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
