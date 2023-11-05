import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

Future login(BuildContext context) async {
  bool uTPLoginBiometric = false;

  final localAuth = LocalAuthentication();
  bool isBiometricSupported = await localAuth.isDeviceSupported();
  bool canCheckBiometrics = await localAuth.canCheckBiometrics;
  if (isBiometricSupported && canCheckBiometrics) {
    uTPLoginBiometric = await localAuth.authenticate(
        localizedReason: FFLocalizations.of(context).getText(
          'fw00so7z' /* Please authenticate to login */,
        ),
        options: const AuthenticationOptions(biometricOnly: true));
  }

  context.pushNamed('UTPDashboad');
}
