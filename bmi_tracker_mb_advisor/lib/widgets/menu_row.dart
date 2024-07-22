import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';

class MenuRow extends StatelessWidget {
  // final
  const MenuRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<HomePageController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        width: double.infinity,
        height: 260.v,
        child: ListView.builder(
          shrinkWrap: true,
          // itemCount: controller.foodList.length,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // controller.goToFoodDetailsScreen(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.h),
                    width: 155.h,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 20.v),
                        child: Column(
                          children: [
                            //! photo
                            Container(
                              height: 110.v,
                              width: 150.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfDLQkEi-UgkZ30hfBkp0gAhlsasZLBqvL4A&usqp=CAU'
                                      // controller.foodList[index].foodPhoto,
                                      ),
                                ),
                              ),
                            ),

                            //! name
                            Text(
                              'Menu Diet',
                              // controller.foodList[index].foodName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2.v),
                            Row(
                              children: [
                                const Icon(Icons.timelapse),
                                SizedBox(width: 7.v),
                                // Text(
                                //     style:
                                //         Theme.of(context).textTheme.labelLarge!,
                                //     '${controller.foodList[index].foodTimeProcess} minutes')
                                Text(
                                    style:
                                        Theme.of(context).textTheme.labelLarge!,
                                    'For Thanh')
                                // Text('10 minutes')
                              ],
                            ),
                            // const Row(
                            //   children: [
                            //     Icon(Icons.people),
                            //     const SizedBox(width: 7),
                            //     Text('3 servings')
                            //   ],
                            // ),
                            Row(
                              children: [
                                const Icon(Icons.local_fire_department),
                                SizedBox(width: 7.v),
                                // Text('450 kcal')
                                // Text(
                                //     style:
                                //         Theme.of(context).textTheme.labelLarge!,
                                //     '${controller.foodList[index].foodCalories} kcal')

                                Text(
                                    style:
                                        Theme.of(context).textTheme.labelLarge!,
                                    'BreakFast')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
