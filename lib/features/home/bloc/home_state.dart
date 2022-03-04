part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class ActivityFetchedInProgress extends HomeState {
  const ActivityFetchedInProgress();

  @override
  List<Object> get props => [];
}

class ActivityFetchedSuccess extends HomeState {
  final List<ActivityModel> activities;

  const ActivityFetchedSuccess(this.activities);

  @override
  List<Object> get props => [activities];
}

class ActivityFetchedFailure extends HomeState {
  final String message;

  const ActivityFetchedFailure(this.message);

  @override
  List<Object> get props => [message];
}
