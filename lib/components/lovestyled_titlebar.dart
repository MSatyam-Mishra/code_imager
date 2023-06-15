import 'package:flutter/material.dart';

class LoveStyled extends StatelessWidget {
  const LoveStyled({
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
              child: Image.asset(
                "assets/icons/min.png",
                color: Colors.yellow,
                fit: BoxFit.cover,
              ),
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
              child: Image.asset(
                "assets/icons/close.png",
                fit: BoxFit.cover,
                color: Color(0xffff435c),
              ),
            )
          ],
        ));
  }
}
