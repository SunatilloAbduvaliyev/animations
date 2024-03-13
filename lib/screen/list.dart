import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'items.db';
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE items (id INTEGER PRIMARY KEY, name TEXT)');
      },
    );
    List<Map> result = await database.rawQuery('SELECT * FROM items');
    List<String> items = [];
    for (var item in result) {
      items.add(item['name']);
    }
    setState(() {
      _items = items;
    });
  }

  Future<void> _addItem(String name) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'items.db';
    Database database = await openDatabase(path);
    await database.transaction((txn) async {
      await txn.rawInsert('INSERT INTO items(name) VALUES(?)', [name]);
    });
    _initializeDatabase();
  }

  Future<void> _updateItem(int id, String newName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'items.db';
    Database database = await openDatabase(path);
    await database.transaction((txn) async {
      await txn.rawUpdate('UPDATE items SET name = ? WHERE id = ?', [newName, id]);
    });
    _initializeDatabase();
  }

  Future<void> _deleteItem(int id) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'items.db';
    Database database = await openDatabase(path);
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM items WHERE id = ?', [id]);
    });
    _initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFlite Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit Item'),
                          content: TextField(
                            controller: _textFieldController,
                            decoration: InputDecoration(hintText: 'Enter new name'),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Update'),
                              onPressed: () {
                                _updateItem(index + 1, _textFieldController.text);
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onLongPress: () {
                    _deleteItem(index + 1);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'Add Item',
                hintText: 'Enter item name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _addItem(_textFieldController.text);
                    _textFieldController.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
