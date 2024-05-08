import 'package:flutter/material.dart';
import 'timeline_item_data.dart';

class TimelineItemWithThumbnail extends StatelessWidget {
  final TimelineItemData curItem;
  // potentially independent bg color for each item
  final Color backgroundColor;
  final double rulerOutsidePadding;
  final double rulerSize;
  final double rulerInsidePadding;
  final ThumbnailProvider thumbnailProvider;

  TimelineItemWithThumbnail(
      this.curItem,
      this.backgroundColor,
      this.rulerOutsidePadding,
      this.rulerSize,
      this.rulerInsidePadding,
      this.thumbnailProvider,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 1,
            vertical: rulerOutsidePadding,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          // outside of the range of the timeline, curItem.t will be -1 and an empty container should be returned
          child: (curItem.t >= 0)
              ? Image(image: thumbnailProvider.thumbnail(curItem.tSecs!), fit: BoxFit.contain)
              : new Container(),
    ));
  }
}

abstract class ThumbnailProvider {
  ImageProvider thumbnail(int index);
}
