import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/movie/events.dart';
import 'package:movie/bloc/movie/states.dart';
import 'package:movie/global_keys.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/services/api/index.dart';
import 'package:provider/provider.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieGetAll>((event, emit) async {
      if (Provider.of<CommonProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false).movies.isEmpty) {
        emit(MovieLoading());
        try {
          final api = ApiService();
          final res = await api.getRequest("/635401b30e6a79321e311095", true);
          List<MovieModel> data = MovieModel.fromList(res.data['record']);
          Provider.of<CommonProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false).setMovies(data);
          emit(MovieSuccess());
        } catch (ex) {
          print(ex);
          emit(MovieFailure(ex.toString()));
        }
      }
    });
    on<MovieGetInfo>((event, emit) async {
      emit(MovieLoading());
      try {
        final api = ApiService();
        final res = await api.getRequest("/635405970e6a79321e311371", true);
        MovieModel data = MovieModel.fromJson(res.data['record']);
        emit(MovieSuccessDetail(data));
      } catch (ex) {
        print(ex);
        emit(MovieFailure(ex.toString()));
      }
    });
  }
}
