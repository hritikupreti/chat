import 'package:chat_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  late QuerySnapshot searchSnapshot;
  searchedAccount() {
    usersearch(search.text).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.docs.length,
            itemBuilder: (context, index) {
              return SerchTile(
                  userName: searchSnapshot.docs[index].get("Name"),
                  email: searchSnapshot.docs[index].get("email"));
            })
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple,

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 55,
                    width: MediaQuery.of(context).size.width - 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 20),
                      child: Container(
                        width: 230,
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                            hintText: "enter username",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        searchedAccount();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.search_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.purple[50],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SerchTile extends StatelessWidget {
  final userName;
  final email;
  SerchTile({this.email, this.userName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            child: Icon(Icons.person),
          ),
          Column(
            children: [
              Text(userName),
              Text(email),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.purple[200],
            ),
            child: Text("Message"),
          )
        ],
      ),
    );
  }
}
