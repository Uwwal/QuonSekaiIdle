/// 正在生效的effect

import 'dart:async';

import '../../../constants/error_constants.dart';
import 'effect.dart';
import '../../enum/effect_type.dart';

/// list和durationList一一对应, -1代表永续效果
/// 用定时器去掉超时的effect
class EffectList {
  List<Effect> list = [];
  // sort example: 1 2 3 4 5 -1 -1 -1
  List<int> durationList = [];

  int modifyOutgoingDamageNum = 0;
  int modifyIncomingDamageNum = 0;
  int modifyStatus = 0;
  int modifyActionInterval = 0;
  int modifyEffectList = 0;

  late final _TimerManager _timerManager = _TimerManager(this);

  EffectList({List<Effect>? list}) {
    if (list != null) {
      durationList.addAll(List<int>.filled(list.length, -1));

      for (var effect in this.list) {
        switch (effect.type) {
          case EffectType.modifyOutgoingDamageNum:
            modifyOutgoingDamageNum++;
            break;
          case EffectType.modifyIncomingDamageNum:
            modifyIncomingDamageNum++;
            break;
          case EffectType.modifyStatus:
            modifyStatus++;
            break;
          case EffectType.modifyActionInterval:
            modifyActionInterval++;
            break;
          case EffectType.modifyEffectList:
            modifyEffectList++;
          default:
            throw Error();
        }
      }
    }
  }

  /// 感觉用不上, 参考list.addAll
  void addAll(EffectList other) {
    list.addAll(other.list);
    durationList.addAll(other.durationList);

    modifyOutgoingDamageNum += other.modifyOutgoingDamageNum;
    modifyIncomingDamageNum += other.modifyIncomingDamageNum;
    modifyStatus += other.modifyStatus;
    modifyActionInterval += other.modifyActionInterval;
    modifyEffectList += other.modifyEffectList;
  }

  /// 剪枝 = 0
  bool checkEffectTypeAboveZero(EffectType effectType) {
    switch (effectType) {
      case EffectType.modifyOutgoingDamageNum:
        return modifyOutgoingDamageNum > 0;
      case EffectType.modifyIncomingDamageNum:
        return modifyActionInterval > 0;
      case EffectType.modifyStatus:
        return modifyStatus > 0;
      case EffectType.modifyActionInterval:
        return modifyActionInterval > 0;
      case EffectType.modifyEffectList:
        return modifyEffectList > 0;
      default:
        throw Error();
    }
  }

  Future<void> addEffect(Effect effect, int duration) async {
    if (duration == -1) {
      durationList.add(duration);
      list.add(effect);
      return;
    }

    var index = 0;
    while (index < durationList.length) {
      var temDuration = durationList[index];
      if (temDuration > duration || temDuration == -1) {
        list.insert(index, effect);
        durationList.insert(index, duration);

        break;
      }
      index++;
    }
    // 首位意味着需要开定时器
    if (index == 0) {
      if (durationList.length > 1 && durationList[1] != -1) {
        await _timerManager.startTimer(duration);
      } else {
        var lastTime = _timerManager.stopTimer();
        _minusDuration(lastTime);
        await _timerManager.startTimer(duration);
      }
    }
  }

  List<Effect> getEffectTypeList(EffectType effectType) => list
      .where((effect) =>
          effect.type == effectType && checkEffectTypeAboveZero(effectType))
      .toList();

  /// 与removeEffect(list[0])类似
  void timeout() {
    var duration = durationList[0];
    list.removeAt(0);
    durationList.removeAt(0);

    _minusDuration(duration);

    if (durationList.isNotEmpty && durationList[0] != -1) {
      _timerManager.startTimer(durationList[0]);
    }
  }

  void _minusDuration(int duration) {
    var length = durationList.length;
    for (var i = 0; i < length; i++) {
      if (durationList[i] == -1) {
        break;
      }
      durationList[i] -= duration;
      if (durationList[i] == 0) {
        list.removeAt(i);
        durationList.removeAt(i);
        length--;
        i--;
      }
    }
  }

  // todo removeAt前修改一下type计数
  void removeEffect(Effect effect){
    var index = list.indexOf(effect);

    if(index == -1){throw const FormatException(errorIndexOfEffectList);}

    if(index == 0 && durationList[0] != -1){
      var lastTime = _timerManager.stopTimer();
      _minusDuration(lastTime);

      if(durationList[1] != -1){
        _timerManager.startTimer(durationList[1]);
      }
    }

    list.removeAt(index);
    durationList.removeAt(index);
  }
}

/// 取消定时器
class _TimerManager {
  late Timer timer;

  final EffectList effectList;

  /// 因为其他原因取消定时器的话, 要让effectList中所有的duration减去经过的时间
  int lastTime = -1;

  Future<void> startTimer(int duration) async {
    lastTime = DateTime.now().millisecondsSinceEpoch;

    timer = await Future.delayed(Duration(milliseconds: duration));

    effectList.timeout();
  }

  /// 调用后需要再调用_minusDuration
  int stopTimer() {
    timer.cancel();

    return DateTime.now().millisecondsSinceEpoch - lastTime;
  }

  _TimerManager(this.effectList);
}
