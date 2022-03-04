part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class ActivityFetched extends HomeEvent {
  const ActivityFetched();

  @override
  List<Object> get props => [];
}
