import 'dart:io';

import 'package:ceminddataload/ceminddataload.dart' as ceminddataload;
import 'package:ceminddataload/setup.dart' as setup;
import 'package:args/args.dart';
import 'package:ceminddataload/resetdata.dart';

// ignore: avoid_relative_lib_imports
import '../lib/util/constants.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(bucketIdFlag, abbr: 'b')
    ..addOption(projectListFileFlag, abbr: 'p')
    ..addFlag(deleteAllFlag, abbr: 'd')
    ..addFlag(setupFlag)
    ..addOption(assignmentListFileFlag, abbr: 'a');

  ArgResults argResults = parser.parse(arguments);

  final b = argResults[bucketIdFlag];
  final f = argResults[projectListFileFlag];
  final a = argResults[assignmentListFileFlag];

  if (argResults[deleteAllFlag] as bool) {
    await deleteAll();
  } else if (argResults[setupFlag] as bool) {
    await setup.BucketsAndCollections.bucketsAndCollections(bucketIdDefault);
  } else {
    await ceminddataload.process(
      bucketId: b ?? bucketIdDefault,
      projectFilePath: f ?? "",
      assignmentFilePath: a ?? "",
    );
  }
  exit(0);
}
