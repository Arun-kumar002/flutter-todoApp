import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final textEditingController = TextEditingController();
  final List<String> _task = [];
  var updateIndex = null;

  void _addTask(String task) {
    print("im here $updateIndex");
    if (updateIndex != null) {
      setState(() {
        _task[updateIndex] = task;
        updateIndex = null;
      });
    } else {
      setState(() {
        _task.add(task);
      });
    }
    textEditingController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      _task.removeAt(index);
    });
  }

  void _updateTask(int index) {
    textEditingController.text = _task[index];
    setState(() {
      updateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.pinkAccent],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft))),
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.pinkAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add new task",
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                //not supposed to give const
                controller: textEditingController,
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    _addTask(value);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Tasks",
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: _task.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_task[index]),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                        icon: Icon(Icons.update),
                        onPressed: () => {_updateTask(index)},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => {
                          _removeTask(index),
                        },
                      ),
                    ]),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
