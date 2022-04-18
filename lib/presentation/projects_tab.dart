
import 'package:flutter/material.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        key: PageStorageKey<String>(name),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints.expand(
                        width: 450,
                        height: 200,
                      ),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://bit.ly/3t9safL'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Project $index',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0)
                  ],
                ),
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
