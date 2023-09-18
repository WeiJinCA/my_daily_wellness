import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Summary'),
      ),
      body: ListView(
        children: <Widget>[
          _buildSummaryLine(
            'Your sleep was Average.',
          ),
          _buildSummaryLine(
            'Your mood was Average.',
          ),
          _buildSummaryLine(
            'You did no exercies.',
          ),
          _buildSummaryLine(
            'You drank 0.0 cups of water.',
          ),
          _buildSummaryLine(
            "You didn't do something new.",
          ),
          _buildSummaryLine(
            'You noted down.',
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryLine(String text) {
    return ListTile(
      leading: const FaIcon(FontAwesomeIcons.handHoldingHeart),
      title: Text(text),
    );
  }
}
