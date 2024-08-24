import 'package:bmi_tracker_mb_advisor/screens/blog/controller/blog_controller.dart';
import 'package:bmi_tracker_mb_advisor/screens/blog_detail/blog_detail_screen.dart';
import 'package:bmi_tracker_mb_advisor/screens/create_blog/create_blog_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/custom_card_blog_widget.dart';
import 'package:flutter/material.dart';

class BlogScreen extends GetView<BlogController> {
  const BlogScreen({super.key});

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
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            toolbarHeight: 100,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Blog List',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
          body: Obx(() {
            if (controller.blogList.isEmpty) {
              return SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/not_found.png",
                        width: 128.adaptSize),
                    Text("${"txt_no_data_available_yet".tr}.",
                        style: CustomTextStyles.titleMedium16Black),
                    // Text("body_no_results".tr, style: theme.textTheme.bodyMedium,)
                  ],
                ),
              );
            }
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15.v),
                      child: Obx(
                        () {
                          if (controller.isLoading.value) {
                            return const CircularProgressIndicator();
                          } else {
                            return RefreshIndicator(
                              onRefresh: () async {
                                await controller.refreshData();
                              }, // Define your refresh function
                              child: GridView.builder(
                                padding: const EdgeInsets.all(10.0),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Number of columns
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio:
                                      0.7, // Adjust the aspect ratio as needed
                                ),
                                itemCount: controller.blogList.length,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        controller.goToBlogDetail(index);
                                      },
                                      child: Stack(
                                        children: [
                                          CustomBlogCard(
                                            blog: controller.blogList[index],
                                            // photoUrl: controller.blogModel.value.blogPhoto,
                                            // title: controller.blogModel.value.blogName,
                                            onTitleTap: () {
                                              // Get.to(BlogDetailScreen());
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: appTheme.green500,
            onPressed: () {
              controller.goToCreateBlog();
            },
            child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
          ),
        ),
      );
    });
  }
}
