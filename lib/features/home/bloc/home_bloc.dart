import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_logging/client/rest_client.dart';
import 'package:demo_logging/models/activity_model.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RestClient _client;

  HomeBloc({required RestClient client})
      : _client = client,
        super(HomeInitial()) {
    on<ActivityFetched>(_onActivityFetched);
  }

  FutureOr<void> _onActivityFetched(
    ActivityFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const ActivityFetchedInProgress());

    for (int i = 0; i < 10; i++) {
      try {
        final response = await _client.getActivity();

        if (state is ActivityFetchedSuccess) {
          final activities = (state as ActivityFetchedSuccess).activities;
          final newActivities = [...activities, response];
          emit(ActivityFetchedSuccess(newActivities));
        } else {
          emit(ActivityFetchedSuccess([response]));
        }
      } on Exception {
        emit(const ActivityFetchedFailure('Có lỗi xảy ra'));
        return;
      }
    }
  }
}
