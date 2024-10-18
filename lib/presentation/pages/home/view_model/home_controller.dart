import 'package:riverpod/riverpod.dart';

final mainHomeControllerProvider =
    StateNotifierProvider((ref) => MainHomeController());

class MainHomeController extends StateNotifier<int> {
  MainHomeController() : super(0);

  void changeIndex(int value) {
    state = value;
  }
}
