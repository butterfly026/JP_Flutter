import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/widgets/mini_textfield.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class ChatInputWidget extends StatefulWidget {
  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: AppTheme.lightGreyBack,
              borderRadius: BorderRadius.all(Radius.circular(Dimens.gap_dp10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  // color: Colors.grey.withOpacity(0.6),
                  offset: Offset(Dimens.gap_dp4, Dimens.gap_dp4),
                  blurRadius: Dimens.gap_dp16,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: Dimens.gap_dp10),
            child: Row(children: [
              IconButton(
                visualDensity: VisualDensity(
                    horizontal: -Dimens.gap_dp5, vertical: -Dimens.gap_dp2),
                icon: Icon(Icons.add),
                onPressed: () {
                  // Handle attachment button press
                  // Add functionality to attach files or images
                  // For simplicity, show a dialog in this example
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Attach Files'),
                        content:
                            Text('Placeholder for attaching files or images'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Expanded(
                child: TextField(
                    controller: _messageController,
                    style: AppTheme.body2,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: AppTheme.lightGreyBack,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 0, vertical: Dimens.gap_dp6),
                      border: InputBorder.none,
                    )),
              ),
            ]),
          )),
          IconButton(
            visualDensity: VisualDensity(
                horizontal: -Dimens.gap_dp5, vertical: -Dimens.gap_dp2),
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle send button press
              String message = _messageController.text;
              // Example: Print the message to the console
              print('Sending message: $message');
              // Example: Clear the input field after sending
              _messageController.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
