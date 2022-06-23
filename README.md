# testtaskotp
This flutter app is using GETX as a state manager.

1) When app starts running, the user is shown a splash screen for 2 seconds.
2) The user is then presented with the SignUp Screen.
3) Select a country code, by default '+880' is used.
4) Input any 10 digit number. If number is not 10 digits, text validation error is shown.
5) If user does not agree to terms n condition, a error snackbar is shown to direct the user to accept T&C
6) If everything is ok. Upon pressing the continue button, mockAPI is called an OTP is generated
7) Next, if OTP is generated successfully. The user is sent to verification screen.
8) In verification screen, you will receive your otp at top of the screen
9) The user number is also shown in this screen
10) Image in verification screen resizes to different screen sizes 
11) OTP is obscured using a custom loading.gif
12) if your input otp matches the generated otp, you will see a success msg or error msg.
13) Resend OTP btn comes after 2mins
14) Pressing X btn takes user back to previous screen


--- The whole app is responsive and will scale to any device size.
