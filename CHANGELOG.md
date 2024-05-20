## [1.0.0]
* initial release
## [1.0.1]
* improved documentation, fixed source text formatting
## [1.0.2]
* added ``IScrollableTimelineDraggingState`` and ``NonSharedDraggingState`` to public API
## [1.0.3]
* ``IScrollableTimelineDraggingState`` now contains ``draggingId``. This allows support of new 
  flag: ``enablePosUpdateWhileDragging`` in ``ScrollableTimeline`` for automatically 
  scrolling multiple linked timelines when dragging.
## [1.0.4]
* added new parameter ``onVisibileTimeRangeUpdated`` to ``ScrollableTimeline`` and made all callback parameters nullables.
## [1.0.5]
* added ``ScrollableTimeLine.withThumbnails`` to have a timeline with thumbnails instead of minutes  
  and seconds. For this an implementation of ``ThumbnailProvider`` has to be supplied.

## [2.0.0]
* The member variables ``lengthSecs`` and ``StepSecs`` of ``ScrollableTimeline.withThumbnails`` are replaced by ``length`` and ``stepSize``, 
which are of type ``Duration`` instead of ``int`` and can therefore also be a non-integer amount of seconds. This breaks backwards 
compatibility with version 1.0.5. The constructor ScrollableTimeline maintains backwards compatibility however.
