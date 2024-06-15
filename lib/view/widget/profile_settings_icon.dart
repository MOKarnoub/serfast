import 'package:flutter/material.dart';

class ProfileSettingsIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;
  const ProfileSettingsIcon
  ({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
     child: ListTile(
       trailing: const Icon(Icons.arrow_forward_ios),
       leading:  Container(
         padding: const EdgeInsets.all(8.0),
         decoration: title!="تسجيل الخروج" ? BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              Color.fromRGBO(34, 44, 56, 1),
              Color.fromRGBO(0,153,255, 1),
              // Color.fromRGBO(0,204,153, 1),
              // Color.fromRGBO(0,211,88, 1),
              Color.fromRGBO(34, 44, 56, 1),
            ]),
            borderRadius: BorderRadius.circular(16),
          ):BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              // Color.fromRGBO(34, 44, 56, 1),
              Colors.red.shade900,
              Colors.red.shade400,
              Colors.red.shade900,
              // Color.fromRGBO(0,204,153, 1),
              // Color.fromRGBO(0,211,88, 1),
              // Color.fromRGBO(34, 44, 56, 1),
            ]),
            borderRadius: BorderRadius.circular(16),
          ),
         child: Icon(
           icon,
           color:Colors.white,
         ),
       ),
       title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
       ),
     ),
   );
  }
}
