import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AnnimationDialog extends StatefulWidget {
  final String message;
  final String title;
  final String buttontext;

  AnnimationDialog(
      {required this.title, required this.message, required this.buttontext});

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<AnnimationDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        title: Text(widget.title),
        content: Text(widget.message),
        actions: [
          RoundedLoadingButton(
            height: 30,
            width: 100,
            color: (widget.buttontext == "Success") ? Colors.green : Colors.red,
            onPressed: () {
              Navigator.pop(context);
            },
            controller: btnController,
            child:
                Text((widget.buttontext == "Success") ? "Success" : "Failure",
                    style: const TextStyle(
                      color: Colors.white,
                    )),
          )

          // Lottie.asset(
          //   'assets/animations/success_animation.json',
          //   width: 30,
          //   height: 30,
          //   repeat: true, // Set to true if you want the animation to loop
          //   reverse:
          //       true, // Set to true if you want the animation to play in reverse
          // )
        ],
      ),
    );
  }
}
