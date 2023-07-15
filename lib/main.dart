import 'package:flutter/material.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/services.dart';

import 'package:yooo/text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  final List<String> activities = ['some', 'some'];

  void handleClick() {
    showDialog(
      context: context,
      builder: (context) => const CreateActivityModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            bottom: 16,
            top: 24,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: activities.length,
                  itemBuilder: (context, index) =>
                      ActivityCard(activity: activities[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: handleClick,
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  shadowColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      button__add,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      EvaIcons.plus,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatefulWidget {
  const ActivityCard({
    super.key,
    required this.activity,
  });

  final String activity;

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool state = false;

  void handleChange() {
    setState(() {
      state = !state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleChange,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Checkbox(value: state, onChanged: (bool? value) {}),
            Text(widget.activity),
          ],
        ),
      ),
    );
  }
}

class CreateActivityModal extends StatefulWidget {
  const CreateActivityModal({super.key});

  @override
  State<CreateActivityModal> createState() => CreateActivityModalState();
}

class CreateActivityModalState extends State<CreateActivityModal> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void hadnleSave() {
    if (_textEditingController.text.isNotEmpty) {
      print(_textEditingController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration:
                  const InputDecoration(hintText: "Type your activity here"),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('close')),
                TextButton(onPressed: hadnleSave, child: const Text('add')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
