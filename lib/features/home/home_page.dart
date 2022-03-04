import 'package:demo_logging/client/dio_di.dart';
import 'package:demo_logging/client/rest_client.dart';
import 'package:demo_logging/features/home/bloc/home_bloc.dart';
import 'package:demo_logging/features/home/widgets/activity_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(client: RestClient(DioDi().dio))
          ..add(const ActivityFetched()),
        child: const ActivityList(),
      ),
    );
  }
}
