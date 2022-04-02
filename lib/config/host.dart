import 'dart:io' show Platform;

final _config = {
  "development": {"host": "http://192.168.1.4:9090/v0/"},
  "production": {"host": "http://81.70.89.25:9090/v0/"}
};

// ignore: constant_identifier_names

final config = const bool.fromEnvironment("dart.vm.product")
    ? _config["production"]
    : _config["development"];
