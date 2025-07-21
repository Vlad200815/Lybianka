import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/features/blocs/category_bloc/category_bloc.dart';

class MenuOptions extends StatelessWidget {
  const MenuOptions({super.key, required this.id});

  final String id;

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
        BlocListener<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state is RemoveCategorySuccessState) {
              Navigator.pop(context);
              log("Removed successfully");
            }
          },
          child: GestureDetector(
            onTap: () {
              context.read<CategoryBloc>().add(OnRemoveCategoryEvent(id: id));
              log("Trying to remove...");
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
        ),
      ],
    );
  }
}
