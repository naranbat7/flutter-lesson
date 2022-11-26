import 'package:facebook/bloc/common/bloc.dart';
import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/provider/common.dart';
import 'package:facebook/widgets/newsfeed_card.dart';
import 'package:facebook/widgets/newsfeed_profile.dart';
import 'package:facebook/widgets/story_card.dart';
import 'package:facebook/widgets/story_create.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsfeedPage extends StatefulWidget {
  const NewsfeedPage({super.key});

  @override
  State<NewsfeedPage> createState() => _NewsfeedPageState();
}

class _NewsfeedPageState extends State<NewsfeedPage> {
  final _scrollController = ScrollController();
  final _refreshController = RefreshController();
  final _bloc = CommonBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(CommonStoryGet());
    _bloc.add(CommonNewsfeedGet(_refreshController));
  }

  void _onRefresh() {
    _bloc.add(CommonNewsfeedGet(_refreshController));
  }

  void _onLoadmore() {
    _bloc.add(CommonNewsfeedLoadMore(_refreshController));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return Scaffold(
          body: Scrollbar(
            controller: _scrollController,
            child: SmartRefresher(
              controller: _refreshController,
              scrollController: _scrollController,
              onRefresh: _onRefresh,
              onLoading: _onLoadmore,
              enablePullUp: true,
              enablePullDown: true,
              child: ListView(
                controller: _scrollController,
                children: [
                  NewsFeedProfileWidget(),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StoryCreateWidget(),
                          ...List.generate(
                            provider.storyList.length,
                            (index) => StoryCardWidget(provider.storyList[index]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ...List.generate(
                    provider.newsfeedList.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: NewsfeedCard(provider.newsfeedList[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
