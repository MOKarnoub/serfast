import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/view/widget/auth/custom_Login_Button.dart';

class ThxForOrder extends StatelessWidget {
  const ThxForOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14.0),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "شكرا لثقتكم فينا",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                        height: 180,
                        child: Image.asset('assets/images/logoserfast.png')),
                    const SizedBox(height: 12),
                    Text(
                        textAlign: TextAlign.center,
                        "تستطيع الان الجلوس بهدوء ريثما نتعامل مع طلبكم",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 30),
                    Text(
                        textAlign: TextAlign.center,
                        "يمكنك تعقب والتعديل على طلبك من خلال صفحة طلباتي",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 30),
                    Text(
                        textAlign: TextAlign.center,
                        "رقم الطلب: 104204",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 30),
                    Text(
                        textAlign: TextAlign.center,
                        "يمكنكم إلغاء الطلب مجانا خلال مدة اقصاها 10 دقائق",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white)),
                    const SizedBox(height: 100),
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: CustomLoginButton(
                        ButtonText: 'Go To Home Page',
                        onPress: () {
                          Get.toNamed(AppRoute.home);
                        },
                      ),
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
