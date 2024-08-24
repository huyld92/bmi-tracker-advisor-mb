import 'package:bmi_tracker_mb_advisor/screens/create_blog/controller/create_blog_controller.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/size.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

class CreateBlogScreen extends GetView<CreateBlogController> {
  const CreateBlogScreen({super.key});

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
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text('Create Blog',
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Form(
                  key: controller.blogFormKey,
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
                                  imagePath:
                                      controller.blogModel.value.blogPhoto,
                                );
                              }
                            }),
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
                        controller: controller.blogNameController,
                        onSaved: (value) {
                          controller.blogName = value!;
                        },
                        validator: (value) {
                          return controller.validateBlogName(value!);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Input Blog title',
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1.0),
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
                        controller: controller.blogContentController,
                        onSaved: (value) {
                          controller.blogContent = value!;
                        },
                        validator: (value) {
                          return controller.validateBlogContent(value!);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Input Blog description',
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Text(
                        'Link',
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 10.v),
                      TextFormField(
                        maxLines: 1,
                        controller: controller.linkController,
                        onSaved: (value) {
                          controller.link = value!;
                        },
                        validator: (value) {
                          return controller.validateLink(value!);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Link',
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1.0),
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
                                  // controller.updateProfile();
                                  controller.createBlog();
                                },
                                text: 'Create Blog'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      );
    });
  }
}
