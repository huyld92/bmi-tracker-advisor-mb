import 'package:bmi_tracker_mb_advisor/screens/exercise_detail/controller/exercise_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/app_export.dart';

class ExerciseDetailsScreen extends GetView<ExerciseDetailsController> {
  const ExerciseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
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
            title: const Text(
              'Exercise Details',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 400.v,
                      margin: EdgeInsets.symmetric(vertical: 10.v),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        //! photo
                        image: DecorationImage(
                          image: NetworkImage(controller
                                  .exerciseUIModels.value.exercisePhoto ??
                              'https://i.ytimg.com/vi/XowvxiGYsRI/maxresdefault.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //! Name
                    Text(
                      '${controller.exerciseUIModels.value.exerciseName}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Met: ${controller.exerciseUIModels.value.met}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://www.healthline.com/health/what-are-mets'));
                          },
                          child: Text(
                            'Concept',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      // fontSize: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://sites.google.com/site/compendiumofphysicalactivities/Activity-Categories'));
                          },
                          child: Text(
                            'Reference ',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      // fontSize: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Chip(
                          label: Text(
                              controller.exerciseUIModels.value.tagName ??
                                  'Unknown'),
                          backgroundColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        )),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.v),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          controller
                                  .exerciseUIModels.value.exerciseDescription ??
                              'This is the notes!',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Link processing video',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            launchUrl(Uri.parse(controller
                                .exerciseUIModels.value.exerciseVideo!));
                          },
                          child: Text(
                            'Video Link',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      // fontSize: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
