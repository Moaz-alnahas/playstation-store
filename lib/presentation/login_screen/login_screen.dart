import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playstation_store/router/app_router.dart';
import 'package:playstation_store/widget/custom_button.dart';
import 'package:playstation_store/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "playstation".tr(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Management_System".tr(),
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            color: const Color.fromARGB(110, 158, 158, 158))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Center(
                        child: Text(
                          "login".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                      Text(
                        "email_username".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      CustomTextField(
                        hintText: "hint_email".tr(),
                      ),
                      Text(
                        "password".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      CustomTextField(
                        hintText: "hint_password".tr(),
                      ),
                      Center(
                          child: CustomGestureDetectorButton(
                        iconWidget: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        label: "login".tr(),
                        onTap: () {
                          GoRouter.of(context).go(AppRoutes.homeScreen);
                        },
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(225, 225, 225, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        size: 18,
                        color: Colors.grey,
                      ),
                      Text(textAlign: TextAlign.center, "warning".tr())
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      final isEnglish = context.locale.languageCode == 'en';
                      final newLocale = Locale(isEnglish ? 'ar' : 'en');
                      await context.setLocale(newLocale);
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          context.locale.languageCode == 'en'
                              ? 'English'
                              : 'العربية',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
