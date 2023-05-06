import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:fyp_ezymemory/ui/views/home/decklist_items.dart';
import 'package:popover/popover.dart';

import 'decklist_items.dart';

class GesturePopover extends StatelessWidget {
  final Widget? child;
  // final String deckId;
  final Function()? toEditDeckView;
  const GesturePopover({
    super.key,
    this.child,
    // required this.deckId,
    this.toEditDeckView,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          showPopover(
              context: context,
              // backgroundColor: PlatformTheme.of(context).secondaryBackgroundColor!,
              transitionDuration: const Duration(milliseconds: 50),
              barrierColor: Colors.transparent,
              contentDyOffset: -40,
              direction: PopoverDirection.bottom,
              // constraints: BoxConstraints(),
              arrowDxOffset: -100,
              bodyBuilder: (context) => ListView(
                    padding: const EdgeInsets.all(5),
                    children: [
                      const Divider(),
                      InkWell(
                        onTap: toEditDeckView,
                        child: Container(
                          height: 20,
                          // color: Colors.amber[200],
                          child: const Center(child: Text('Edit Deck')),
                        ),
                      ),
                      const Divider(),
                      Container(
                        height: 20,
                        // color: Colors.amber[300],
                        child: const Center(child: Text('Entry C')),
                      ),
                      const Divider(),
                      Container(
                        height: 20,
                        // color: Colors.amber[300],
                        child: const Center(child: Text('Entry C')),
                      ),
                    ],
                  ),
              height: 150,
              width: 150);
        },
        child: child);
  }
}