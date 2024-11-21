import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.height,
            child: ListViewScreen()),
          // Center(
          //   child: Text('hallow'),
          // )
          
        ],
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  final List<String> item = items;

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${items[index]} ditekan')));
              },
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    items[index],
                    style: TextStyle(fontSize: 14),
                  )),
            ),
          );
        });
  }
}

List<String> items = ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'];
