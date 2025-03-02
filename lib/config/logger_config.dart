import 'package:logger/logger.dart';

class LoggerConfig {
  static final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        levelEmojis: {
          Level.debug: '🐛',
          Level.info: '💡',
          Level.warning: '⚠️',
          Level.error: '🚨',
          Level.fatal: '🔥',
          Level.off: '🔕',
        },
        dateTimeFormat: DateTimeFormat.dateAndTime,
        levelColors: {
          Level.debug: AnsiColor.fg(12), // Blue for debug
          Level.info: AnsiColor.fg(10), // Green for info
          Level.warning: AnsiColor.fg(11), // Yellow for warning
          Level.error: AnsiColor.fg(9), // Red for error
          Level.fatal: AnsiColor.fg(9), // Red for fatal
          Level.off: AnsiColor.fg(8), // Grey for off
        }),
    filter: ProductionFilter(),
    output: ConsoleOutput(),
    level: Level.all,
  );
}
