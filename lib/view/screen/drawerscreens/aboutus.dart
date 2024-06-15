import 'package:flutter/material.dart';
import 'package:serfast0_1/view/widget/my_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: MyAppBar(title: "About Us")),
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      "عن التطبيق:",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 240,
                      child: Image.asset(
                        "assets/images/logoserfast.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'نبذة عنا نحن شركة شعارها SerFast، نقدم خدمة سريعة للمستخدمين.'
                        ' نهدف إلى توفير تجربة مريحة وموثوقة في'
                        ' توصيل الخدمات المنزلية. نحن متخصصون في إصلاح الأعطال المنزلية'
                        '، وخدمات التنظيف، وتغيير الديكور. يمكنك الاعتماد علينا لتوفير'
                        ' الخدمات ذات الجودة العالية وفريق العمل المحترف الذي يضمن رض'
                        'ا العملاء. تعاون معنا اليوم واستمتع بخدماتنا الموثوقة والفعالة.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'نبذة عنا نحن شركة شعارها SerFast، نقدم خدمة سريعة للمستخدمين.'
                        '، وخدمات التنظيف، وتغيير الديكور. يمكنك الاعتماد علينا لتوفير'
                        ' الخدمات ذات الجودة العالية وفريق العمل المحترف الذي يضمن رض'
                        'ا العملاء. تعاون معنا اليوم واستمتع بخدماتنا الموثوقة والفعالة.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
