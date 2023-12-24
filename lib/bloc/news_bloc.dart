import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/api/news_api.dart';
import 'package:news/model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<NewsModel> news = [];

  NewsBloc() : super(NewsFetchingListInitial()) {
    on<NewsFetchListInitial>(newsInitialFetchEvent);
    on<NewsLoadMore>(newsLoadMore);
  }

  FutureOr<void> newsInitialFetchEvent(
    NewsFetchListInitial event,
    Emitter<NewsState> emit,
  ) async {
    emit(NewsFetchingLoadingState());
    await _requestAndAddNews();
    emit(NewsFetchingSuccessfulState(news: news));
  }

  FutureOr<void> newsLoadMore(
    NewsLoadMore event,
    Emitter<NewsState> emit,
  ) async {
    await _requestFetchMore();
    emit(NewsFetchingSuccessfulState(news: news));
  }

  FutureOr<void> _requestAndAddNews() async {
    news.clear();
    List<NewsModel> list = await NewsApi().news(count: 10);

    news.addAll(list);
  }

  FutureOr<void> _requestFetchMore() async {
    List<NewsModel> list = await NewsApi().news(count: 10);

    news.addAll(list);
  }
}
