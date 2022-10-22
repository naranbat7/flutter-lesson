import 'package:equatable/equatable.dart';
import 'package:movie/model/movie/index.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  const MovieInitial();

  @override
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {
  const MovieLoading();

  @override
  List<Object?> get props => [];
}

class MovieSuccess extends MovieState {
  const MovieSuccess();

  @override
  List<Object?> get props => [];
}

class MovieFailure extends MovieState {
  final String message;

  MovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieSuccessDetail extends MovieState {
  final MovieModel data;

  const MovieSuccessDetail(this.data);

  @override
  List<Object?> get props => [data];
}
