import 'package:flutter/material.dart';

class CustomBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final String? label;
  final String id;
  CustomBarItem({
    required this.icon,
    this.activeIcon,
    this.label,
    required this.id,
  });
}

class CustomBarView extends StatefulWidget {
  final List<CustomBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBarView({super.key, 
    required this.items,
    required this.currentIndex,
    this.onTap,
  });

  @override
  State<CustomBarView> createState() => _CustomBarViewState();
}

class _CustomBarViewState extends State<CustomBarView> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          return Flexible(
            flex: 1,
            child: _buildTab(index),
          );
        }),
      ),
    );
  }

  Widget _buildTab(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.onTap?.call(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getIcon(index),
            if (widget.items[index].label != null)
              Text(
                widget.items[index].label!,
                style: TextStyle(
                  color: index == widget.currentIndex
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon(int index) {
    if (widget.currentIndex == index) {
      return widget.items[index].activeIcon ?? widget.items[index].icon;
    } else {
      return widget.items[index].icon;
    }
  }
}

/*
class CustomBarView extends StatefulWidget {
  final List<CustomBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  CustomBarView({
    required this.items,
    required this.currentIndex,
    this.onTap,
  });

  @override
  State<CustomBarView> createState() => _CustomBarViewState();
}

class _CustomBarViewState extends State<CustomBarView> {
  int _selectedIndex = 0;
  @override
 Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          return Flexible(
            flex: 1,
            child: InkWell(
              onTap: () {
                _selectedIndex = index;
                widget.onTap?.call(index);
                // if (onTap != null) {
                //   onTap!(index);
                // }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_selectedIndex == index ) {
widget.items[index].activeIcon,
                    } else {
                      widget.items[index].icon,
                    }
                    if (widget.items[index].label != null)
                      Text(
                        widget.items[index].label!,
                        style: TextStyle(
                          color: index == widget.currentIndex
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).textTheme.caption!.color,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
*/
