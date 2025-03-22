import 'package:flutter_bloc/flutter_bloc.dart';

class OpacityCubit extends Cubit<double> {
  OpacityCubit() : super(0.0);

  void updateOpacity(double opacity) {
    print('OpacityCubit emitting opacity: $opacity');
    emit(opacity);
  }
}
