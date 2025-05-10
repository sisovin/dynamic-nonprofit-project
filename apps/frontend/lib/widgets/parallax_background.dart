import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ParallaxBackground extends StatefulWidget {
  final Widget child;
  final double parallaxFactor;

  ParallaxBackground({required this.child, this.parallaxFactor = 0.5});

  @override
  _ParallaxBackgroundState createState() => _ParallaxBackgroundState();
}

class _ParallaxBackgroundState extends State<ParallaxBackground> {
  ScrollController? _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController!.removeListener(_onScroll);
    _scrollController!.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController!.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -_scrollOffset * widget.parallaxFactor,
          left: 0,
          right: 0,
          child: widget.child,
        ),
        SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            height: MediaQuery.of(context).size.height * 2,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
