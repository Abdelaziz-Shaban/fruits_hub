import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    developer.log('🟢 Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    developer.log('⚡ Event Added in ${bloc.runtimeType}: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // onChange بتشتغل مع الـ Cubit والـ Bloc مع بعض
    developer.log(
      '🔄 Change in ${bloc.runtimeType}: Current: ${change.currentState} ---> Next: ${change.nextState}',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // onTransition مخصصة للـ Bloc فقط لأنها بتربط الـ Event بالـ States
    developer.log(
      '🔀 Transition in ${bloc.runtimeType}: Event: ${transition.event} | Current: ${transition.currentState} ---> Next: ${transition.nextState}',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log(
      '🔴 Error in ${bloc.runtimeType}: $error',
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    developer.log('🗑️ Closed: ${bloc.runtimeType}');
  }
}
