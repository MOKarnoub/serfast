import 'package:flutter/material.dart';
import 'package:serfast0_1/data/model/provider.dart';

class ImageUp extends StatelessWidget {
  final ProviderModel providerModel;
  const ImageUp({super.key, required this.providerModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.375,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(providerModel.providerImage!),
              fit: BoxFit.fitHeight)),
    );
  }
}
