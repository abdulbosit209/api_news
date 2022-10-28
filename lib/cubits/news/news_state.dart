part of 'news_cubit.dart';

class NewsState extends Equatable{
    NewsState({
    required this.errorText,
    required this.formzStatus,
    required this.news
});

  final FormzStatus formzStatus;
  final String errorText;
  final List<Articles> news;

   NewsState copyWith({
     List<Articles>? news,
     FormzStatus? formzStatus,
     String? errorText,
   }) =>
       NewsState(
         news: news ?? this.news,
         formzStatus: formzStatus ?? this.formzStatus,
         errorText: errorText ?? this.errorText,
       );

   @override
   List<Object> get props => [
     news,
     formzStatus,
     errorText,
   ];

}