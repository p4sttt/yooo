import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'components/todos_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<TodoCard> todosList = [];

  void createActivity(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('title'),
          content: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'type your todo here',
                  border: OutlineInputBorder(),
                ),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  setState(() {
                    todosList.add(TodoCard(todo: controller.text));
                  });
                }
              },
              child: const Text('some'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 32,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: TodosList(todosList: todosList),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => createActivity(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('add activity'),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(EvaIcons.plus),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
