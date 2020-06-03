import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firebase/firestore/user.dart';

import 'detail/sample2_detail.dart';
import 'my_logic.dart';

class Sample2Firestore extends StatefulWidget {
  @override
  _Sample1FirestoreState createState() => _Sample1FirestoreState();
}

class _Sample1FirestoreState extends State<Sample2Firestore> {
  final myLogic = MyLogic();

  @override
  void initState() {
    myLogic.getUsers();
    super.initState();
  }

  @override
  void dispose() {
    myLogic.cancel();
    super.dispose();
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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Sample2Detail(),
          ));
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Sample2Detail(user: users[index]),
                        ));
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
