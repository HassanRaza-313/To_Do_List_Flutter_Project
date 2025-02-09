import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/colors.dart';
import 'package:to_do_list/to_do_items.dart';

import 'package:to_do_list/todo.dart';


class Home extends StatelessWidget{
  Home({Key? key}) : super(key: key);

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: tdBGColor,
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
                        margin: EdgeInsets.only(top: 50,),
                        child: Text('To Do List',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      ),
                      for(ToDo todoo in todosList)
                      ToDoItem(todo: todoo,),
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
                      margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
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
                        decoration: InputDecoration(
                          hintText: 'Add a new item ',
                          border: InputBorder.none,
                        ),
                      ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom:15,right: 10),
                  child: ElevatedButton(
                    child: Icon(Icons.add,color: Colors.white,size: 35),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      primary: tdBlue,
                      minimumSize: Size(30,70),
                      elevation: 20,
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

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
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
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          )
        ],
      ),
    );
  }
}