import 'dart:convert';

import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/bloc/common/states.dart';
import 'package:facebook/models/newsfeed/index.dart';
import 'package:facebook/models/notification/index.dart';
import 'package:facebook/models/story/index.dart';
import 'package:facebook/provider/common.dart';
import 'package:facebook/provider/loader.dart';
import 'package:facebook/services/api/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonInitial()) {
    on<CommonLogin>((event, emit) async {
      emit(CommonLoading());
      try {
        final res = await ApiService().getRequest("/login/");
        final json = jsonDecode(res.data);
        CommonProvider.instance.setUserProfile(json['profileImg']);
        emit(CommonSuccess());
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
      }
    });
    on<CommonStoryGet>((event, emit) async {
      emit(CommonLoading());
      try {
        final res = await ApiService().getRequest("/story/");
        final json = jsonDecode(res.data);
        CommonProvider.instance.addStory(StoryModel.fromList(json));
        emit(CommonSuccess());
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
      }
    });
    on<CommonNewsfeedGet>((event, emit) async {
      emit(CommonLoading());
      LoaderProvider.instance.startLoading();
      CommonProvider.instance.setNewsfeedClear();
      try {
        final res = await ApiService().getRequest("/newsfeed/1");
        await Future.delayed(Duration(seconds: 1));
        final json = jsonDecode(res.data);
        print("page: 1 tatagdaw.");
        CommonProvider.instance.setNewsfeed(NewsfeedModel.fromList(json));
        emit(CommonSuccess());
        LoaderProvider.instance.cancelLoading();
        event.controller.refreshCompleted();
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
        LoaderProvider.instance.cancelLoading();
        event.controller.refreshFailed();
      }
    });
    on<CommonNewsfeedLoadMore>((event, emit) async {
      emit(CommonLoading());
      LoaderProvider.instance.startLoading();
      try {
        int page = CommonProvider.instance.newsFeedPage;
        page++;
        final res = await ApiService().getRequest("/newsfeed/$page");
        print("page: $page tatagdaw.");
        final json = jsonDecode(res.data);
        CommonProvider.instance.addNewsfeed(NewsfeedModel.fromList(json), page);
        LoaderProvider.instance.cancelLoading();
        emit(CommonSuccess());
        event.controller.loadComplete();
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
        LoaderProvider.instance.cancelLoading();
        event.controller.loadFailed();
      }
    });
    on<CommonNotificationGet>((event, emit) async {
      emit(CommonLoading());
      try {
        final res = await ApiService().getRequest("/notification");
        final json = jsonDecode(res.data);
        CommonProvider.instance.setNotification(NotificationModel.fromList(json['data']));
        emit(CommonSuccess());
      } catch (ex) {
        print(ex);
        emit(CommonFailure(ex.toString()));
      }
    });
  }
}
