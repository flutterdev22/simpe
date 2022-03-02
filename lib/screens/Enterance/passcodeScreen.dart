import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:simpe/app/themes/app_colors.dart';

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  /// Method extraction to call by initial display and custom buttons.
  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Please authenticate');
    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => {},
              child: Container(
                width: 343.w,
                height: 44.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: kBlueColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Center(
                  child: Text(
                    'Continuar',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(252, 252, 252, 1),
                        fontSize: 14.sp,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
