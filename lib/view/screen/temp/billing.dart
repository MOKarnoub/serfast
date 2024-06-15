import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Billing extends StatelessWidget {
  const Billing({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TabBarView(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: const Text("الفاتورة"),
                  centerTitle: true,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.9),
                          Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.9),
                          Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.1, 0.5, 0.9],
                      ),
                    ),
                  ),
                  leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                      ),
                      onPressed: () {
                        Get.back();
                      }),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
                  child: ListView(
                    children: [
                      const Divider(height: 30),
                      ListTile(
                        title: Text("تكلفة الكشف",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                        subtitle: Text("تمديد مياه",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12)),
                        trailing: Text("50000",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).primaryColorLight)),
                      ),
                      const Divider(height: 30),
                      ListTile(
                          title: Text("تكلفة الخدمة",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: MaterialButton(
                                  color: Colors.orange,
                                  onPressed: () {},
                                  child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text("تأكيد",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ))),
                                ),
                              )
                            ],
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("50000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .primaryColorLight)),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 100,
                                height: 27,
                                child: TextField(
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                                ),
                              ),
                            ],
                          )),
                      const Divider(height: 20),
                      ListTile(
                        title: Text("ضريبة مضافة",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                        trailing: Text("0",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).primaryColorLight)),
                      ),
                      const Divider(height: 20),
                      ListTile(
                        title: Text("الإجمالي",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white)),
                        trailing: Text("100000",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).primaryColorLight)),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.white,
                        )),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("المبلغ المدفوع",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white)),
                              trailing: Text("0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .primaryColorLight)),
                            ),
                            ListTile(
                              title: Text("المتبقي (الواجب دفعه)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.white)),
                              trailing: Text("100000",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .primaryColorLight)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: const Text("التفاصيل"),
                  centerTitle: true,
                  leading: Container(),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.65),
                          Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.6),
                          Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(0.6),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [0.1, 0.5, 0.9],
                      ),
                    ),
                  ),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: ListTile(
                        title: Text(
                          "الطلب قيد المراجعة",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.white),
                        ),
                        trailing: const Icon(Icons.do_not_step),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
