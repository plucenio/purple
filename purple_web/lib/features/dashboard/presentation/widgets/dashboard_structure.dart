import 'package:flutter/material.dart';
import '../../../../lib.dart';

class ActionMenu {
  final String text;
  final Icon icon;
  final Function() onPressed;

  const ActionMenu({
    required this.text,
    required this.icon,
    required this.onPressed,
  });
}

class DashboardStructure extends StatefulWidget {
  final Widget child;
  final List<ActionMenu> actions;
  const DashboardStructure({
    super.key,
    required this.child,
    this.actions = const [],
  });

  @override
  State<DashboardStructure> createState() => _DashboardStructureState();
}

class _DashboardStructureState extends State<DashboardStructure> {
  bool expanded = true;

  Widget get menu => Container(
        color: context.theme.colorScheme.primaryContainer,
        child: widget.actions.isNotEmpty
            ? AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        //TODO: replace this with a viewmodel
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      icon: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 200),
                        firstChild: const Icon(Icons.chevron_left),
                        secondChild: const Icon(Icons.chevron_right),
                        crossFadeState: expanded
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ),
                    ...widget.actions.map(
                      (item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: ButtonMenu(
                            text: expanded ? item.text : null,
                            icon: item.icon,
                            tooltipMessage: item.text,
                            onPressed: () => item.onPressed(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : Container(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                menu,
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      color: context.theme.colorScheme.primaryContainer,
                      child: widget.child,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: context.theme.colorScheme.primaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 60.0,
          color: Colors.purple.shade200,
        )
      ],
    );
  }
}
