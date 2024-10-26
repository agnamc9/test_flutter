import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/widgets/buttons/buttons.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../gen/assets.gen.dart';

class AccountsPage extends StatefulWidget {
  AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final pageCount = 2;
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 0.9);
    return Scaffold(
      backgroundColor: Color(0xffF4F4F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Text(
                "Choisissez un compte",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 1.w),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.images.cardBackground.provider(),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(10.w)),
                          clipBehavior: Clip.antiAlias,
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Bonsoir Serge",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                "Content de vous revoir !",
                                style: TextStyle(
                                  color: Color(0xff919191),
                                  fontSize: 16.sp,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Asernum SARLU",
                                style: TextStyle(
                                  color: Color(0xffbababa),
                                  fontSize: 14.sp,
                                ),
                              ),
                              Gap(1.w),
                              Row(
                                children: [
                                  Icon(Icons.person_outline, color: Colors.white),
                                  Gap(1.w),
                                  Text(
                                    "Serge.diame@paynah.com",
                                    style: TextStyle(
                                      color: Color(0xfff4f4f7),
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 1.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.images.binoculars.svg(),
                              Gap(2.w),
                              Text(
                                "Ajouter un compte",
                                style: TextStyle(
                                  color: Color(0xff919191),
                                  fontSize: 16.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(4.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < pageCount; i++) ...[
                        Container(
                          width: 2.5.w,
                          height: 2.5.w,
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          decoration: BoxDecoration(
                            color: currentPageIndex == i ? Color(0xff414141) : Color(0xffE6E6E6),
                            shape: BoxShape.circle,
                          ),
                        )
                      ]
                    ],
                  ),
                  Gap(8.w),
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    PlainButton(
                      "Choisir ce compte",
                      onTap: () {},
                    ),
                    Gap(3.w),
                    Visibility(
                      visible: currentPageIndex == 1,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: BorderedButton(
                        "Ouvrir un compte",
                        onTap: () {},
                      ),
                    )
                  ]),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(6.w),
              child: Center(
                child: Text(
                  "Besoin d'aide ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
