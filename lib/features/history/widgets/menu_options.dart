import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {
  const MenuOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            //TODO: editing logic
            Navigator.pushNamed(context, "/add_money");
          },
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit_outlined, size: 27),
                SizedBox(width: 10),
                Text(
                  "Редагувати",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey[300]),
        GestureDetector(
          onTap: () {
            //TODO: remove logic
          },
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                  size: 27,
                ),
                SizedBox(width: 10),
                Text(
                  "Видалити",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
