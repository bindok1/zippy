import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zippy/domain/entity/story_page_entity.dart';
import 'package:zippy/domain/usecase/get_story_page_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'story_event.dart';
part 'story_state.dart';
part 'generated/story_bloc.freezed.dart';


@injectable
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoryPageUseCase _getStoryPageUseCase;

  StoryBloc(this._getStoryPageUseCase) : super(const StoryState.initial()) {
    on<_GetStory>((event, emit) async {
      emit(const StoryState.loading());
      
      final result = await _getStoryPageUseCase.execute(event.id);
      
      result.fold(
        (failure) => emit(StoryState.error(failure.message ?? 'Error in bloc story_bloc')),
        (story) => emit(StoryState.loaded(story)),
      );
    });
  }
}