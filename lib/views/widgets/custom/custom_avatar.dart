import 'package:flutter/material.dart';
import 'package:portfolio/config/theme/app_theme.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, this.radius = 120, this.borderWidth = 4});

  final double borderWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(color: const Color(0xFFEDF7FA), borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(theme.primaryBackgroundColor.withOpacity(0.02), BlendMode.color),
                    child: Image.asset(
                      'assets/images/my_picture.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
