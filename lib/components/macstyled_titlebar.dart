import 'package:flutter/material.dart';

class MacStyled extends StatelessWidget {
  const MacStyled({
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
                  shape: BoxShape.circle, color: Colors.yellow),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
            )
          ],
        ));
  }
}
