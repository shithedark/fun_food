//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:audioplayers/web/audioplayers_web.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';
import 'package:flutter_sound_web/flutter_sound_web.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  AudioplayersPlugin.registerWith(registrar);
  FlutterSecureStorageWeb.registerWith(registrar);
  FlutterSoundPlugin.registerWith(registrar);
  ImagePickerPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
