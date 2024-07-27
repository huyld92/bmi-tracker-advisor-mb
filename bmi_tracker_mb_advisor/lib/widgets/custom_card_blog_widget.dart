import 'package:bmi_tracker_mb_advisor/theme/custom_text_style.dart';
import 'package:bmi_tracker_mb_advisor/theme/theme_helper.dart';
import 'package:bmi_tracker_mb_advisor/util/size_utils.dart';
import 'package:flutter/material.dart';

class CustomBlogCard extends StatelessWidget {
  final String photoUrl;
  final String title;
  // final String? content1;
  // final String? content2;
  // final String? content3;
  // final String? content4;
  final VoidCallback onTitleTap;

  CustomBlogCard({
    required this.photoUrl,
    required this.title,
    // this.content1,
    // this.content2,
    // this.content3,
    // this.content4,
    required this.onTitleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 5.v, top: 10.v, left: 10.v, right: 10.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                photoUrl,
                height: 120.v,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.v),
            Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: GestureDetector(
                onTap: onTitleTap,
                child: Text(
                  title,
                  maxLines: 2,
                  softWrap: true,
                  style: CustomTextStyles.titleMedium16Black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // if (content1 != null) ...[
            //   Padding(
            //     padding: EdgeInsets.only(bottom: 5.v),
            //     child: Text(
            //       content1!,
            //       style: theme.textTheme.bodyMedium,
            //     ),
            //   ),
            //   // SizedBox(height: 5),
            // ],
            // if (content2 != null) ...[
            //   Padding(
            //     padding: EdgeInsets.only(bottom: 5.v),
            //     child: Text(
            //       content2!,
            //       style: theme.textTheme.bodyMedium,
            //     ),
            //   ),
            // ],
            // if (content3 != null) ...[
            //   Padding(
            //     padding: EdgeInsets.only(bottom: 5.v),
            //     child: Text(
            //       content3!,
            //       style: theme.textTheme.bodyMedium,
            //     ),
            //   ),
            // ],
            // if (content4 != null) ...[
            //   Padding(
            //     padding: EdgeInsets.only(bottom: 5.v),
            //     child: Text(
            //       content4!,
            //       style: theme.textTheme.bodyMedium,
            //     ),
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}
