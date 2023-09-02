import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  late User loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat Screen'),
          actions: [
            IconButton(
              onPressed: () {
                _authentication.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.exit_to_app_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/zMUFw0qnQK6xWHxfXDrK/message')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 데이터를 기다리는 중일때 에러 메시지가 아닌 인디케이터를 보여줌
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    docs[index]['text'],
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
            );
          },
        ));
  }
}
