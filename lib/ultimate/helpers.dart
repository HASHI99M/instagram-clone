import 'package:flutter/material.dart';
import 'package:instagram/services/app_locale.dart';

String getTranslated(BuildContext context, String key) {
  return AppLocale.of(context).getTranslated(key);
}

customDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 200,
        height: 250,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
              child: Text(
                getTranslated(context, 'process_nearing'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              getTranslated(context, 'go_back'),
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: .8,
              color: Colors.grey[300],
            ),
            Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        getTranslated(context, 'back'),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ))),
            ),
            Container(
              height: .8,
              color: Colors.grey[300],
            ),
            Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        getTranslated(context, 'cancel'),
                        style: TextStyle(fontSize: 14),
                      ))),
            ),
          ],
        ),
      ),
    ),
  );
}

addPhotoDialog(BuildContext context,
    {Function clickTackPhoto, Function clickChooseLibrary}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 200,
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Center(
                child: Text(
                  getTranslated(context, 'change_profile_photo'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: .8,
              color: Colors.grey[300],
            ),
            Expanded(
              child: InkWell(
                onTap: clickTackPhoto,
                child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Text(
                        getTranslated(context, 'take_photo'),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: clickChooseLibrary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Text(
                        getTranslated(context, 'choose_from_library'),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
