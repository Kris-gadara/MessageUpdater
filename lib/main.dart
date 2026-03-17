import 'package:flutter/material.dart';

void main() {
  runApp(const MessageUpdaterApp());
}

class MessageUpdaterApp extends StatelessWidget {
  const MessageUpdaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MessageUpdater',
      home: const MessageUpdaterPage(),
    );
  }
}

class MessageUpdaterPage extends StatefulWidget {
  const MessageUpdaterPage({super.key});

  @override
  State<MessageUpdaterPage> createState() => _MessageUpdaterPageState();
}

class _MessageUpdaterPageState extends State<MessageUpdaterPage> {
  String _message = 'Welcome to MessageUpdater';

  Future<void> _updateMessage() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter new message'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('Update'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() => _message = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MessageUpdater'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateMessage,
              child: const Text('Update Message'),
            ),
          ],
        ),
      ),
    );
  }
}
