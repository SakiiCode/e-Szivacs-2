import 'package:e_szivacs/Datas/Message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';


class MessageDialog extends StatefulWidget {
  const MessageDialog(this.message);
  final Message message;

  @override
  MessageDialogState createState() => new MessageDialogState();
}

class MessageDialogState extends State<MessageDialog> {
  Message currentMessage;

  @override
  void initState() {
    super.initState();
    currentMessage = widget.message;
    /*MessageHelper().getMessageByIdOffline(globals.selectedAccount.user, currentMessage.id).then((Message message){
      if (message != null) {
        setState(() {
          currentMessage = message;
        });
      }
      MessageHelper().getMessageById(globals.selectedAccount.user, currentMessage.id).then((Message message){
        if (message != null) {
          setState(() {
            currentMessage = message;
          });
        }
      });
    });*/
  }

  Widget build(BuildContext context) {
    return new SimpleDialog(
        title: new Text(currentMessage.subject),
        titlePadding: EdgeInsets.all(15),
        contentPadding: const EdgeInsets.all(15.0),
        children: <Widget>[
          /*Container(
            child: Text(S.of(context).receivers + currentMessage.seen.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
          ),*/
          Container(
            child: 
            
            currentMessage.text.contains(new RegExp(r'[A-z]\r\n[A-z]'))?
              new Html( data: HtmlUnescape().convert(currentMessage.text.replaceAll("\r\n\r\n", "<br>").replaceAll("\r\n", " ")))
            :
              new Html( data: HtmlUnescape().convert(currentMessage.text.replaceAll("\r\n", "<br>"))),

            
          ),
          Container(
            child: Text(currentMessage.senderName, textAlign: TextAlign.end, style: TextStyle(fontSize: 16),),
          ),
        ]
    );
  }
}