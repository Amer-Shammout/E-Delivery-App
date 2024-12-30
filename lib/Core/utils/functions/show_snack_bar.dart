import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.zero,
      content: Row(
        children: [
          Container(
            height: 60,
            width: 6,
            color: Colors.green,
          ),
          const Flexible(
            child: SizedBox(
              width: 8,
            ),
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24,
            ),
          ),
          const Flexible(
            child: SizedBox(
              width: 8,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              textAlign: TextAlign.center,
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void showFailureSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.zero,
      content: Row(
        children: [
          Container(
            height: 60,
            width: 6,
            color: Colors.red,
          ),
          const Flexible(
            child: SizedBox(
              width: 8,
            ),
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.remove_circle,
              color: Colors.red,
              size: 24,
            ),
          ),
          const Flexible(
            child: SizedBox(
              width: 8,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              textAlign: TextAlign.center,
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void showWaitSnackBar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.zero,
      content: Row(
        children: [
          Container(
            height: 60,
            width: 6,
            color: Colors.orange,
          ),
          const Flexible(
            child: SizedBox(
              width: 8,
            ),
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Icon(
              Icons.timer,
              color: Colors.orange,
              size: 24,
            ),
          ),
          const Flexible(
            child: SizedBox(
              width: 8,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              textAlign: TextAlign.center,
              S.of(context).wait_message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
