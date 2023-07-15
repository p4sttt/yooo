import 'package:flutter/material.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key, required this.todosList});

  final List<TodoCard> todosList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todosList.length,
      itemBuilder: (context, index) {
        final todo = todosList[index];

        return TodoCard(
          todo: todo.todo,
        );
      },
    );
  }
}

class TodoCard extends StatefulWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final String todo;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool state = false;

  void handleChange() => setState(() {
        state = !state;
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleChange,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            Checkbox(
              value: state,
              onChanged: (bool? value) {},
            ),
            const SizedBox(
              width: 16,
            ),
            Text(widget.todo)
          ],
        ),
      ),
    );
  }
}
