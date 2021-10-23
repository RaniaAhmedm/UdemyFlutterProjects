import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:udemyr/models/user/user_model.dart';



class UsersScreen extends StatelessWidget {

  List<UserModel>users=[
    UserModel(id: 1, name: 'Rania', phone: '1235566789'),
    UserModel(id: 2, name: 'mona', phone: '77777566789'),
    UserModel(id: 3, name: 'nora', phone: '888885566789'),
    UserModel(id: 4, name: 'adam', phone: '12888566789'),
    UserModel(id: 5, name: 'mahmoud', phone: '99999966789'),
    UserModel(id: 6, name: 'ahmed', phone: '00088766789'),
    UserModel(id: 1, name: 'Rania', phone: '1235566789'),
    UserModel(id: 2, name: 'mona', phone: '77777566789'),
    UserModel(id: 3, name: 'nora', phone: '888885566789'),
    UserModel(id: 4, name: 'adam', phone: '12888566789'),
    UserModel(id: 5, name: 'mahmoud', phone: '99999966789'),
    UserModel(id: 6, name: 'ahmed', phone: '00088766789'),
    UserModel(id: 1, name: 'Rania', phone: '1235566789'),
    UserModel(id: 2, name: 'mona', phone: '77777566789'),
    UserModel(id: 3, name: 'nora', phone: '888885566789'),
    UserModel(id: 4, name: 'adam', phone: '12888566789'),
    UserModel(id: 5, name: 'mahmoud', phone: '99999966789'),
    UserModel(id: 6, name: 'ahmed', phone: '00088766789'),
  ];
   UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pink,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey,
                  ),
                ),
            itemCount: users.length));
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.0,
              backgroundColor: Colors.pink.shade300,
              child:  Text(
                '${user.id}',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 17.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:  [
                Text(
                  ' ${user.name}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
                Text(
                  user.phone,
                  style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ],
            ),
          ],
        ),
      );
}
