import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class MovieGetAll extends MovieEvent {
  const MovieGetAll();

  @override
  List<Object?> get props => [];
}

class MovieGetInfo extends MovieEvent {
  final int id;

  const MovieGetInfo(this.id);

  @override
  List<Object?> get props => [id];
}
