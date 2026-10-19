import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});
  static const _ticketQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: EdgeInsets.all(30.23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spiderman',
            style: TextStyle(fontSize: 20.5),
          ),
          Text('Thursday 22 Oct 2026, 18:00 - ends at 19:14'),
          Text(
              'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets'),
          DropdownMenu<int>(
            initialSelection: _ticketQuantity,
            onSelected: (int? value) {
              print('hi');
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: '1'),
              DropdownMenuEntry(value: 2, label: '2'),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                print('add to order button pressed');
              },
              child: Text('add to order'))
        ],
      )),
    );
  }
}
