import 'package:flutter/material.dart';

class AllottedAreaPage extends StatelessWidget {
  // Example data for allotted areas
  final List<Map<String, String>> allottedAreas = [
    {'area': 'Room 101', 'status': 'Occupied'},
    {'area': 'Room 102', 'status': 'Available'},
    {'area': 'Parking A', 'status': 'Occupied'},
    {'area': 'Parking B', 'status': 'Available'},
    {'area': 'Room 103', 'status': 'Available'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allotted Areas'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Allotted Areas List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: allottedAreas.length,
                itemBuilder: (context, index) {
                  final area = allottedAreas[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        area['area']!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Status: ${area['status']}'),
                      leading: Icon(
                        area['status'] == 'Available' ? Icons.check_circle : Icons.cancel,
                        color: area['status'] == 'Available' ? Colors.green : Colors.red,
                      ),
                      onTap: () {
                        // Action when an area is tapped (e.g., more details or booking)
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Area: ${area['area']}'),
                              content: Text('Current Status: ${area['status']}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
