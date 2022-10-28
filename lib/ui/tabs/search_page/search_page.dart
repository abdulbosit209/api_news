import 'package:api_with_cubit/cubits/news/news_cubit.dart';
import 'package:api_with_cubit/ui/tabs/home_page/widgets/news_item.dart';
import 'package:api_with_cubit/ui/tabs/search_page/cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SearchCubit(),
  child: Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if(state is SearchInitial){
              return SizedBox(
                height: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        child: CupertinoSearchTextField(
                          onChanged: (v) => context.read<SearchCubit>().searchData(v),
                        ),
                      ),
                    ),
                    Expanded(child: context.watch<SearchCubit>().temp.isNotEmpty ? Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: context.watch<SearchCubit>().temp.length,
                            itemBuilder: (context, index){
                              var data = context.watch<SearchCubit>().temp.toList()[index];
                              print("data type ------------------------------- ${data.runtimeType}");
                              return NewsItem(
                                imageUrl: data.urlToImage,
                                title: data.title,
                                author: data.author,
                              );
                            },
                          ),
                        )
                      ],
                    ) : const Center(child: Text('NOTHING')),)

                  ],
                ),
              );
            } else if(state is SearchError){
              return const Center(
                child: Text('error'),
              );
            } else{
              return Expanded(
                child: Column(
                  children: [
                    Autocomplete<String>(optionsBuilder: (textEditingValue){
                      BlocProvider.of<SearchCubit>(context).searchData(textEditingValue.text);
                      return NewsCubit.allGlobalNews.map((e) {
                        debugPrint(e.author.toString());
                        if(e.author.toString().toLowerCase().contains(
                          textEditingValue.text.toString().toLowerCase()
                        )) {
                          return e.author;
                        }
                        return "";
                      });
                    })
                  ],
                ),
              );
            }

          },
        ),
      ),
    ),
);
  }
}
