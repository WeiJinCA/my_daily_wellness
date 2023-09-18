import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../services/info_state.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var info = Provider.of<Info>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Summary'),
      ),
      body: ListView(
        children: <Widget>[
          _buildSummaryLine(
            'Your sleep was ${info.happinessText(info.sleepValue)}.',
          ),
          _buildSummaryLine(
            'Your mood was ${info.happinessText(info.moodValue)}.',
          ),
          _buildSummaryLine(
            'You did ${info.exerciseText(info.selectedExercise)} exercies.',
          ),
          _buildSummaryLine(
            'You drank ${info.waterIntakeValue} cups of water.',
          ),
          _buildSummaryLine(
            "You ${info.selectedText(info.selected)} something new.",
          ),
          _buildSummaryLine(
            'You noted down: ${info.textInput.text}',
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
