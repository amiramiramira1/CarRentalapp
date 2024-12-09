import 'package:flutter/material.dart';
import 'package:project3/widgets/custom_scaffold.dart'; // Assuming CustomScaffold is defined elsewhere.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Tracks the selected navigation bar index

  // Screens for navigation
  final List<Widget> _screens = [
    HomeScreenContent(), // Content for Home Screen
    const Screenmabd2ya(title: "Profile Screen"), // Placeholder for Profile
    const Screenmabd2ya(title: "Menu Screen"), // Placeholder for Menu
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Highlight the selected item
        onTap: _onItemTapped, // Handle taps
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

// Content for the Home Screen
class HomeScreenContent extends StatelessWidget {
  HomeScreenContent({super.key});

  final List<Map<String, String>> posts = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'White Friday 10%',
      'description': 'This is a description for product 1.'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Offer 2',
      'description': 'This is a description for product 2.'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Offer 3',
      'description': 'This is a description for product 3.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search available cars...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.blueGrey),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Posts Section
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        // Post Image
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                          child: Image.network(
                            post['image']!,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // Post Details
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['title']!,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  post['description']!,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

// Placeholder Widget for Profile and Menu screens
class Screenmabd2ya extends StatelessWidget {
  final String title;

  const Screenmabd2ya({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
