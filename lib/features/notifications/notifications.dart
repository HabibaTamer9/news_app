import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("notifications".tr(),style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
