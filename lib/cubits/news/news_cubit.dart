
import 'package:api_with_cubit/data/models/articles/articles.dart';
import 'package:api_with_cubit/data/repsoitories/news_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'news_state.dart';


class NewsCubit extends Cubit<NewsState>{
  NewsCubit({required this.newsRepository}) : super(NewsState(
    news: [],
    formzStatus: FormzStatus.pure,
    errorText: "",
  ));

  final NewsRepository newsRepository;
  List<Articles> allNews = [];
  static List<Articles> allGlobalNews = [];

  void getAllData()async{
    List<Articles> dataApple = await newsRepository.getAllNewsApple();
    List<Articles> dataTechCrunch = await newsRepository.getAllNewsTechCrunch();
    List<Articles> dataWallStreet = await newsRepository.getAllNewsWallStreetJournal();
    allGlobalNews.addAll([...dataApple, ...dataTechCrunch, ...dataWallStreet] );
  }

  void getAllTeslaNews()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      allNews = await newsRepository.getAllNewsTesla();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          news: allNews,
        ),
      );

    }catch(e){
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: e.toString(),
        ),
      );
    }
  }

  void getAllAppleNews()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      allNews = await newsRepository.getAllNewsApple();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          news: allNews,
        ),
      );

    }catch(e){
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: e.toString(),
        ),
      );
    }
  }

  void getAllBusinessNews()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      allNews = await newsRepository.getAllNewsBusiness();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          news: allNews,
        ),
      );

    }catch(e){
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "getAllTeslaNewsError",
        ),
      );
    }
  }

  void getAllTechCrunchNews()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      allNews = await newsRepository.getAllNewsTechCrunch();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          news: allNews,
        ),
      );

    }catch(e){
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "getAllTeslaNewsError",
        ),
      );
    }
  }

  void getAllWallStreetJournalNews()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      allNews = await newsRepository.getAllNewsWallStreetJournal();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          news: allNews,
        ),
      );

    }catch(e){
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "getAllTeslaNewsError",
        ),
      );
    }
  }
}

