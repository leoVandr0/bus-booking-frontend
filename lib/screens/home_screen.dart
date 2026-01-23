import 'package:flutter/material.dart';

class BusSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A), // Dark background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("BUS BOOKING", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Onward / Return Toggle
            Row(
              children: [
                Expanded(child: _toggleButton("Onward", true)),
                SizedBox(width: 10),
                Expanded(child: _toggleButton("Return", false)),
              ],
            ),
            SizedBox(height: 20),
            // Search Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _locationField("From", "Rajkot", Icons.bus_alert),
                  Divider(),
                  _locationField("To", "Ahmedabad", Icons.location_on),
                  Divider(),
                  _locationField("Date", "01-01-2024", Icons.calendar_today, trailing: "Tomorrow"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: Text("Search Buses"),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("View your recent search >>>", style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _toggleButton(String title, bool isActive) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(title, style: TextStyle(color: isActive ? Colors.black : Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _locationField(String label, String val, IconData icon, {String? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(val, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Spacer(),
          if (trailing != null) Text(trailing, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}