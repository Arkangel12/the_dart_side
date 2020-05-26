import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firebase/firestore/sample1/my_logic.dart';
import 'package:the_dart_side/src/firebase/firestore/user.dart';
import 'detail/sample1_detail.dart';

class Sample1Firestore extends StatefulWidget {
  @override
  _Sample1FirestoreState createState() => _Sample1FirestoreState();
}

class _Sample1FirestoreState extends State<Sample1Firestore> {
  final myLogic = MyLogic();

  @override
  void initState() {
    myLogic.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Users"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Sample1Detail(),
          ));
          if (result != null && result) {
            myLogic.getUsers();
          }
        },
      ),
      body: Center(
        child: ValueListenableBuilder<List<User>>(
          valueListenable: myLogic.users,
          builder: (context, users, _) {
            return users != null
                ? ListView.separated(
                    separatorBuilder: (_, index) => Divider(
                      color: Colors.white,
                    ),
                    itemCount: users.length,
                    itemBuilder: (_, index) => ListTile(
                      title: Text(users[index].name),
                      subtitle: Text(users[index].email),
                      trailing: Icon(Icons.person),
                      onTap: () async {
                        final result = await Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Sample1Detail(user: users[index]),
                        ));
                        if (result != null && result) {
                          myLogic.getUsers();
                        }
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
