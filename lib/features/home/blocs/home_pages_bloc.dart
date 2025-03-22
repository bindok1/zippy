import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/domain/usecase/get_home_page_usecase.dart';

part 'home_pages_event.dart';
part 'home_pages_state.dart';
part 'generated/home_pages_bloc.freezed.dart';

@injectable
class HomePagesBloc extends Bloc<HomePagesEvent, HomePagesState> {
  final GetHomePagesUseCase _getHomePagesUseCase;

  HomePagesBloc(this._getHomePagesUseCase)
      : super(const HomePagesState.initial()) {
    on<HomePagesEvent>((event, emit) async {
      await event.when(
        getHomePages: () async {
          emit(const HomePagesState.loading());
          final result = await _getHomePagesUseCase.execute();
          result.fold(
            (failure) =>
                emit(HomePagesState.error(failure.message ?? 'failure sorry')),
            (stories) => emit(HomePagesState.loaded(stories)),
          );
        },
      );
    });
  }
}
