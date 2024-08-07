import 'package:bmi_tracker_mb_advisor/screens/blog_detail/controller/blog_detail_controller.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_elevated_button.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/custom_button_style.dart';
import '../../util/app_export.dart';
import '../update_blog/update_blog_screen.dart';

class BlogDetailScreen extends GetView<BlogDetailController> {
// class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blog Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                backgroundColor: Colors.white,
                title: "Confirm delete blog",
                titleStyle: CustomTextStyles.titleMedium16Black,
                content: Text("Are you sure to delete blog?"),
                barrierDismissible: false,
                cancel: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: CustomButtonStyles.outlineButtonGrey300,
                  child: Text("txt_cancel".tr,
                      style: CustomTextStyles.bodyMedium14White),
                ),
                confirm: ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    controller.deactivateBlog();
                  },
                  style: CustomButtonStyles.outlineButtonRed500,
                  child: Text("txt_delete".tr,
                      style: CustomTextStyles.bodyMedium14White),
                ),
              );
            },
            icon: const Icon(LineAwesomeIcons.trash),
          ),
          IconButton(
            onPressed: () {
              controller.goToUpdateBlogScreen();
            },
            icon: const Icon(LineAwesomeIcons.alternate_pencil),
          ),
        ],
      ),
      body:
          // Obx(() {
          // if (controller.isloading.value) {
          //   return const Center(
          //     child: CircularProgressIndicator.adaptive(),
          //   );
          // }
          Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180.v,
                margin: EdgeInsets.symmetric(vertical: 10.v),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  //! photo
                ),
                child: Obx(
                  () => CustomImageView(
                    imagePath: controller.blogModel.value.blogPhoto ??
                        'https://res.cloudinary.com/dlipvbdwi/image/upload/v1696896651/cld-sample-3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //! Title
              Obx(
                () => Text(
                  // controller.foodModel.value.foodName ??
                  controller.blogModel.value.blogName ?? "This is a title",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              //Content
              Text(
                'Content',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => Text(
                      // controller.foodModel.value.description ??
                      controller.blogModel.value.blogContent ??
                          'This is the description!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      "Video Link",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(width: 20.v),
                  SizedBox(
                    height: 35.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 10,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse(controller.blogModel.value.link ??
                            'https://www.youtube.com/watch?v=LPDnemFoqVk'));
                      },
                      child: SizedBox(
                        width: 30.h,
                        height: 20.v,
                        child: Center(
                          child: Text(
                            'Link',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // }),
    );
  }
}
