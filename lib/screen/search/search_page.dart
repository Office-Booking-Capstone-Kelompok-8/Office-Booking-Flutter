import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/components/form_component.dart';
import 'package:office_booking_app/utils/constant/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 80.h,
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: FormComponent(
            controller: _searchController,
            isSearch: true,
            isAuth: true,
            formHeight: 50.h,
            formWidth: double.infinity,
            hint: 'Search Buildings',
            prefixIcon: Icons.search,
            onPress: () {
              Navigator.pushNamed(context, '/search-result');
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              child: Text(
                'Jakarta Regional Office',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
            ExpansionTile(
              title: const Text('South Jakarta'),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                ChildrenTile(
                  text: 'Jagakarsa',
                  onTap: () {},
                ),
                const ChildrenTile(text: 'Jagakarsa'),
                const ChildrenTile(text: 'Jagakarsa'),
                const ChildrenTile(text: 'Jagakarsa'),
                const ChildrenTile(text: 'Jagakarsa'),
                const ChildrenTile(text: 'Jagakarsa'),
                const ChildrenTile(text: 'Jagakarsa'),
              ],
            ),
            ExpansionTile(
              title: const Text('Central Jakarta'),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                ChildrenTile(
                  text: 'Senen',
                  onTap: () {},
                ),
                const ChildrenTile(text: 'Senen'),
                const ChildrenTile(text: 'Senen'),
                const ChildrenTile(text: 'Senen'),
                const ChildrenTile(text: 'Senen'),
                const ChildrenTile(text: 'Senen'),
                const ChildrenTile(text: 'Senen'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChildrenTile extends StatelessWidget {
  const ChildrenTile({Key? key, required this.text, this.onTap})
      : super(key: key);
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        height: 36.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              width: 0.5,
              color: Color(0xFFDDDDDD),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
  }
}
