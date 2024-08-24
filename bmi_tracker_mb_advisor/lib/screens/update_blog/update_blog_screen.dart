import 'package:bmi_tracker_mb_advisor/screens/update_blog/controller/update_blog_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/size.dart';
import '../../widgets/custom_elevated_button.dart';

class UpdateBlogScreen extends GetView<UpdateBlogController> {
  const UpdateBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Scaffold(
          backgroundColor: appTheme.white,
          body: Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(appTheme.green500),
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () => Get.back(),
          //     icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text('Update Blog',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blog Photo',
                    style: theme.textTheme.titleLarge,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 500.h,
                        height: 250.v,
                        child: Obx(() {
                          if (controller.isFile.value) {
                            return CustomImageView(
                              imagePath: controller.imagePath.value,
                            );
                          } else {
                            return CustomImageView(
                              imagePath: controller.blogModel.value.blogPhoto,
                            );
                          }
                        }),

                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        //   child: Image(
                        //       image: NetworkImage(controller
                        //               .blogModel.value.blogPhoto ??
                        //           'https://res.cloudinary.com/dlipvbdwi/image/upload/v1696896651/cld-sample-3.jpg')),
                        // ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff27b761),
                          ),
                          child: IconButton(
                            icon: Icon(LineAwesomeIcons.camera,
                                size: 20.0.fSize, color: Colors.black),
                            onPressed: () {
                              controller.selectImage();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Title',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 1,
                    controller: controller.txtTitleController,
                    // validator: (value) {
                    //   return feedbackController.validateTitle(value!);
                    // },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Input Blog title',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    'Content',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 6,
                    controller: controller.txtContentController,
                    // validator: (value) {
                    //   return feedbackController.validateTitle(value!);
                    // },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Input Blog description',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    'Video Link',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.v),
                  TextFormField(
                    maxLines: 1,
                    controller: controller.txtVideoLinkController,
                    // validator: (value) {
                    //   return feedbackController.validateTitle(value!);
                    // },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Link',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(top: 15.v),
                    // flex: 2,
                    child: Column(
                      children: [
                        CustomElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.updateBlog();
                            },
                            text: 'txt_update_blog'.tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
