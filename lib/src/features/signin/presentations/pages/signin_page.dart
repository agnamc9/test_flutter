import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/features/signin/presentations/cubits/cubits.dart';
import 'package:flutter_app_test/src/widgets/inputs/input_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../injection.dart';
import '../../../account/account.dart';

class SigninPage extends StatelessWidget {
  final TextEditingController _loginCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(6.w),
          child: BlocProvider<SigninCubit>(
            create: (context) => sl<SigninCubit>(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE6E6E6),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(2.w),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 5.w,
                        ),
                      ),
                    ),
                    Text(
                      "Pas de compte ?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Gap(8.w),
                Expanded(
                  child: BlocConsumer<SigninCubit, SigninState>(
                    listener: (BuildContext context, SigninState state) {
                      if (state is SigninSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountsPage(),
                          ),
                        );
                        return;
                      }

                      if (state is SigninFailure) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        return;
                      }
                    },
                    builder: (BuildContext context, SigninState state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Connexion",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            Gap(8.w),
                            Text(
                              "Votre identifiant",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            Gap(2.w),
                            InputText(controller: _loginCtrl),
                            Gap(4.w),
                            Text(
                              "Clé d'accès",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            Gap(2.w),
                            InputText(
                              controller: _passwordCtrl,
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Assets.images.visibility.svg(),
                              ),
                              obscureText: true,
                            ),
                            Gap(4.w),
                            Text(
                              "J'ai perdu ma clé",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(4.w),
                            Center(
                              child: state is SigninInProgress
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        context
                                            .read<SigninCubit>()
                                            .signin(email: _loginCtrl.text, password: _passwordCtrl.text);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                        ),
                                        padding: EdgeInsets.all(4.w),
                                        child: Assets.images.whiteLeftArrow.svg(),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Gap(8.w),
                Text(
                  "Glissez de la droite vers la gauche pour vous connecter",
                  style: TextStyle(
                    color: Color(0xff919191),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
