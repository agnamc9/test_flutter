import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/widgets/buttons/buttons.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../gen/assets.gen.dart';
import '../../signin/signin.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: StoryBar(),
                  ),
                  Gap(1.w),
                  Expanded(
                    child: StoryBar(),
                  ),
                  Gap(1.w),
                  Expanded(
                    child: StoryBar(),
                  ),
                  Gap(1.w),
                  Expanded(
                    child: StoryBar(),
                  ),
                ],
              ),
              Gap(3.w),
              Expanded(
                child: Container(),
              ),
              Gap(8.w),
              Text(
                "Un compte pour\ngérer sereinement\nvotre argent",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(8.w),
              PlainButton(
                "Ouvrir un compte",
                onTap: () {},
              ),
              Gap(3.w),
              BorderedButton(
                "Se connecter",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SigninPage()));
                },
              ),
              Gap(3.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.compass.svg(),
                  Gap(2.w),
                  Text(
                    "Découvrir l'application",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryBar extends StatelessWidget {
  const StoryBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.w,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4.w),
      ),
    );
  }
}
