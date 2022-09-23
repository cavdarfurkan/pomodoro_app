import 'package:flutter/material.dart';

import '../constants/colors.dart' as color_constants;

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    this.title,
    this.separator,
    required this.child,
  }) : super(key: key);

  final String? title;
  final Widget? separator;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: color_constants.grayLight,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              offset: Offset(0.0, 5.0),
              color: color_constants.grayDark
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Center(
                  child: Text(title!),
                ),
              ),
            child,
            if (separator != null) separator!,
          ],
        ),
      ),
    );
  }
}
