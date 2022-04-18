import 'package:flutter/material.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> with AutomaticKeepAliveClientMixin {
  final isDone = List.generate(30, (index) => false);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        key: PageStorageKey<String>(widget.name),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Task $index'),
                  subtitle: Text(
                      'Project $index | Blocked by $index | Due 3/12/2022'),
                  trailing: Checkbox(
                    value: isDone[index],
                    onChanged: (_) {
                      setState(() {
                        isDone[index] = !isDone[index];
                      });
                    },
                  ),
                ),
                childCount: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
