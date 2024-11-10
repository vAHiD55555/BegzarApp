import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ServerSelectionModal extends StatelessWidget {
  final String selectedServer;
  final Function(String) onServerSelected;

  ServerSelectionModal(
      {required this.selectedServer, required this.onServerSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('select_server'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Lottie.asset('assets/lottie/auto.json', width: 30),
              title: Text('Automatic'),
              trailing: selectedServer == 'Automatic'
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () => onServerSelected('Automatic'),
            ),
            Divider(),
            ListTile(
              // leading: Icon(Icons.flag, color: Colors.white, size: 32),
              leading: Lottie.asset('assets/lottie/server.json', width: 32),
              title: Text(
                'Server 1',
                style: TextStyle(fontFamily: 'GM'),
              ),
              trailing: selectedServer == 'Server 1'
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () => onServerSelected('Server 1'),
            ),
            ListTile(
              leading: Lottie.asset('assets/lottie/server.json', width: 32),
              title: Text(
                'Server 2',
                style: TextStyle(fontFamily: 'GM'),
              ),
              trailing: selectedServer == 'Server 2'
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () => onServerSelected('Server 2'),
            ),
          ],
        ),
      ),
    );
  }
}
