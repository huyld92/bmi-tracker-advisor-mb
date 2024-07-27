// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bmi_tracker_mb_advisor/models/member_basic_model.dart';
import 'package:bmi_tracker_mb_advisor/util/app_export.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberCard extends StatefulWidget {
  final bool? isActive;

  final MemberBasicModel member;
  final void Function()? onDetailClick;
  final void Function()? onMessageClick;

  // final void Function()? onBookClick;

  const MemberCard({
    Key? key,
    required this.member,
    this.isActive,
    this.onDetailClick,
    this.onMessageClick,
  }) : super(key: key);

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.v,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('${widget.member.accountPhoto}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      child: Container(
                        width: 15.v,
                        height: 15.h,
                        decoration: BoxDecoration(
                          color: widget.isActive ?? false
                              ? Colors.green
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: widget.isActive ?? false
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 13.v),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.v),
                Text(
                  widget.member.fullName.toString(),
                  style: theme.textTheme.titleLarge,
                )
              ],
            ),
            trailing: Icon(
              _customIcon ? Icons.close_rounded : Icons.add_circle,
              color: Theme.of(context).primaryColor,
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 35.h,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 10,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            onPressed: widget.onDetailClick,
                            child: SizedBox(
                              width: 36.v,
                              height: 20.h,
                              child: Center(
                                child: Text(
                                  'txt_detail'.tr,
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
                        ),
                        SizedBox(width: 10.v),
                        SizedBox(
                          height: 35.h,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 10,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            onPressed: widget.onMessageClick,
                            child: SizedBox(
                              width: 30.v,
                              height: 20.h,
                              child: Center(
                                child: Text(
                                  'Chat',
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
                        ),
                        // IconButton(
                        //   onPressed: widget.onMessageClick,
                        //   icon: Icon(
                        //     Icons.messenger_outline_outlined,
                        //     color: Theme.of(context).primaryColor,
                        //   ),
                        // ),
                        // IconButton(
                        //   onPressed: widget.onBookClick,
                        //   icon: Icon(
                        //     Icons.book_online_outlined,
                        //     color: Theme.of(context).primaryColor,
                        //   ),
                        // ),
                        // widget.onMessageClick
                        //     ? const SizedBox()
                        //     : SizedBox(
                        //         height: 35.h,
                        //         child: OutlinedButton(
                        //           style: OutlinedButton.styleFrom(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(5),
                        //               side: BorderSide(
                        //                 color: Theme.of(context).primaryColor,
                        //                 width: 10,
                        //                 style: BorderStyle.solid,
                        //               ),
                        //             ),
                        //           ),
                        //           onPressed: widget.onMessageClick,
                        //           child: SizedBox(
                        //             width: 51.v,
                        //             height: 30.h,
                        //             child: Center(
                        //               child: Text(
                        //                 'Chat',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .labelLarge!
                        //                     .copyWith(
                        //                         color: Theme.of(context)
                        //                             .primaryColor,
                        //                         fontWeight: FontWeight.bold),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'txt_phone_number'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        // Text(
                        //   '\ ${widget.member.phoneNumber}',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .bodyMedium!
                        //       .copyWith(
                        //           fontWeight: FontWeight.bold,
                        //           color: Theme.of(context).primaryColor),
                        // )
                        TextButton(
                          onPressed: () {
                            Uri phoneUrl = Uri(
                              scheme: 'tel',
                              path: '${widget.member.phoneNumber}',
                            );
                            launchUrl(phoneUrl);
                          },
                          child: Text(
                            '${widget.member.phoneNumber}',
                             style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
            onExpansionChanged: (value) {
              setState(
                () {
                  _customIcon = value;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
