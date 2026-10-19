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
        backgroundColor: cinemaBackground,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      backgroundColor: cinemaBackground,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DRACULA (1931)',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Southsea Cinema Room',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                'Runtime: 74 minutes',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Age rating: PG',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'A mysterious count is terrorised by a vampire who returns from the dead.',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Thursday 22 Oct 2026, 18:00',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Select Quantities (Up to 5 in total)',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),
              DropdownMenu<int>(
                width: 220,
                initialSelection: _ticketQuantity,
                label: const Text('Tickets'),
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() => _ticketQuantity = value);
                  }
                },
                dropdownMenuEntries: [
                  for (int quantity = 1; quantity <= 5; quantity++)
                    DropdownMenuEntry(
                      value: quantity,
                      label: '$quantity',
                    ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'Tickets selected: $_ticketQuantity',
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 34),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bookingMessage =
                          'Added $_ticketQuantity tickets to the order';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF85D4E8),
                    foregroundColor: const Color(0xFF1B1E28),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: const Text(
                    'ADD TO ORDER',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                _bookingMessage,
                style: const TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
