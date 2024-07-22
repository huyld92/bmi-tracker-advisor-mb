import 'package:bmi_tracker_mb_advisor/screens/menu/create_menu_screen.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:bmi_tracker_mb_advisor/widgets/menu_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<StatefulWidget> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            onPressed: () {
              Get.to(const CreateMenuScreen());
            },
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
        SizedBox(
          height: 570.v,
          child: ListView.builder(
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
