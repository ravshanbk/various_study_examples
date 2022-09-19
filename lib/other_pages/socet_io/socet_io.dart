import 'package:socket_io_client/socket_io_client.dart' as IO;

// flutter build apk --build-name=1.14 --build-number=14
import 'package:flutter/material.dart';

class SocketIoExamplePagee extends StatefulWidget {
  final String username = " Socket IO";
  const SocketIoExamplePagee({
    Key? key,
  }) : super(key: key);

  @override
  State<SocketIoExamplePagee> createState() => _SocketIoExamplePageState();
}

class _SocketIoExamplePageState extends State<SocketIoExamplePagee> {
  late IO.Socket _socket;
  final TextEditingController _messageInputController = TextEditingController();

  final List<dynamic> _list = [];
  _sendMessage() {
    print("object");
    _socket.emit('msgToServer', _messageInputController.text.trim());
    _messageInputController.clear();
    setState(() {
      print(_list.length);
    });
  }

  _connectSocket() {
    _socket.onConnect((data) =>
        print('============= Connection established ====================='));
    _socket.onConnectError((data) => print('Connect Error: $data'));
    _socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    _socket.on(
      'msgToClient',
      (data) {
        print("MESSAGE TO CLIENT");
        _list.add(data);
        setState(() {});
        // Provider.of<HomeProvider>(context, listen: false).addNewMessage(data);
      },
    );
    _socket.on(
      'msgToRavshanbek',
      (data) {
        print("MESSAGE TO RAVSHANBEK");
        _list.add(data);
        setState(() {});
        // Provider.of<HomeProvider>(context, listen: false).addNewMessage(data);
      },
    );
    _socket.on(
      'msgToUmar',
      (data) {
        print("MESSAGE TO UMAR");
        _list.add(data);
        setState(() {});
        // Provider.of<HomeProvider>(context, listen: false).addNewMessage(data);
      },
    );

    _socket.onError((data) => print('ON ERROR: $data'));
  }

  @override
  void initState() {
    super.initState();
    //Important: If your server is running on localhost and you are testing your app on Android then replace http://localhost:3000 with http://10.0.2.2:3000
    _socket = IO.io(
      'ws://116.203.177.198:7000/notifications',
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );
    _connectSocket();
  }

  @override
  void dispose() {
    _messageInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List msgs = _list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Socket.IO'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: msgs.length,
            itemBuilder: (context, index) {
              String message = msgs[index];
              return Card(
                child: Text(message.toString()),
              );
            },
          )),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageInputController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_messageInputController.text.trim().isNotEmpty) {
                        _sendMessage();
                      }
                    },
                    icon: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
