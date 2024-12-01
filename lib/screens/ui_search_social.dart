import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:student_lite/widgets/searchUser.dart';
import 'package:student_lite/widgets/appbar_social.dart';
import 'package:student_lite/widgets/bottomBar_social.dart';

class UiSearchSocial extends StatefulWidget {
  const UiSearchSocial({Key? key}) : super(key: key);

  @override
  _UiSearchSocialState createState() => _UiSearchSocialState();
}

class _UiSearchSocialState extends State<UiSearchSocial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSocial(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "TÌM KIẾM",
                  style: StyleConfigText.bodyTextSemiBold3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Bạn đang nghĩ gì?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("asset/images/avatar.png"),
                      ),
                      title: Text("Biệt danh"),
                      subtitle: Text("Tên"),
                      trailing: ElevatedButton(
                        onPressed: () {}, 
                        child: Text("Theo dõi"),
                      ),
                    );
                  }
                )
              )
            ],
            
          ),
          
        ),
        
      ),
      bottomNavigationBar: BottomBarSocial(),
    );
  }
}
