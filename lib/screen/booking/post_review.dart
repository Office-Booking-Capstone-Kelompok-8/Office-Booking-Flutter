// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/reservation_provider.dart';
import 'package:office_booking_app/screen/components/appbar_component.dart';
import 'package:office_booking_app/screen/components/button_component.dart';
import 'package:office_booking_app/screen/components/snackbar_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';
import 'package:office_booking_app/utils/constant/app_text_style.dart';
import 'package:office_booking_app/utils/constant/helper.dart';
import 'package:provider/provider.dart';

class PostReview extends StatefulWidget {
  const PostReview({super.key});

  @override
  State<PostReview> createState() => _PostReviewState();
}

class _PostReviewState extends State<PostReview> {
  @override
  Widget build(BuildContext context) {
    final detail = Provider.of<ReservationProvider>(context, listen: false);

    return Scaffold(
      appBar: const AppbarComponent(title: 'Submit Review'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      blurRadius: 24.r,
                      color: AppColors.shadowColor,
                      offset: const Offset(0, 8),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.fromLTRB(5.w, 11.h, 16.w, 11.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: SizedBox(
                        height: 90.h,
                        width: 90.w,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network(
                            detail.getUserDetailReservation!.building!.picture!,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 92.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              detail.getUserDetailReservation!.building!.name!,
                              style: detailFormStyle,
                            ),
                            Text(
                              '${detail.getUserDetailReservation!.building!.district!} - ${detail.getUserDetailReservation!.building!.city!}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: detailFormGrey,
                            ),
                            Row(
                              children: [
                                Text(
                                  Helper.convertToIdr(
                                          detail.getUserDetailReservation!
                                                  .amount! ~/
                                              detail.getUserDetailReservation!
                                                  .duration!,
                                          0,
                                          true)
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: onboardSkip,
                                ),
                                const Text(' /month'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Rate This Building',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral10),
              ),
              SizedBox(
                height: 16.h,
              ),
              RatingBar.builder(
                initialRating: 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  detail.changeRating(rating.toInt());
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Share your feedback',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral10),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.neutral8),
                    borderRadius: BorderRadius.circular(10.r)),
                child: TextFormField(
                  maxLines: 10,
                  decoration: const InputDecoration.collapsed(
                      hintText: "Tell us what you liked.."),
                  onChanged: (value) {
                    detail.changeComment(value);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 37.h,
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: ButtonComponent(
          onPress: () async {
            final result = await detail.postReview(
                detail.getUserDetailReservation!.id!,
                detail.ratingValue,
                detail.commentReview);
            if (result == 'Review created successfully') {
              showNotification(context, result!);
              Navigator.pop(context);
            } else if (result != null) {
              showNotification(context, result);
            }
          },
          isWhite: false,
          textButton: 'Submit',
          buttonHeight: 37.h,
          buttonWidth: 156.w,
        ),
      ),
    );
  }
}
