import 'package:flutter/material.dart';
import '../profile/profile.dart';
import '../summary/summary.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../services/info_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SummaryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("My Daily Wellness"),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          // Add more navigation items as needed
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Daily Wellness'),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    var info = Provider.of<Info>(context, listen: true);

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Center(
            child: Text(
              "Welcome home.",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        const Center(
          child: FaIcon(
            FontAwesomeIcons.handHoldingHeart,
            color: Colors.blue,
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 232, 228, 228),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Let's begin with some questions.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
        _buildQuestion(
            "Did you sleep well last night?",
            Slider(
                value: info.sleepValue,
                min: 1,
                max: 5,
                divisions: 4,
                label: info.happinessText(info.sleepValue),
                onChanged: (value) {
                  info.setSleepValue(value);
                })),
        _buildQuestion(
            "How was your mood today?",
            Slider(
                value: info.moodValue,
                min: 1,
                max: 5,
                divisions: 4,
                label: info.happinessText(info.moodValue),
                onChanged: (value) {
                  info.setMoodValue(value);
                })),
        _buildQuestion(
          "How much exercise did you do today?",
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Transform.scale(
                  scale: 0.9, // Adjust the scale factor to change the size
                  child: DropdownMenu(
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: "None", label: "None"),
                        DropdownMenuEntry(value: "Little", label: "Little"),
                        DropdownMenuEntry(value: "Some", label: "Some"),
                        DropdownMenuEntry(value: "A lot", label: "A lot"),
                      ],
                      initialSelection: info.selectedExercise,
                      onSelected: (value) {
                        info.setSlectedExercise(value);
                      }))),
        ),
        _buildQuestion(
          "How much water did you drink?(cups)",
          Row(
            children: <Widget>[
              const Text(
                '0',
                style: TextStyle(
                  color: Colors.black, // Change text color
                  fontSize: 14.0, // Change font size
                  fontWeight: FontWeight.normal, // Apply font weight
                  fontFamily: 'Arial', // Change font family
                ),
              ), // Left label
              Expanded(
                child: Slider(
                    value: info.waterIntakeValue,
                    min: 0,
                    max: 8,
                    label: info.waterIntakeValue.toInt().toString(),
                    divisions: 8,
                    // thumbColor: null,
                    onChanged: (value) {
                      info.setWaterIntakeValue(value);
                    }),
              ),
              const Text(
                '8',
                style: TextStyle(
                  color: Colors.black, // Change text color
                  fontSize: 14.0, // Change font size
                  fontWeight: FontWeight.normal, // Apply font weight
                  fontFamily: 'Arial', // Change font family
                ),
              ),
            ],
          ),
        ),
        _buildQuestion(
          "Did you do something new today?",
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 0.8, // Adjust the scale factor to change the size
                  child: Checkbox(
                      value: info.isChecked,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        info.setIsSelected(value!);
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Yes,I did something new.",
                    style: TextStyle(
                      color: Colors.black, // Change text color
                      fontSize: 14.0, // Change font size
                      fontWeight: FontWeight.normal, // Apply font weight
                      fontFamily: 'Arial', // Change font family
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        _buildQuestion(
          "Personal notes",
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: info.textInput,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  // Add a border
                  borderRadius: BorderRadius.circular(
                      4.0), // Customize border radius as needed
                ),
                hintText: 'What would you like to say?',
                contentPadding:
                    const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 12.0),
              ),
              onChanged: (value) {
                info.setTextInput(value);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestion(String text, Widget inputWidget) {
    return ListTile(
      title: Text(text),
      subtitle: inputWidget,
    );
  }
}
