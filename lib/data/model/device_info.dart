import 'package:flutter/material.dart';

import '../../core/enums/device_type.dart';

class DeviceInfo {
  final Orientation orientation;
  final OurDeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth;
  final double localHeight;

  DeviceInfo(
      {required this.orientation,
      required this.deviceType,
      required this.localHeight,
      required this.localWidth,
      required this.screenHeight,
      required this.screenWidth});
}
