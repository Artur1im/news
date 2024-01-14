import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:news/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsBloc newsBloc = NewsBloc();
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    newsBloc.add(NewsFetchListInitial());
    _controller.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
          bloc: newsBloc,
          builder: (context, state) {
            if (state is NewsFetchingLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            } else if (state is NewsFetchingSuccessfulState) {
              final news = state.news;

              return SizedBox(
                  child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        final news = state.news[index];
                        return CustomCard(
                          title: news.title,
                          img: news.img,
                          link: news.link,
                          content: news.content,
                          pubDate: news.pubDate,
                          country: news.country,
                          category: news.category,
                        );
                      },
                    ),
                  )
                ]),
              ));
            }
            return const Center(
              child: Text('что то пошло не так'),
            );
          }),
    );
  }

  @override
  void dispose() {
    _controller.addListener(_onScrollEvent);

    super.dispose();
  }

  void _onScrollEvent() {
    final extentAfter = _controller.position.extentAfter;
    if (extentAfter < 300) {
      newsBloc.add(NewsLoadMore());
    }
  }
}
