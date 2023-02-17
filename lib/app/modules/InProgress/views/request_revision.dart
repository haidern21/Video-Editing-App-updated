import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/InProgress/controllers/in_progress_controller.dart';
import 'package:video_editing_app/app/modules/InProgress/controllers/web_socket_controller.dart';
import 'package:video_editing_app/app/modules/Order/controllers/order_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';

class RequestRevision extends StatefulWidget {
  const RequestRevision({Key? key}) : super(key: key);

  @override
  State<RequestRevision> createState() => _RequestRevisionState();
}
class _RequestRevisionState extends State<RequestRevision> {
  WebSocketController webSocketController = Get.find();
  OrderController orderController= Get.find();
  InProgressController inProgressController= Get.find();
  TextEditingController requestRevisionController= TextEditingController();
  FocusNode requestRevision = FocusNode();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffF9F9FB),
            leading: backButton()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.025),
              MyText(
                text: 'Message',
                size: 12 * sp,
                weight: kfour,
                color: kblack,
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width / 25),
                height: height * 0.23,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: kgrey3,
                  ),
                ),
                child: TextField(
                  controller: requestRevisionController,
                  focusNode: requestRevision,
                  style: TextStyle(
                    fontSize: 12 * sp,
                    fontWeight: kfour,
                    color: kblack,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Type here',
                    hintStyle: TextStyle(
                      fontSize: 12 * sp,
                      fontWeight: kfour,
                      color: kgrey3,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              MyText(
                text: "Instruction",
                size: 14 * sp,
                weight: ksix,
                color: kgrey8,
              ),
              SizedBox(height: height * 0.01),
              MyText(
                text: "1) You can add message in the text-field",
                size: 14 * sp,
                weight: kfour,
                color: kgrey8,
              ),
              SizedBox(height: height * 0.01),
              MyText(
                text:
                "1) Please list all the revisions in the message",
                size: 14 * sp,
                weight: kfour,
                color: kgrey8,
              ),
              const Spacer(),
              SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (requestRevisionController.text.isNotEmpty) {
                        webSocketController.sendRevisionMessage(
                            requestRevisionController.text,
                            orderController.selectedOrder.value?.id ??
                                0);
                      }
                      requestRevisionController.clear();
                      requestRevision.unfocus();
                      inProgressController.fetchQuoteCommunicationsList(
                          orderController.selectedOrder.value?.id ?? 0);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      disabledForegroundColor:
                      const Color(0xff9EA3AE).withOpacity(0.38),
                      disabledBackgroundColor:
                      const Color(0xff9EA3AE).withOpacity(0.12),
                      backgroundColor: kprimaryColor,
                    ),
                    child: const Text('Request Revision'),
                  ),
                ),
              SizedBox(height: height * 0.03)
            ],
          ),
        ),
      ),
    );
  }
}
