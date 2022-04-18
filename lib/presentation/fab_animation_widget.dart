import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:taskwarrior/presentation/create_task_form.dart';

class FabAnimationWidget extends StatelessWidget {
  const FabAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fabSwitcher = _FadeThroughTransitionSwitcher(
      fillColor: Colors.transparent,
      child: Icon(
        Icons.create,
        color: Colors.white,
      ),
    );
    return OpenContainer(
      openBuilder: (_, __) => const CreateTaskForm(),
      onClosed: (_) {},
      closedShape: const CircleBorder(),
      closedColor: Theme.of(context).colorScheme.secondary,
      closedElevation: 6,
      closedBuilder: (_, openContainer) {
        return Tooltip(
          message: 'Add task',
          child: InkWell(
            onTap: () => openContainer(),
            child: const SizedBox(
              height: 56,
              width: 56,
              child: Center(child: fabSwitcher),
            ),
          ),
        );
      },
    );
  }
}

class _FadeThroughTransitionSwitcher extends StatelessWidget {
  const _FadeThroughTransitionSwitcher({
    Key? key,
    required this.fillColor,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor: fillColor,
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
        );
      },
      child: child,
    );
  }
}
