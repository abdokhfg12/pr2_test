import 'dart:convert';

import 'package:fhgfh/model/list_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ListTask extends StatefulWidget {
  String?  accesstoken;
  ListTask({Key? key,this.accesstoken}) : super(key: key);

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  bool isloading=false;

  ListResponse? listmodel;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getimage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: isloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                    Dataa item=Dataa.fromJson(index);
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(item.image!),
                          ),
                        );
                      },
                      itemCount:listmodel!.data!.length
                    )),
        ],
      ),
    );
  }
  Future getimage()async{
    setState(() {
      isloading =true;
    });
    Response listResponse =await get(Uri.parse("http://alcaptin.com/api/places"),

  headers: {
      "Accept":"application/json",
      "Authorization":"Bearer ${widget.accesstoken}"
    });
    dynamic convertjson=jsonDecode(listResponse.body);
    setState(() {
      listmodel=ListResponse.fromJson(convertjson);

    });
    
    setState(() {
      isloading =false;
    });
    
  }
}
