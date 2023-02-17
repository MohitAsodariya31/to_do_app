import 'package:flutter/material.dart';
import 'package:to_do_app/add_to_do_screen.dart';
import 'package:to_do_app/to_do_model_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> toDoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: toDoList.isEmpty
          ? const Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.separated(
              itemCount: toDoList.length,
              padding: const EdgeInsets.all(15),
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    toDoList.removeAt(index);
                  } else if (direction == DismissDirection.startToEnd) {
                    dynamic data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToDoScreen(
                          data: toDoList[index],
                        ),
                      ),
                    );
                    if (data != null) {
                      toDoList[index] = data;
                      setState(() {});
                    }
                  }
                  setState(() {});
                },
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20.0),
                  color: Colors.blue,
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  tileColor: Colors.grey.shade300,
                  title: Text("Title: ${toDoList[index].title}"),
                  subtitle: Text("Description: ${toDoList[index].description}"),
                  trailing: Column(
                    children: [
                      Text("Time: ${toDoList[index].time}"),
                      Text("Date: ${toDoList[index].date}"),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic data = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddToDoScreen(),
            ),
          );
          if (data != null) {
            toDoList.add(data);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
