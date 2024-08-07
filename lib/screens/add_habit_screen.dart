import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'habit_provider.dart';

class AddHabitScreen extends StatefulWidget {
  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Habit')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                onChanged: (value) {
                  description = value;
                },
                decoration: InputDecoration(labelText: 'Description'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<HabitProvider>(context, listen: false).addHabit(name, description);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Habit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
