import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final String title;
  const DetailsAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      toolbarHeight: 60,
      elevation: 0.5,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 245, 246, 250),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
