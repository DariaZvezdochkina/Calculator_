import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(70, 30, 20, 30),
        child: Column(
          children: [
            FutureBuilder<SharedPreferences>(
              future: Persistence.init(),
              builder: (context, AsyncSnapshot<SharedPreferences> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                List<String> values = snapshot.data
                    .getKeys()
                    .map<String>((key) => snapshot.data.get(key))
                    .toList();
                return Column(
                  children: values.map<Widget>((result) => Text(result)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Persistence {
  static Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
