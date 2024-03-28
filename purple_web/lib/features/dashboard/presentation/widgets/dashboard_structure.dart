import 'package:flutter/material.dart';
import '../../../../lib.dart';

class DashboardStructure extends StatefulWidget {
  final bool showMenu;
  final Widget child;
  const DashboardStructure({
    super.key,
    this.showMenu = true,
    required this.child,
  });

  @override
  State<DashboardStructure> createState() => _DashboardStructureState();
}

class _DashboardStructureState extends State<DashboardStructure> {
  bool expanded = true;

  Widget get menu => Container(
        color: context.theme.colorScheme.primaryContainer,
        child: widget.showMenu
            ? AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    ButtonMenu(
                      text: expanded ? 'Pacientes' : null,
                      icon: const Icon(Icons.people),
                      tooltipMessage: 'Pacientes',
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonMenu(
                      text: expanded ? 'Evoluções' : null,
                      tooltipMessage: 'Evoluções',
                      icon: const Icon(Icons.file_open),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonMenu(
                      text: expanded ? 'Agenda' : null,
                      tooltipMessage: 'Agenda',
                      icon: const Icon(Icons.calendar_month),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonMenu(
                      text: expanded ? 'Financeiro' : null,
                      tooltipMessage: 'Financeiro',
                      icon: const Icon(Icons.monetization_on),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonMenu(
                      text: expanded ? 'Configurações' : null,
                      tooltipMessage: 'Configurações',
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
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
                AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: menu,
                ),
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
