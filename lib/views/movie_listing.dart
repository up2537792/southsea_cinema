import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

@override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

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
            style: TextStyle(fontSize: 40.5),
          ),
          Text('Thursday 22 Oct 2026, 18:00 - ends at 19:14',
          style: TextStyle(fontSize: 20.5),),
          Text(
              'Please note that Discounts / Membership Benefits will be applied once you have selected your tickets',
            style: TextStyle(fontSize: 20.5),
          ),
          DropdownMenu<int>(
            initialSelection: _ticketQuantity,
            onSelected: (int? value) {
               if (value != null) {
                setState(() {
                  _ticketQuantity = value;
                  print('Tickets selected: $_ticketQuantity');
                });
              }
            },
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: '1'),
              DropdownMenuEntry(value: 2, label: '2'),
              DropdownMenuEntry(value: 3, label: '3'),
              DropdownMenuEntry(value: 4, label: '4'),
              DropdownMenuEntry(value: 5, label: '5'),
            ],
          ),
          Text('Tickets selected: $_ticketQuantity'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _bookingMessage =
                      'Added $_ticketQuantity tickets to the order';
                });
              },
              child: const Text('Add to order'),
           ),
           Text(_bookingMessage),
        ],
      )),
    );
  }
}
