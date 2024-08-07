import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:serfast0_1/core/class/statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset("assets/lottie/loader.json",
                width: 250, height: 150))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset("assets/lottie/loader.json",
                    width: 250, height: 150))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset("assets/lottie/loader.json",
                        width: 250, height: 150))
                : statusRequest == StatusRequest.failure
                    ? const Center(child: Text("No Data"))
                    : widget;
  }
}
