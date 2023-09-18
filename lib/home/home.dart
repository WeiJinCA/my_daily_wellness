import 'package:flutter/material.dart';
import '../profile/profile.dart';
import '../summary/summary.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SummaryScreen(),
    const ProfileScreen(),

    // Add more pages as needed
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sleepValue = 3;
  double _moodValue = 3;
  double _waterIntakeValue = 3;
  String? _selectedDepartment = "None";
  bool _selectedTry = false;

  String _happinessText(double sliderValue) {
    return switch (sliderValue) {
      1 => "Horrible",
      2 => "Bad",
      3 => "Average",
      4 => "Good",
      5 => "Excellent",
      _ => "I don't know",
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Daily Wellness'),
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return ListView(
      children: <Widget>[
        const Center(
          child: Text(
            "Welcome home.",
            style: TextStyle(
              color: Colors.grey, // Change text color
              fontSize: 40.0, // Change font size
              fontStyle: FontStyle.italic, // Apply italic style
              fontFamily: 'Arial', // Change font family
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
          color: Colors.grey, // Change the divider color
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              "Let's begin with some questions.",
              style: TextStyle(
                color: Colors.black, // Change text color
                fontSize: 18.0, // Change font size
                // fontWeight: FontWeight.bold, // Apply font weight
                fontFamily: 'Arial', // Change font family
              ),
            ),
          ),
        ),
        _buildQuestion(
            "Did you sleep well last night?",
            Slider(
                value: _sleepValue,
                min: 1,
                max: 5,
                divisions: 4,
                label: _happinessText(_sleepValue),
                onChanged: (value) {
                  setState(() {
                    _sleepValue = value;
                  });
                })),
        _buildQuestion(
            "How was your mood today?",
            Slider(
                value: _moodValue,
                min: 1,
                max: 5,
                divisions: 4,
                label: _happinessText(_moodValue),
                onChanged: (value) {
                  setState(() {
                    _moodValue = value;
                  });
                })),
        _buildQuestion(
            "How much exercises did you do today?",
            DropdownMenu(
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "None", label: "None"),
                  DropdownMenuEntry(value: "Little", label: "Little"),
                  DropdownMenuEntry(value: "Some", label: "Some"),
                  DropdownMenuEntry(value: "A lot", label: "A lot"),
                ],
                onSelected: (value) => setState(() {
                      _selectedDepartment = value;
                    }))),
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
                    value: _waterIntakeValue,
                    min: 0,
                    max: 8,
                    label: _waterIntakeValue.toInt().toString(),
                    divisions: 8,
                    // thumbColor: null,
                    onChanged: (value) {
                      setState(() {
                        _waterIntakeValue = value;
                      });
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
            "Did you try something new today?",
            Row(
              children: [
                Checkbox(
                  value: _selectedTry,
                  onChanged: (value) => setState(() {
                    _selectedTry = value!;
                  }),
                ),
                const Text("Yes,I did something new."),
              ],
            )),
        _buildQuestion(
          "Personal notes",
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    // Add a border
                    borderRadius: BorderRadius.circular(
                        4.0), // Customize border radius as needed
                  ),
                  hintText: 'What would you like to say?',
                  contentPadding:
                      const EdgeInsets.fromLTRB(12.0, 70.0, 12.0, 12.0),
                )),
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
