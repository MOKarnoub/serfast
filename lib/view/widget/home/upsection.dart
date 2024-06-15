import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class UpSection extends StatelessWidget {
  const UpSection({
    super.key,
    required this.sizeOfCurve,
  });

  final double sizeOfCurve;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(top: 0,child: Opacity(opacity: 0.75,child: Lottie.asset("assets/animations/curve.json",fit: BoxFit.cover,height: sizeOfCurve,width: 400),),),
        Positioned(top: 3,child: Opacity(opacity: 0.9,child: Lottie.asset("assets/animations/curve.json",fit: BoxFit.cover,height: sizeOfCurve,width: 400),)),
        ClipPath(
          clipper: MyPath2(),
          child: Container(
            height: sizeOfCurve,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSecondary,
                  Theme.of(context).colorScheme.surface,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.5, 0.9],
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: MyPath(),
          child: Container(
            height: sizeOfCurve - 20,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary.withOpacity(0.65),
                  Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
                  Theme.of(context).colorScheme.surface.withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.5, 0.9],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 35,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.cyan),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Center(
                        child: buildTweenAnimationBuilder(2453)),
                  ),
                  const SizedBox(height: 10),
                  const FittedBox(
                    child: SizedBox(
                      width: 50,
                      child: Text(
                        "مستخدم نشط",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.cyan),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Center(
                        child: buildTweenAnimationBuilder(1000)),
                  ),
                  const SizedBox(height: 10),
                  const FittedBox(
                    child: SizedBox(
                      width: 40,
                      child: Text(
                        "عامل نشط",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ), // Row for Counter
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            height: 140,
            width: 180,
            // Lottie.asset()
            child: Image.asset(
              "assets/animations/dash.png",
              fit: BoxFit.cover,
              // backgroundLoading: true,
            ),
          ),
        ), // animation
      ],
    );
  }
    TweenAnimationBuilder<int> buildTweenAnimationBuilder(int end) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: end),
      duration: const Duration(seconds: 4),
      builder: (context, value, child) {
        return Text(
            value.toString(),
            style: const TextStyle(color: Colors.cyan));
      },);
  }
}

class MyPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * -0.0066667, size.height * 0.9966667);
    path_0.quadraticBezierTo(size.width * 0.0554222, size.height * 0.8235000,
        size.width * 0.2065556, size.height * 0.7878667);
    path_0.cubicTo(
        size.width * 0.4075333,
        size.height * 0.7644667,
        size.width * 0.7351333,
        size.height * 1.2554000,
        size.width * 1.0040889,
        size.height * 0.8030000);
    path_0.quadraticBezierTo(
        size.width * 1.0046444, size.height * 0.5513333, size.width, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * -0.0066667, size.height * 0.8542857);
    path_0.quadraticBezierTo(size.width * 0.0554222, size.height * 0.7058571,
        size.width * 0.2065556, size.height * 0.6753143);
    path_0.cubicTo(
        size.width * 0.4075333,
        size.height * 0.6552571,
        size.width * 0.7351333,
        size.height * 1.0760571,
        size.width * 1.0040889,
        size.height * 0.6882857);
    path_0.quadraticBezierTo(
        size.width * 1.0046444, size.height * 0.4725714, size.width, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}