part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  final Position? position;
  final String? error;

  const LocationState({this.position, this.error});

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  const LocationLoaded(Position position) : super(position: position);
}

class LocationError extends LocationState {
  const LocationError(String error) : super(error: error);
}
