import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 60,
          ),
          child: Row(
            children: [
              Container(
                width: 6,
                color: Colors.green,
              ),
              const SizedBox(
                width: 8,
              ),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
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
      ),
    ),
  );
}

void showFailureSnackBar(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 60,
          ),
          child: Row(
            children: [
              Container(
                width: 6,
                color: Colors.red,
              ),
              const SizedBox(
                width: 8,
              ),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
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
      ),
    ),
  );
}

void showWaitSnackBar(context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.zero,
      content: IntrinsicHeight(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 60,
          ),
          child: Row(
            children: [
              Container(
                width: 6,
                color: Colors.orange,
              ),
              const SizedBox(
                width: 8,
              ),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(
                  Icons.timer,
                  color: Colors.orange,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
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
      ),
    ),
  );
}
