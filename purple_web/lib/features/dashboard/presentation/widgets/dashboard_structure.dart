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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    color: context.theme.colorScheme.primaryContainer,
                    child: widget.showMenu
                        ? Column(
                            children: [
                              ButtonMenu(
                                text: 'Pacientes',
                                onPressed: () {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonMenu(
                                text: 'Evoluções',
                                onPressed: () {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonMenu(
                                text: 'Agenda',
                                onPressed: () {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonMenu(
                                text: 'Financeiro',
                                onPressed: () {},
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonMenu(
                                text: 'Configurações',
                                onPressed: () {},
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      color: context.theme.colorScheme.primaryContainer,
                      child: widget.child,
                    ),
                  ),
                ),
                Flexible(
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
