import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calesa_MidtermExam',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'Mia',
    'Joy',
    'Cathy',
    'May',
    'Anne',
    'Angelina',
    'Jolie',
    'Chloe',
    'Shan',
    'Sean',
  ];

  final List<bool> addedStatus = List.generate(10, (index) => false);

  void showDetails(String item) {
    print('Walay sulod ni  $item');
  }

  void toggleAdd(int index) {
    setState(() {
      addedStatus[index] = !addedStatus[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calesa_MidtermExam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              color: addedStatus[index] ? const Color.fromARGB(255, 211, 122, 232) : const Color.fromARGB(255, 10, 185, 121),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    items[index],
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => showDetails(items[index]),
                        child: Text('Details'),
                      ),
                      ElevatedButton(
                        onPressed: () => toggleAdd(index),
                        child: Text(addedStatus[index] ? 'Added' : 'Add'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
