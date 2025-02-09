import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/colors.dart';
import 'package:to_do_list/to_do_items.dart';

import 'package:to_do_list/todo.dart';


class Home extends StatefulWidget{
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState(){
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 10,
                      ),
                      for(ToDo todoo in _foundToDo.reversed)
                      ToDoItem(todo: todoo,onToDoChanged: _handleToDoChange,onDeleteItem: _deleteToDoItem,),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20,right: 10,left: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5,),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                        ),],
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: 'Add a new item ',
                          border: InputBorder.none,
                        ),
                      ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:20,right: 20),
                  child: ElevatedButton(
                    child: Icon(Icons.add,color: Colors.white,size: 20),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      primary: tdBlue,
                      minimumSize: Size(30,70),
                      elevation: 20,shadowColor: Colors.grey,
                    ),

                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });

  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });

  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todosList;
    }
    else{
      results = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
    .toList();
    }
    setState(() {
      _foundToDo = results;
    });

  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search,color: tdBlack,size: 20,),
            prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,),
          Text('To-Do List',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          )
        ],
      ),
    );
  }
}