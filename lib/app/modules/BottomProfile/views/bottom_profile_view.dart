import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/BottomProfile/views/points_container.dart';
import 'package:video_editing_app/app/modules/BottomProfile/views/profile_app_bar.dart';
import 'package:video_editing_app/app/modules/BottomProfile/views/profile_container.dart';
import 'package:video_editing_app/app/modules/BottomProfile/views/route_containers.dart';
import '../controllers/bottom_profile_controller.dart';

class BottomProfileView extends GetView<BottomProfileController> {
  BottomProfileView({super.key});

  // callFuture() async {
  //   final AsyncMemoizer memoizer = AsyncMemoizer();
  //   return controller.count.value==0? memoizer.runOnce(() async {
  //     log(' ');
  //     await controller.initUserModelFromApi();
  //     controller.count.value+1;
  //   }):(){};
  // }\
  // callFuture() async {
  //   final AsyncMemoizer memoizer = AsyncMemoizer();
  //   return memoizer.runOnce(() async {
  //     await controller.initUserModelFromApi();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: FutureBuilder(
          // future: callFuture(),
          builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              ProfileAppBar(height, width),
              SizedBox(height: height * 0.034),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Column(
                  children: [
                    Obx(
                      () => buildProfileContainer(
                        height,
                        width,
                        sp,
                        user: controller.userModelFromApi.value,
                        // user: snapshot.data,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    PointsContainer(height, width, sp),
                    SizedBox(height: height * 0.015),
                    ...RouteContainers(height, width, sp),
                    SizedBox(height: height * 0.015),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
