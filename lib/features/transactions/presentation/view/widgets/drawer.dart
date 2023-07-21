import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String dropdownValue = 'One';
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 48.h),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kGray[300]!,
                      width: 1.w,
                    ),
                    top: BorderSide(
                      color: kGray[300]!,
                      width: 1.w,
                    ),
                  ),
                ),
                child: ExpansionPanelList(
                  elevation: 0,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _isExpanded = !isExpanded;
                    });
                  },
                  expandedHeaderPadding: EdgeInsets.symmetric(vertical: 8.h),
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: Colors.transparent,
                      headerBuilder: (context, isOpen) {
                        return ListTile(
                          leading:
                              SvgPicture.asset('assets/icons/language.svg'),
                          title: Text(
                            'English',
                            style: GoogleFonts.jost(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: kGray[900],
                            ),
                          ),
                        );
                      },
                      isExpanded: _isExpanded,
                      body: Column(children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 5.h),
                          title: Text(
                            'English',
                            style: GoogleFonts.jost(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: kGray[900],
                            ),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 5.h),
                          title: Text(
                            'French',
                            style: GoogleFonts.jost(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: kGray[900],
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
