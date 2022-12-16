import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/app_colors.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({
    Key? key,
    required this.name,
    required this.date,
    required this.image,
    required this.comment,
    required this.rating,
  }) : super(key: key);
  final String name;
  final String date;
  final String image;
  final String comment;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.neutral4,
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: 6,
            leading: CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            title: Text(name),
            subtitle: Text(date),
            trailing: SizedBox(
              width: 60.w,
              child: RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 15,
                direction: Axis.horizontal,
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 16.h),
            child: Text(
              comment,
              style: const TextStyle(
                color: AppColors.neutral8,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
