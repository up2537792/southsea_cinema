import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  testWidgets('Basic app loading test', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(
      find.text('Welcome to Southsea Cinema & Arts Centre'),
      findsOneWidget,
    );
  });

  testWidgets('Movie listing screen contains the booking form',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MovieListing()));

    expect(find.text('DRACULA (1931)'), findsOneWidget);
    expect(find.text('Runtime: 74 minutes'), findsOneWidget);
    expect(find.text('Age rating: PG'), findsOneWidget);
    expect(find.text('Select Quantities (Up to 5 in total)'), findsOneWidget);
    expect(find.text('Tickets selected: 1'), findsOneWidget);
    expect(find.text('ADD TO ORDER'), findsOneWidget);

    final bookingButton = find.text('ADD TO ORDER');
    await tester.ensureVisible(bookingButton);
    await tester.tap(bookingButton);
    await tester.pump();

    expect(find.text('Added 1 tickets to the order'), findsOneWidget);
  });
}
