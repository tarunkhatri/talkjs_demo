import 'package:flutter/material.dart';
import 'package:talkjs_flutter/talkjs_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Session? session;
  Conversation? conversation;

  @override
  void initState() {
    session = Session(appId: 'tVyk8wKL');
    User? user = session?.getUser(
      id: 'test_id',
      name: 'testUser',
    );
    session?.me = user!;
    conversation = session!.getConversation(
      id: 'room_1',
      participants: {Participant(user!)},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 300,
            child: ChatBox(
              session: session!,
              conversation: conversation,
              showChatHeader: false,
            ),
          ),
        ],
      ),
    );
  }
}
