import 'package:embs_challenge/screens/home/components/post_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Ensure this import is present

const List<Map<String, dynamic>> postData = [
  {
    'username': 'user1',
    'timeAgo': '1 min ago',
    'challenge': 'challenge1',
    'tags': '#Health_Care #Energy',
    'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    'likes': 12000,
    'comments': 253,
  },
  {
    'username': 'user2',
    'timeAgo': '5 min ago',
    'challenge': 'challenge2',
    'tags': '#Tech #Innovation',
    'content':
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
    'likes': 8000,
    'comments': 150,
  },
  {
    'username': 'user2',
    'timeAgo': '5 min ago',
    'challenge': 'challenge2',
    'tags': '#Tech #Innovation',
    'content':
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
    'likes': 8000,
    'comments': 150,
  },

  // Add more post data as needed
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<bool> likedStatus;
  late List<Map<String, dynamic>> mutablePostData;

  @override
  void initState() {
    super.initState();
    likedStatus = List<bool>.filled(postData.length, false);
    mutablePostData =
        postData.map((post) => Map<String, dynamic>.from(post)).toList();
  }

  void toggleLike(int index) {
    setState(() {
      likedStatus[index] = !likedStatus[index];
      if (likedStatus[index]) {
        mutablePostData[index]['likes']++;
      } else {
        mutablePostData[index]['likes']--;
      }
    });
  }

  String getFormattedDate() {
    final now = DateTime.now();
    return DateFormat('EEE, MMM d').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/calendar.png", width: 20),
                    const SizedBox(width: 8),
                    Text(
                      getFormattedDate(),
                      style: const TextStyle(
                        color: Color(0xFF514F51),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFFC38BDA), Color(0xFFDDABAA)],
                    ),
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: mutablePostData.length,
              itemBuilder: (context, index) {
                final post = mutablePostData[index];
                return Column(
                  children: <Widget>[
                    PostCard(
                      username: post['username'],
                      timeAgo: post['timeAgo'],
                      challenge: post['challenge'],
                      tags: post['tags'],
                      content: post['content'],
                      likes: post['likes'],
                      comments: post['comments'],
                      isLiked: likedStatus[index],
                      onLikePressed: () => toggleLike(index),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
