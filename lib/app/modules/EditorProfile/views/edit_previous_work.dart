import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editing_app/app/modules/EditorProfile/controllers/editor_profile_controller.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../../Utils/network_utils.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/login_field.dart';

class EditPreviousWork extends StatefulWidget {
  const EditPreviousWork({Key? key}) : super(key: key);

  @override
  State<EditPreviousWork> createState() => _EditPreviousWorkState();
}

class _EditPreviousWorkState extends State<EditPreviousWork> {
  File? video;
  Uint8List? videoThumbNail;

  bool showLoader = false;
  late CachedVideoPlayerController controller;
  bool isPlayingVideo = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // @override
  // void dispose() {
  //
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final sp = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: kgrey6,
              size: 18,
            ),
          ),
          title: MyText(
            text: 'Add Your Work',
            color: kblack,
            weight: FontWeight.w400,
            size: 16,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    var picker = await ImagePicker().pickVideo(
                      source: ImageSource.gallery,
                    );
                    final uint8list = await VideoThumbnail.thumbnailData(
                      video: picker!.path,
                      imageFormat: ImageFormat.JPEG,
                      maxWidth: 128,
                      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
                      quality: 100,
                    );
                    setState(() {
                      video = File(picker.path);
                      videoThumbNail = uint8list;
                    });
                  },
                  child: isPlayingVideo == false
                      ? Container(
                          height: Get.height * .3,
                          width: Get.width,
                          decoration: BoxDecoration(
                              image: videoThumbNail != null
                                  ? DecorationImage(
                                      fit: BoxFit.cover,
                                      image: MemoryImage(videoThumbNail!),
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                              color: kwhite600),
                          child: Center(
                            child: videoThumbNail == null
                                ? const Icon(
                                    Icons.add,
                                    color: kwhite,
                                    size: 20,
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (video == null) {
                                          return;
                                        }
                                        isPlayingVideo = true;
                                        controller =
                                            CachedVideoPlayerController.file(
                                                video!);
                                        controller
                                            .initialize()
                                            .then((value) => controller.play());
                                      });
                                    },
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: kwhite,
                                      size: 20,
                                    ),
                                  ),
                          ),
                        )
                      : Container(
                          constraints: BoxConstraints(
                              maxWidth: Get.width, maxHeight: Get.height),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              CachedVideoPlayer(controller),
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
                                    await controller.pause();
                                    setState(() {
                                      isPlayingVideo = false;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.pause,
                                    color: kwhite,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildLoginFields(sp,
                    controller: titleController,
                    hinttext: 'Enter title',
                    validator: (val) {}),
                const SizedBox(
                  height: 20,
                ),
                buildLoginFields(sp,
                    controller: descriptionController,
                    hinttext: 'Enter description',
                    validator: (val) {}),
                Container(
                    height: height * 0.07,
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 20, top: 100),
                    decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(55)),
                    child: showLoader == false
                        ? MyButton(
                            text: 'Save changes',
                            textColor: kwhite,
                            onPress: () async {
                              try {
                                if (titleController.text.isEmpty) {
                                  Get.snackbar('Title Missing',
                                      'Please enter title for the video');
                                  return;
                                }
                                setState(() {
                                  showLoader = true;
                                });
                                String videoUrl =
                                    await uploadVideoAndGetDownloadUrl(video!);
                                http.Response response = await buildHttpResponse(
                                    'https://video-editing-app.herokuapp.com/api/authentication/editor-previous-work/',
                                    method: HttpMethod.POST,
                                    request: {
                                      "title": titleController.text,
                                      "description": descriptionController.text,
                                      "url": videoUrl
                                    },
                                    biuldAuthHeader: true);
                                Get.snackbar('Video saved',
                                    'Your data has been saved!!');
                                EditorProfileController
                                    editorProfileController = Get.find();
                                editorProfileController.initUserModelFromApi();

                                setState(() {
                                  showLoader = false;
                                });
                                Get.back();
                              } catch (e) {
                                setState(() {
                                  showLoader = false;
                                });
                                Get.snackbar('unable to save data',
                                    'There might be some issue.Please try again');
                              }
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: kwhite,
                            ),
                          )),
              ],
            ),
          ),
        ));
  }

  Widget buildLoginFields(double sp,
      {required String hinttext,
      TextEditingController? controller,
      required var validator,
      var onSaved}) {
    return LoginFields(
      formcontroller: controller,
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
      style: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kblack,
      ),
      hintText: hinttext,
      hintStyle: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kgrey3,
      ),
      enableBorder: enabledborder,
      errorBorder: errorborder,
      focusBorder: focusedborder,
      onSavedState: onSaved,
      border: enabledborder,
    );
  }

  Future<String> uploadVideoAndGetDownloadUrl(File image) async {
    var reference =
        FirebaseStorage.instance.ref('users/editors/previous-work/');
    await reference.putFile(image);
    String download = await reference.getDownloadURL();
    return download;
  }
}
