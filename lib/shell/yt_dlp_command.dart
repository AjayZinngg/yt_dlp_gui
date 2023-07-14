
import 'package:yt_dlp_gui/domain/yt_dlp_config.dart';
import 'package:yt_dlp_gui/shell/yt_dlp_runner.dart';

class YtDlpCommand {
  final YtDlpConfig _config;
  final String _dlPath;

  YtDlpCommand(this._config, this._dlPath);

  String buildCommand() {
    StringBuffer command = StringBuffer();
    if (_config.dlVideo) command.write(" -k");
    if (_config.dlAudio) command.write(" -x");
    if (_config.dlSubtitles) command.write(" --write-subs");
    if (_config.dlThumbnail) command.write(" --write-thumbnail");
    // video size and format
    command.write(" -S \"res:${_config.vSize.value},ext:${_config.vFormat.value}\"");
    // audio bitrate
    command.write(" --audio-quality ${_config.aBitrate.value}k");
    // audio format
    command.write(" --audio-format ${_config.aFormat.value}");



    command.write(" ${_config.ytUrl}");

    return command.toString();
  }

  void runCommand() {
    YtDlpRunner(
      dlPath: _dlPath,
      command: buildCommand()
    ).run();
  }
}