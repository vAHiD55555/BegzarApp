import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ConnectionWidget extends StatefulWidget {
  ConnectionWidget({
    super.key,
    required this.onTap,
    required this.isLoading,
    required this.status,
  });

  final bool isLoading;
  final GestureTapCallback onTap;
  final String status;

  @override
  State<ConnectionWidget> createState() => _ConnectionWidgetState();
}

class _ConnectionWidgetState extends State<ConnectionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Color _getShadowColor() {
    if (widget.isLoading) {
      return Colors.amber.withOpacity(0.5);
    } else if (widget.status == "CONNECTED") {
      return Colors.green.withOpacity(0.5);
    } else {
      return Colors.red.withOpacity(0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _getShadowColor(),
                    blurRadius: 100 + (100 * _pulseController.value),
                    spreadRadius: 1 + (1 * _pulseController.value),
                  ),
                ],
              ),
              child: child,
            );
          },
          child: InkWell(
            onTap: widget.isLoading ? null : widget.onTap,
            customBorder: CircleBorder(),
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.2),
              ),
              child: Center(
                child: widget.isLoading
                    ? LoadingAnimationWidget.inkDrop(
                        color: Color.fromARGB(255, 214, 182, 0),
                        size: 85,
                      )
                    : Icon(
                        CupertinoIcons.power,
                        color: widget.status == "DISCONNECTED"
                            ? Colors.red
                            : Colors.green,
                        size: 90,
                      ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          widget.isLoading
              ? context.tr('connecting')
              : widget.status == "DISCONNECTED"
                  ? context.tr('disconnected')
                  : context.tr('connected'),
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
