import 'package:api_with_cubit/cubits/news/news_cubit.dart';
import 'package:api_with_cubit/data/models/articles/articles.dart';
import 'package:api_with_cubit/ui/tabs/home_page/widgets/my_button.dart';
import 'package:api_with_cubit/ui/tabs/home_page/widgets/news_item.dart';
import 'package:api_with_cubit/utils/constants.dart';
import 'package:api_with_cubit/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getAllAppleNews();
    BlocProvider.of<NewsCubit>(context).getAllData();
    buttonItems[0] = true;
    super.initState();
  }

  List<bool> buttonItems = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              const Expanded(child: SizedBox()),
              Image.asset(logo),
              const SizedBox(width: 5),
              Text("News 24",
                  style: MyTextStyle.semiBold14
                      .copyWith(color: Colors.black, fontSize: 20)),
              const Expanded(child: SizedBox()),
            ],
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyButton(buttonItem: buttonItems[0],
                      text: 'Apple news',
                      onTab: () {
                        setState(() {
                          for(int i = 0; i < buttonItems.length; i++){
                            buttonItems[i] = false;
                          }
                          buttonItems[0] = !buttonItems[0];
                        });
                        context.read<NewsCubit>().getAllAppleNews();
                      },
                    ),
                    const SizedBox(width: 10),
                    MyButton(buttonItem: buttonItems[1],
                      text: 'Tesla news',
                      onTab: () {
                        setState(() {
                          for(int i = 0; i < buttonItems.length; i++){
                            buttonItems[i] = false;
                          }
                          buttonItems[1] = !buttonItems[1];
                        });
                        context.read<NewsCubit>().getAllTeslaNews();
                      },
                    ),
                    const SizedBox(width: 10),
                    MyButton(buttonItem: buttonItems[2],
                      text: 'Business news',
                      onTab: () {
                        setState(() {
                          for(int i = 0; i < buttonItems.length; i++){
                            buttonItems[i] = false;
                          }
                          buttonItems[2] = !buttonItems[2];
                        });
                        context.read<NewsCubit>().getAllBusinessNews();
                      },
                    ),
                    const SizedBox(width: 10),
                    MyButton(buttonItem: buttonItems[3],
                      text: 'Tech news',
                      onTab: () {
                        setState(() {
                          for(int i = 0; i < buttonItems.length; i++){
                            buttonItems[i] = false;
                          }
                          buttonItems[3] = !buttonItems[3];
                        });
                        context.read<NewsCubit>().getAllTechCrunchNews();
                      },
                    ),
                    const SizedBox(width: 10),
                    MyButton(buttonItem: buttonItems[4],
                      text: 'Wall Street news',
                      onTab: () {
                        setState(() {
                          for(int i = 0; i < buttonItems.length; i++){
                            buttonItems[i] = false;
                          }
                          buttonItems[4] = !buttonItems[4];
                        });
                        context.read<NewsCubit>().getAllWallStreetJournalNews();
                      },
                    )
                  ],
                ),
              ),
              BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state.formzStatus == FormzStatus.submissionInProgress) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else
                    if (state.formzStatus == FormzStatus.submissionFailure) {
                      return Center(
                        child: Text(state.errorText.toString()),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.news.length,
                            itemBuilder: (_, index) {
                              return NewsItem(
                                imageUrl: state.news[index].urlToImage,
                                title: state.news[index].title,
                                author: state.news[index].author,
                              );
                            }),
                      );
                    }
                  }
              )
            ]
        )
    );
  }
}

