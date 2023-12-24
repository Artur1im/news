part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class NewsLoadMore extends NewsEvent {}

class NewsFetchListInitial extends NewsEvent {}
