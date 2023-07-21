import 'package:ecopocket_clean_architecture/shared/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatItemListSkeleton extends StatelessWidget {
  const StatItemListSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => Row(
        children: [
          Skeleton(
            height: 18.h,
            width: 18.h,
          ),
          SizedBox(width: 12.r),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(height: 12.h, width: 50.w),
              SizedBox(height: 5.h),
              Skeleton(height: 12.h, width: 40.h)
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Skeleton(height: 12.h, width: 35.w),
              SizedBox(height: 5.h),
              Skeleton(height: 12.h, width: 15.w)
            ],
          ),
        ],
      ),
    );
  }
}
