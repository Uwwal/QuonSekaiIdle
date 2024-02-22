# quon_sekai_idle


- [文档](https://uwwal.github.io/QuonSekaiIdle/)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 这里是大饼

### 核心玩法
规划你个人的战斗序列(combatActionList)，每个战斗动作使你的槽序列填充/去除指定数量的充能。

举例：
战斗序列：
A:使槽序列弹出3个种类为蓄力的 造成3点伤害
B:对槽序列压入2个种类为蓄力的 造成1点伤害

则战斗动作顺序为BBABABBABABBABABBABA...

### 剩下的要写啥我忘了

## 我随便写写后端逻辑

### 发起战斗
worldManager读个世界->player.findEnemy->world产生一个敌人->world.startCombat

### 伤害处理流程
player.action生成List<Damage>->player.modifyOutgoingDamage, 调每个
