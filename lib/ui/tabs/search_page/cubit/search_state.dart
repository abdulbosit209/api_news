part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchError extends SearchState {
   SearchError();
}

class SearchComplete extends SearchState {
   SearchComplete();
}
