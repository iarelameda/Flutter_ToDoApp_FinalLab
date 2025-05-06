import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Final Laboratory Exam',
    home: ToDoHomePage(),
    );
  }
}

class ToDoHomePage extends StatefulWidget {
  @override

  _ToDoHomePageState createState() => _ToDoHomePageState();
}

class TaskItem {
  String text;
  String timeAdded;

  TaskItem({required this.text, required this.timeAdded});
} 

class _ToDoHomePageState extends State<ToDoHomePage> {
  List<TaskItem> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    String text = taskController.text;
    if (text.isNotEmpty) {
      String timeNow = TimeOfDay.now().format(context);
      setState(() {
      tasks.add(TaskItem(text: text, timeAdded: timeNow));
      });
    taskController.clear();
    }
  } //adds task

  void removeTask(int index) {
    setState(() {
    tasks.removeAt(index);
    });
  } //deletes and removes task

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 181, 201),
      appBar: AppBar(
      title: Text('TO-DO App'),
      backgroundColor: const Color.fromARGB(120, 4, 15, 175),
      ),
      body: Padding(
      padding: EdgeInsets.all(16),
        child: Column(
        children: [
                TextField(
                controller: taskController,
                decoration: InputDecoration(
                hintText: 'Enter your task',
                hintStyle: TextStyle(color: Colors.blue),
                border: OutlineInputBorder(),
              ),
            ) ,
            SizedBox(height: 10),
            ElevatedButton(
            onPressed: addTask,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 49, 8, 8),
            ),
            child: Text('Add Task'),
          ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    color: const Color.fromARGB(255, 218, 223, 146), //task container
                    child: ListTile(
                      title: Text(tasks[index].text),
                      subtitle: Text('Added at: ${tasks[index].timeAdded}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red), //delete icon
                        onPressed: () {
                          removeTask(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}