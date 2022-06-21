import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:tangani/app/widgets/constants.dart';

class SpacerStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: kDefaultPadding,
        child: const DecoratedBox(
          decoration: const BoxDecoration(color: kDarkColor),
        ),
      ),
    );
  }
}
