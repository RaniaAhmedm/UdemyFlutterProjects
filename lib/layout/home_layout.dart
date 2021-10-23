import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemyr/modules/archived_tasks/archivedscreen.dart';
import 'package:udemyr/modules/done_tasks/donescreen.dart';
import 'package:udemyr/modules/new_tasks/newScreenTasks.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [TasksScreen(), DoneScreen(), ArchivedScreen()];
  List<String> titles = [
    'New Tasks',
    'New Done',
    'New Archived',
  ];
  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timingController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('${titles[currentIndex]}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomSheetShown) {
            if(formKey.currentState!.validate()){
              insertoDatabase(
                title: titleController.text,
                date:  dateController.text,
                time:  timingController.text,
              ).then((value)  {
              Navigator.pop(context);
                  isBottomSheetShown = false;
                  setState(() {
                fabIcon = Icons.edit;
              });

              });

              
            }
           
          } else {
            scaffoldKey.currentState!.showBottomSheet(
              (context) => Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.grey[100],
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'title must not be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Task Title'),
                          prefixIcon: Icon(Icons.title),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      TextFormField(
                        controller: timingController,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((value) {
                            timingController.text=value!.format(context).toString();

                            print(value.format(context));
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'time must not be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Task Time'),
                          prefixIcon: Icon(Icons.watch_later_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      TextFormField(
                        controller: dateController,
                        keyboardType: TextInputType.datetime,
                        onTap: () {
                          showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2021-12-12')).then((value) {
                                print(DateFormat.yMMMd().format(value!));
                                dateController.text=DateFormat.yMMMd().format(value);
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'date must not be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Task Date'),
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(fabIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          print(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'tasks'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle_outline,
              ),
              label: 'done'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.archive_outlined,
              ),
              label: 'archived'),
        ],
      ),
      body: screens[currentIndex],
    );
  }

  Future<String> getName() async {
    return 'Mahmoud Shawky';
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) {
        print('database opened');
      },
    );
  }

  Future insertoDatabase({required String title,
    required String time,
    required String date,}) async{
    assert(date != null);
    assert(time != null);
    assert(title != null);
   return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title ,date,time,status) VALUES("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print(error.toString());
      });
      return null;
    });
  }
}
