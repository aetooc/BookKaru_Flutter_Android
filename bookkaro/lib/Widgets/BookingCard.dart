import 'package:bookkaro/Screens/Building.dart';
import 'package:bookkaro/Screens/ComingSoon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../Screens/ComingSoon.dart';

List mapData = [
  ['Bus', Icons.directions_bus, ComingSoon()],
  ['Car', Icons.directions_car, ComingSoon()],
  ['Explore', Icons.calendar_month, Building()],
  ['Cricket', Icons.sports_cricket, ComingSoon()],
  ['Blog', Icons.explore, ComingSoon()],
];

class BookingCard extends StatelessWidget {
  const BookingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> listItem = mapData
        .map((item) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => mapData[mapData.indexOf(item)][2]),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                // width: 170,
                // height: 130,
                constraints: const BoxConstraints(
                  minWidth: 100,
                  maxWidth: 170,
                  minHeight: 100,
                  maxHeight: 130,
                ),

                child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(199, 4, 184, 255),
                          Color.fromARGB(0, 120, 5, 5)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius:
                          BorderRadius.circular(10), //border corner radius
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              mapData[mapData.indexOf(item)][0].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              mapData[mapData.indexOf(item)][1],
                              size: 45,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
        .toList();

    List newItem = [];

    List logic() {
      for (var i = 0; i < listItem.length; i = i + 2) {
        if (i + 1 == listItem.length) {
          newItem.add(Row(children: [
            SizedBox(
              width: 10,
            ),
            listItem[i]
          ]));
          break;
        }
        newItem.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [listItem[i], listItem[i + 1]]));
      }
      return newItem;
    }

    return Column(children: [
      // Row(children: [...listItem.map((e) => e).toList()])
      // ...newItem.map((e) => e)
      ...logic(),
    ]);
  }
}
