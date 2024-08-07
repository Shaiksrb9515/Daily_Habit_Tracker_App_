import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'habit_provider.dart';
import 'package:provider/provider.dart';

class HabitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<HabitProvider>(context).habits,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final habits = snapshot.data!.docs;
        return ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) {
            var habit = habits[index];
            return ListTile(
              title: Text(habit['name']),
              subtitle: Text(habit['description']),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<HabitProvider>(context, listen: false).deleteHabit(habit.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}
