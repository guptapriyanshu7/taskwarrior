import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwarrior/database/database.dart';
import 'package:taskwarrior/presentation/fab_animation_widget.dart';
import 'package:taskwarrior/presentation/graphs_tab.dart';
import 'package:taskwarrior/presentation/projects_tab.dart';
import 'package:taskwarrior/presentation/tasks_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TaskDatabase>(create: (_) => CTaskDatabase()),
      ],
      child: const MaterialApp(
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabs = ['Tasks', 'Projects', 'Graphs'];

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                actions: const [
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
                title: const Text('Taskwarrior'),
                floating: true,
                pinned: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: _tabs.map((name) => Tab(text: name)).toList(),
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              TasksTab(name: _tabs[0]),
              ProjectsTab(name: _tabs[1]),
              GraphsTab(name: _tabs[2]),
            ],
          ),
        ),
        floatingActionButton: const FabAnimationWidget(),
      ),
    );
  }
}
