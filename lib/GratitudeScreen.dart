import 'package:flutter/material.dart';

class GratitudeSection extends StatefulWidget {
  @override
  _GratitudeSectionState createState() => _GratitudeSectionState();
}

class _GratitudeSectionState extends State<GratitudeSection> {
  final List<String> _gratitudeEntries = []; // List to hold gratitude entries
  final TextEditingController _controller = TextEditingController(); // Controller for the text field

  void _addGratitudeEntry() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _gratitudeEntries.add(_controller.text); // Add entry to the list
        _controller.clear(); // Clear the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, // Background color
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Padding around the section
        child: Card(
          color: Colors.white, // Card color
          elevation: 4, // Shadow effect
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gratitude Journal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'What are you grateful for?',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _addGratitudeEntry,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor, // Use primary color for button
                      ),
                      child: Icon(Icons.add), // Add icon
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _gratitudeEntries.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color(0xFFEDE7F6), // Light purple for entries
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            _gratitudeEntries[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}