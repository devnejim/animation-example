import 'package:animation_example/constants/strings.dart';
import 'package:animation_example/extensions/string_extension.dart';
import 'package:animation_example/widgets/menu_item.dart';

class Constants {
  Constants._();

  static final menuItems = <MenuItem>[
    MenuItem(text: Strings.reminder.capFirst),
    MenuItem(text: Strings.camera.capFirst),
    MenuItem(text: Strings.attachment.capFirst),
    MenuItem(text: Strings.textNote.capFirstOfEach),
  ];
}
