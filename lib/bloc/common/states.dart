import 'package:equatable/equatable.dart';

abstract class CommonState extends Equatable {}

class CommonInitial extends CommonState {
  @override
  List<Object?> get props => [];
}

class CommonLoading extends CommonState {
  @override
  List<Object?> get props => [];
}

class CommonFailure extends CommonState {
  final String message;

  CommonFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class CommonSuccess extends CommonState {
  @override
  List<Object?> get props => [];
}
