import 'package:flutter/material.dart';
import 'package:purple_web/lib.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
        actions: [
          IconButton(
            onPressed: () async {
              //TODO: do the logout
              await Nav.pushNamedAndRemoveUntil(
                  BaseModule.root, (p0) => p0.isFirst);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.teal,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Colors.teal,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  color: Colors.teal,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              color: context.theme.primaryColor,
              child: const Center(
                child: Text('logged'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
