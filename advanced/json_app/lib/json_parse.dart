import 'package:flutter/material.dart';
import 'package:json_app/service.dart';
import 'package:json_app/user.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _user = <User>[];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getInfo().then((value) {
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'User' : 'Loading...'),
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, index) {
          User user = _user[index];
          return ListTile(
            leading: Icon(
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(user.name),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(user.phone),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('close'))
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.phone_android_outlined),
              color: Colors.red,
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
