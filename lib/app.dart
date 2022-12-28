import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart' as log;
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

const streamKey =  '9ga8ys63japh';

var logger = log.Logger();

extension StreamchatContext on BuildContext{
  String? get currentUserImage =>currentUser!.image;

  User? get currentUser => StreamChatCore.of(this).currentUser;
}