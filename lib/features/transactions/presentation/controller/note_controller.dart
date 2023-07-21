import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_controller.g.dart';

@riverpod
class Note extends _$Note {
  @override
  String build() {
    return '';
  }

  void setNote(text) {
    state = text;
  }
}
