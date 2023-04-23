import 'package:bookkaro/Screens/ComingSoon.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 145,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 30,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.directions_bus,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Text(
                        'Bus',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.directions_car,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Text(
                        'Car',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.calendar_month,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Text(
                        'Events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.sports_cricket,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Text(
                        'Cricket',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComingSoon()),
                    );
                  },
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        margin: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.explore,
                          size: 35,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Text(
                        'Blog',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
