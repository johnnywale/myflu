import 'package:we_rate_dogs/pages/blurry_artist/data/mock_data.dart';
import 'package:we_rate_dogs/pages/blurry_artist/ui/artist_details_page.dart';
import 'package:flutter/material.dart';

class ArtistsDetailsAnimator extends StatefulWidget {
  @override
  _ArtistDetailsAnimator createState() => new _ArtistDetailsAnimator();
}

class _ArtistDetailsAnimator extends State<ArtistsDetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new ArtistDetailsPage(
      artist: MockData.andy,
      controller: _controller,
    );
  }
}