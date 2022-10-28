import 'package:api_with_cubit/cubits/news/news_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());


  Set temp = {};

  searchData(String text){
    print("Global data ${NewsCubit.allGlobalNews.length}");
    temp.clear();
    emit(SearchInitial());
    for(int i = 0; i < NewsCubit.allGlobalNews.length; i++){
      if(text.isEmpty){
        temp.clear();
        emit(SearchInitial());
      } else if(NewsCubit.allGlobalNews[i].author.toString().toLowerCase().contains(text.toString().toLowerCase())){
        temp.add(NewsCubit.allGlobalNews[i]);
        emit(SearchInitial());
      }
    }
  }
}
