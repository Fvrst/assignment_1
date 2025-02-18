import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Admin',
      'subtitle': 'About the admin',
      'image': 'assets/user.png',
      'description': 'This is the full description of item 1.'
    },
    {
      'title': 'Contact',
      'subtitle': 'Contact us',
      'image': 'assets/contact.png',
      'description': 'This is the full description of item 2.'
    },
    {
      'title': 'Settings',
      'subtitle': 'page settings',
      'image': 'assets/setup.png',
      'description': 'This is the full description of item 3.'
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment 1'),
        backgroundColor:   const Color.fromARGB(255, 16, 80, 98),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(items[index]['image']!),
              title: Text(items[index]['title']!),
              subtitle: Text(items[index]['subtitle']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: items[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;

 const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']!),
        backgroundColor:   const Color.fromARGB(255, 16, 80, 98)
,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(item['image']!),
          const  SizedBox(height: 10),
            Text(
              item['title']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
           const SizedBox(height: 10),
            Text(
              item['subtitle']!,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
           const SizedBox(height: 10),
            Text(
              item['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
