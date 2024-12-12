import 'package:flutter/material.dart';

class RegisterationTextFieldPrefix extends StatelessWidget {
  const RegisterationTextFieldPrefix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            Image.asset(
              'assets/Images/flag.jpg',
              width: 24,
              height: 15,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '+963',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color(0xff302F34).withOpacity(.7),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              height: 16,
              child: VerticalDivider(
                width: 0,
                color: const Color(0xff302F34).withOpacity(.4),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
