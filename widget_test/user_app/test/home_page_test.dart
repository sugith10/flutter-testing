import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_app/home_page.dart';
import 'package:user_app/user_model.dart';

void main() {
  testWidgets('Displays List of users with title as name and subtitle as email',
      (tester) async {
    final users = [
      User(id: 1, name: "Sugith", email: "email"),
      User(id: 2, name: "Raju", email: "email"),
      User(id: 3, name: "Ramu", email: "email"),
    ];

    Future<List<User>> mockFetchUsers() async {
      return Future.delayed(const Duration(seconds: 1), () => users);

      // return users;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(
          futureUsers: mockFetchUsers(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for(var user in users){
   expect(   find.text(user.name), findsOneWidget);
    }
  });
}
