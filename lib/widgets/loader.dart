import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader {
  //bool _isLoading = false;
  Widget loadingIndivator = Container(
    child: LoadingAnimationWidget.discreteCircle(
        color: Colors.blue.shade600, size: 20),
  );
}
