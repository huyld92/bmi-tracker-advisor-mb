
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class CreateMenuScreen extends StatefulWidget {
  final void Function()? onCreateMenuScreenClick;
  const CreateMenuScreen({
    Key? key,
    this.onCreateMenuScreenClick,
  }) : super(key: key);

  @override
  _CreateMenuScreenState createState() => _CreateMenuScreenState();
}

class _CreateMenuScreenState extends State<CreateMenuScreen> {
  // var controller = Get.put(CreateMenuScreenMealFoodController());

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.v,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
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
              onPressed: widget.onCreateMenuScreenClick,
              child: SizedBox(
                width: 85.h,
                height: 30.v,
                child: Center(
                  child: Text(
                    'Add Menu',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // SizedBox(
          //   width: 280.h,
          //   child: Obx(
          //     () => ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       // itemCount: controller.tagChecked.length,
          //       itemCount: 2,
          //       itemBuilder: (context, index) {
          //         return Container(
          //           margin: EdgeInsets.only(top: 3.v, bottom: 3.v, right: 7.h),
          //           padding: const EdgeInsets.all(5),
          //           decoration: BoxDecoration(
          //             border: Border.all(width: 1),
          //             borderRadius: const BorderRadius.all(
          //               Radius.circular(10),
          //             ),
          //           ),
          //           child: Text("${controller.tagChecked[index].tagName}"),
          //         );
          //       },
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
