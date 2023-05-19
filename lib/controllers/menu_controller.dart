// ignore_for_file: prefer_final_fields

import 'package:animation_example/animations/menu_animations.dart';
import 'package:animation_example/constants/constants.dart';
import 'package:animation_example/constants/sizes.dart';
import 'package:animation_example/extensions/num_extension.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Widget;

class MenuController {
  MenuController({
    required this.menuAnimations,
  }) {
    init();
  }
  final MenuAnimations menuAnimations;

  List<Widget> _menuItems = Constants.menuItems;
  ValueNotifier<bool> _isMenu = ValueNotifier(false);
  ValueNotifier<double> _fabPosition = ValueNotifier(0);
  bool _animateFromDrag = false;
  AnimationController get _animationController =>
      menuAnimations.animationController;
  late double _maxDragVal;

  void init() {
    _maxDragVal = _menuItems.length * Sizes.menuItemHeight;
    menuAnimations.animationController
      ..addListener(_isMenuListener)
      ..addStatusListener(_reverseStatusListener);
    menuAnimations.fabPositionAnimation.addListener(_fabPositionListener);
  }

  bool get isMenu => _isMenu.value;
  List<Widget> get menuItems => _menuItems;

  double get fabPosition => _fabPosition.value;

  void _setIsMenu(bool value) {
    _isMenu.value = value;
  }

  void forwardController() {
    _animationController.forward();
  }

  void reverseController() {
    _animationController.reverse();
  }

  void resetController() {
    _animationController.reset();
  }

  void _setIsAnimateOnDrag(bool value) {
    _animateFromDrag = value;
  }

  void _setFabPosition(double value) {
    if (value >= _maxDragVal) {
      _fabPosition.value = menuAnimations.targetPosition;
    }
    _fabPosition.value = value;
  }

  void onVerticalDrag(double newPosition) {
    if (!_animateFromDrag) _setIsAnimateOnDrag(true);
    if ((_fabPosition.value - newPosition).abs() >= _maxDragVal) {
      _setIsMenu(true);
      return;
    }
    _setFabPosition(_fabPosition.value - -newPosition);
    _animationController.value =
        _fabPosition.value.normalize(menuAnimations.targetPosition);
  }

  void onVerticalDragEnd() {
    _setIsMenu(true);
    forwardController();
    _setIsAnimateOnDrag(false);
  }

  _isMenuListener() {
    if (!_animateFromDrag) {
      if (_animationController.value >= 0.7 &&
          _animationController.status == AnimationStatus.forward &&
          _isMenu.value != true) {
        _setIsMenu(true);
      }
    }
  }

  _reverseStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.reverse) _setIsMenu(false);
  }

  void _fabPositionListener() {
    if (!_animateFromDrag) {
      _fabPosition.value = (-menuAnimations.fabPositionAnimation.value
              .normalize(menuAnimations.targetPosition) *
          menuAnimations.targetPosition);
    }
  }

  dispose() {
    _animationController.removeListener(_isMenuListener);
    _animationController.removeListener(_fabPositionListener);
    _animationController.removeStatusListener(_reverseStatusListener);
    _animationController.dispose();
  }
}
