import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover Groups',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildGroupCard('Fitness Fanatics', 'https://picsum.photos/200/150', '1,234'),
                  SizedBox(width: 10),
                  _buildGroupCard('Healthy Eating Community', 'https://picsum.photos/201/150', '567'),
                  SizedBox(width: 10),
                  _buildGroupCard('Yoga and Mindfulness', 'https://picsum.photos/202/150', '890'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Filters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildFilterButton('Trending'),
                SizedBox(width: 10),
                _buildFilterButton('New'),
                SizedBox(width: 10),
                _buildFilterButton('My Groups'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupCard(String name, String image, String memberCount) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Members: $memberCount', style: TextStyle(fontSize: 14)),
            ElevatedButton(
              onPressed: () {},
              child: Text('Join Group'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String filter) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(filter),
    );
  }
}
