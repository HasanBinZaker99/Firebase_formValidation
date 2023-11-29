import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scaffold Appbar'),
        ),
        backgroundColor: Colors.grey[400],
         body: Center(child: Text('Scaffold Widget Example'),
         ),
         floatingActionButton: FloatingActionButton(
          child: Text('T'),
          onPressed: (){},
         ),
         drawer: Drawer(
          child: Center(child:Text('Message')),
          ),
         bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'AC Unit',
                icon: Icon(Icons.ac_unit),
                ),
          ]
          ),
      ),
    ),
  );
}