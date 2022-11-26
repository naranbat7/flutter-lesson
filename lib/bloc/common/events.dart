import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class CommonEvent extends Equatable {}

class CommonLogin extends CommonEvent {
  final String username, password;

  CommonLogin(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class CommonStoryGet extends CommonEvent {
  CommonStoryGet();

  @override
  List<Object?> get props => [];
}

class CommonNewsfeedGet extends CommonEvent {
  final RefreshController controller;

  CommonNewsfeedGet(this.controller);

  @override
  List<Object?> get props => [];
}

class CommonNewsfeedLoadMore extends CommonEvent {
  final RefreshController controller;

  CommonNewsfeedLoadMore(this.controller);

  @override
  List<Object?> get props => [];
}

class CommonNotificationGet extends CommonEvent {
  CommonNotificationGet();

  @override
  List<Object?> get props => [];
}
