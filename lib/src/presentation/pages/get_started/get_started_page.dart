import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Get Started Page',
        ),
      ),
    );
  }
}
