import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'content_viewmodel.dart';

class ContentViewTablet extends ViewModelWidget<ContentViewModel> {
  const ContentViewTablet({super.key});

  @override
  Widget build(BuildContext context, ContentViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - ContentView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
