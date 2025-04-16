import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart';
import 'package:flexcorex/utils/constants.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.defaultPadding, vertical: Constants.defaultPadding / 2),
          margin: const EdgeInsets.symmetric(vertical: Constants.defaultMargin / 4, horizontal: Constants.defaultMargin),
          decoration: BoxDecoration(
            color: isUser
                ? AppColors.darkEmeraldGreen
                : AppColors.richCharcoalGray.withOpacity(0.8),
            borderRadius: BorderRadius.circular(Constants.borderRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.matteBlack.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isUser ? AppColors.offWhite : AppColors.platinumSilver,
                ),
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
          ),
        ),
      ),
    );
  }
}