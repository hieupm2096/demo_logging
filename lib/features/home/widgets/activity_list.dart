import 'package:demo_logging/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ActivityFetchedFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is ActivityFetchedInProgress) {
          return const Center(
            child: SizedBox(
              height: 32.0,
              width: 32.0,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ActivityFetchedSuccess) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.activities[index].activity ?? ''),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: state.activities.length,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
