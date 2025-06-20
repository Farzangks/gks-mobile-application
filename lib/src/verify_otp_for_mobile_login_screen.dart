import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpForMobileLoginScreen extends StatefulWidget {
  const VerifyOtpForMobileLoginScreen({super.key});

  @override
  State<VerifyOtpForMobileLoginScreen> createState() => _VerifyOtpForMobileLoginScreenState();
}

class _VerifyOtpForMobileLoginScreenState extends State<VerifyOtpForMobileLoginScreen> {
  // Controllers
  final StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  final TextEditingController _otpController = TextEditingController();

  // Variables
  final int _otpLength = 6;
  bool _isOTPSent = true;
  bool _isValid = true;
  int _timeRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    errorController.close();
    _otpController.dispose();
    super.dispose();
  }

  // Start OTP countdown
  void _startCountdown() {
    _timeRemaining = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isOTPSent = false;
        });
      }
    });
  }

  // Resend OTP
  void _resendOTP() {
    setState(() {
      _isOTPSent = true;
    });
    _startCountdown();
  }

  // Validate OTP
  void _validateOTP() {
    if (_otpController.text.length != _otpLength) {
      setState(() {
        _isValid = false;
      });
    } else {
      setState(() {
        _isValid = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified Successfully")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: AppColors.appBarColor,
              ),
              child: Center(
                child: Image.asset(
                  'assets/gks/horizontal_logo.PNG',
                  height: 100,
                  width: 250,
                ),
              ),
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Title
                  const Text(
                    "Verify Mobile Number",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appBarColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Instructions
                  const Text(
                    "Enter the OTP sent to +91 98765 43210",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  const SizedBox(height: 24),

                  // OTP Input Field
                  PinCodeTextField(
                    appContext: context,
                    length: _otpLength,
                    controller: _otpController,
                    errorAnimationController: errorController,
                    onChanged: (value) {},
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeColor: AppColors.appBarColor,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.red.shade200,
                    ),
                    cursorColor: AppColors.appBarColor,
                    keyboardType: TextInputType.number,
                  ),

                  if (!_isValid)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Please enter a valid OTP",
                        style: TextStyle(color: AppColors.appBarColor, fontSize: 12),
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Countdown and Resend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Time remaining: ${_timeRemaining}s",
                        style: const TextStyle(color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: _isOTPSent ? null : _resendOTP,
                        child: Text(
                          "Resend OTP",
                          style: TextStyle(
                            color: _isOTPSent ? Colors.grey : AppColors.appBarColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Verify Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      minimumSize: Size(screenWidth, 48),
                    ),
                    onPressed: _validateOTP,
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Help Text
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Add "Get Help" logic here
                      },
                      child: const Text(
                        "Having trouble? Get help",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
