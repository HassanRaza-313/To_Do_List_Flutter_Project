import 'package:flutter/material.dart';
import 'package:to_do_list/colors.dart';
import 'package:to_do_list/todo.dart';

class ToDoItem extends StatelessWidget{
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem ({Key? key, required this.todo,required this.onToDoChanged,required this.onDeleteItem}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        child: ListTile(
          onTap: () {
            //print('Clicked');
            onToDoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          leading: Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,color: tdBlue,),
          title: Text(todo.todoText! ,style: TextStyle(fontSize: 16,color: tdBlack,decoration: todo.isDone? TextDecoration.lineThrough : null),),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(color: Colors.white, iconSize: 20,icon: Icon(Icons.delete),
              onPressed: () {
                 onDeleteItem(todo.id);
              },),
          ),
        )
    );
  }
}