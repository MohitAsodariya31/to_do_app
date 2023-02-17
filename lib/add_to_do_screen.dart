import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/to_do_model_screen.dart';

class AddToDoScreen extends StatefulWidget {
  final ToDoModel? data;
  const AddToDoScreen({Key? key, this.data}) : super(key: key);

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController desController = TextEditingController();

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dateController.text = DateFormat("dd/MM/yyyy").format(picked);
      setState(() {});
    }
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
  }

  getData() {
    if (widget.data != null) {
      titleController.text = widget.data!.title!;
      dateController.text = widget.data!.date!;
      timeController.text = widget.data!.time!;
      desController.text = widget.data!.description!;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add TO DO"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter Title",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              selectDate(context);
            },
            child: TextField(
              controller: dateController,
              decoration: InputDecoration(
                hintText: "Select Date",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                enabled: false,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              selectTime(context);
            },
            child: TextField(
              controller: timeController,
              decoration: InputDecoration(
                hintText: "select Time",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                enabled: false,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black38),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: desController,
            minLines: 4,
            maxLines: 7,
            decoration: InputDecoration(
              hintText: "Enter Description",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              ToDoModel data = ToDoModel(
                title: titleController.text,
                date: dateController.text,
                time: timeController.text,
                description: desController.text,
              );
              Navigator.pop(context, data);
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                const Size(double.infinity, 45),
              ),
            ),
            child: const Text("Add ToDO"),
          ),
        ],
      ),
    );
  }
}
