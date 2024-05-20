import 'package:flutter/material.dart';

class TimelineItemWithThumbnail extends StatelessWidget {
  final Duration position;
  // potentially independent bg color for each item
  final Color backgroundColor;
  final double rulerOutsidePadding;
  final double rulerSize;
  final double rulerInsidePadding;
  final ThumbnailProvider thumbnailProvider;

  TimelineItemWithThumbnail(
      this.position,
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
          child: (position >= Duration.zero && thumbnailProvider.thumbnail(position) != null)
              ? Image(image: thumbnailProvider.thumbnail(position)!, fit: BoxFit.contain)
              : new Container(),
    ));
  }
}

abstract class ThumbnailProvider {
  ImageProvider? thumbnail(Duration position);
}
