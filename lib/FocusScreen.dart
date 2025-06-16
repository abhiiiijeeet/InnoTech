import 'package:flutter/material.dart';
import 'dart:async';

class FocusSection extends StatefulWidget {
  @override
  _FocusSectionState createState() => _FocusSectionState();
}

class _FocusSectionState extends State<FocusSection> {
  int _focusTime = 25; // Default focus time
  int _remainingTime = 0; // Remaining time in seconds
  Timer? _timer; // Timer for managing the countdown
  bool _isRunning = false;

  void _startTimer() {
    setState(() {
      _remainingTime = _focusTime * 60; // Convert to seconds
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isRunning = false;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _remainingTime = 0;
    });
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _remainingTime = _focusTime * 60; // Reset to initial focus time
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor, // Background color
      child: Padding(
        padding: const EdgeInsets.all(20.0), // Improved padding
        child: Card(
          color: Color(0xFFFFFFFF), // Card color
          elevation: 4, // Shadow effect
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Focus Timer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  _formatTime(_remainingTime),
                  style: TextStyle(fontSize: 48),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _isRunning ? null : _startTimer,
                      child: Icon(Icons.play_arrow), // Play icon
                    ),
                    ElevatedButton(
                      onPressed: _isRunning ? _stopTimer : null,
                      child: Icon(Icons.stop), // Stop icon
                    ),
                    ElevatedButton(
                      onPressed: _resetTimer,
                      child: Icon(Icons.refresh), // Refresh icon
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}