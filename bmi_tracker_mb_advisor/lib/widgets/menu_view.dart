import 'package:bmi_tracker_mb_advisor/screens/menu/create_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/menu_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MenuView extends GetView<MenuController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.v,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xffd7ecb6),
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
              Get.to(const CreateMenuScreen());
            },
            child: SizedBox(
              width: 85.h,
              height: 30.v,
              child: Center(
                child: Text(
                  'Create Menu',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 550.v,
          child: ListView.builder(
            // prototypeItem: const Divider(color: Colors.grey),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      // controller.goToUpdateMealLog(index);
                    },
                    backgroundColor: const Color(0xFF1FBE1B),
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      // controller.removeMealLog(index);
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ]),
                child: MenuItem(
                    name: 'name',
                    photo: 'photo',
                    description: 'description',
                    totalKcal: 'totalKcal'),
              );
            },
          ),
        ),
      ],
    );
  }
}
