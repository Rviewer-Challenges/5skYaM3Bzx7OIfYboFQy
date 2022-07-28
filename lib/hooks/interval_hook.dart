import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Timer eveyMinute(Function onTick) {
  return use(IntervalHook(onTick));
}

class IntervalHook extends Hook<Timer> {
  final Function onTick;

  const IntervalHook(this.onTick);

  @override
  HookState<Timer, Hook<Timer>> createState() {
    return _IntervalHookState();
  }
}

class _IntervalHookState extends HookState<Timer, IntervalHook> {
  late Timer _timer;

  @override
  void initHook() {
    super.initHook();
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      hook.onTick();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Timer build(BuildContext context) {
    return _timer;
  }
}
