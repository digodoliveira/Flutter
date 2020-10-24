import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          !mine
              ? Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data["senderPhotoUrl"]),
                    //backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/09/01/10/23/image-1635747_960_720.jpg'),
                  ),
                )
              : Container(
                  //padding: EdgeInsets.only(left: 32.0),
                  width: MediaQuery.of(context).size.width / 4,
                ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  //width: MediaQuery.of(context).size.width / 1.5,
                  //color: mine ? Colors.lightGreenAccent[100] : Colors.white,
                  color:
                      mine ? Color.fromRGBO(220, 248, 198, 1.0) : Colors.white,

                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: mine
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              data['senderName'],
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              data['time'].toString(),

                              //DateTime.fromMillisecondsSinceEpoch(
                              //        data['time'] * 1000)
                              //    .toString(),

                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      data['imgUrl'] != null
                          ? Image.network(
                              data['imgUrl'],
                              width: MediaQuery.of(context).size.width * 0.6,
                            )
                          : Text(
                              data['text'],
                              textAlign: mine ? TextAlign.end : TextAlign.start,
                              style: TextStyle(fontSize: 18.0),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          mine
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data["senderPhotoUrl"]),
                    //backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/09/01/10/23/image-1635747_960_720.jpg'),
                  ),
                )
              : Container(
                  //padding: EdgeInsets.only(right: 32.0),
                  width: MediaQuery.of(context).size.width / 4,
                ),
        ],
      ),
    );
  }
}
