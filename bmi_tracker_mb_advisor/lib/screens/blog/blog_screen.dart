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
                  'List Blog',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15.v),
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            CustomBlogCard(
                              photoUrl:
                                  "https://res.cloudinary.com/dlipvbdwi/image/upload/v1696896651/cld-sample-3.jpg",
                              title: "This is a title",
                              onTitleTap: () {
                                Get.to(BlogDetailScreen());
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: appTheme.green500,
          onPressed: () {
            // controller.goToCreateBlog();
            Get.to(CreateBlogScreen());
          },
          child: Icon(Icons.add, size: 50.adaptSize, color: appTheme.white),
        ),
      ),
    );
  }
}
