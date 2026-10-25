import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'content_viewmodel.dart';

class ContentViewMobile extends ViewModelWidget<ContentViewModel> {
  const ContentViewMobile({super.key});

  @override
  Widget build(BuildContext context, ContentViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - ContentView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
