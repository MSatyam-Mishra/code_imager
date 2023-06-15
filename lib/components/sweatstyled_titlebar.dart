import 'package:flutter/material.dart';

class SweatStyled extends StatelessWidget {
  const SweatStyled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xfffae10f), Color(0xffffbd23)])),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xffc800e1), Color(0xff9100fa)])),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xffff435c), Color(0xffff4b2b)])),
            )
          ],
        ));
  }
}
