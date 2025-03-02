import 'package:flutter/material.dart';

class BasicOptionButton extends StatelessWidget {
  final Color iconColor;
  final Color arrowColor;
  final String title;
  final IconData icon;
  final Function onPressed;

  const BasicOptionButton(
      {super.key,
      required this.iconColor,
      required this.arrowColor,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: TextButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: iconColor,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: arrowColor,
            ),
          ],
        ),
      ),
    );
  }
}
