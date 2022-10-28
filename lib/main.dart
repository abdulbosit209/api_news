import 'package:api_with_cubit/cubits/news/news_cubit.dart';
import 'package:api_with_cubit/data/local/storage.dart';
import 'package:api_with_cubit/data/repsoitories/news_repository.dart';
import 'package:api_with_cubit/data/services/api_client.dart';
import 'package:api_with_cubit/data/services/api_provider.dart';
import 'package:api_with_cubit/ui/tabs/tab.dart';
import 'package:api_with_cubit/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
  // runApp(const MyApp());
}
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final ApiProvider apiProvider = ApiProvider(
    apiClient: ApiClient(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NewsRepository>(
            create: (_) => NewsRepository(apiProvider: apiProvider),
          )
        ],
        child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (BuildContext context) => NewsCubit(
              newsRepository: NewsRepository(apiProvider: apiProvider),
            ),
          ),
        ], child: const MyApp()));
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Tabs(),
    );
  }
}
