import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lybianka/features/add_money/view/add_money_screen.dart';
import 'package:lybianka/blocs/category_bloc/category_bloc.dart';
import 'package:lybianka/blocs/money_bloc/money_bloc.dart';

class MenuOptions extends StatelessWidget {
  const MenuOptions({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     //TODO: editing logic
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>
        //             AddMoneyScreen(isEditable: true, editingId: id),
        //       ),
        //     );
        //   },
        //   child: SizedBox(
        //     height: 40,
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Icon(Icons.edit_outlined, size: 27),
        //         SizedBox(width: 10),
        //         Text(
        //           "Редагувати",
        //           style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // Divider(color: Colors.grey[300]),
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
              //TODO check this
              context.read<MoneyBloc>().add(OnSaveMoneyEvent());
              context.read<MoneyBloc>().add(OnGetMoneyEvent());
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
