import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/Components/Card.dart';
import 'package:task1/Providers/AuthProvider.dart';
import 'package:task1/constants.dart';
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    UserAuthProvider authProvider = Provider.of<UserAuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Home',style: kAppBarTextStyle,),
              TextButton(
                onPressed: () async {
                  await authProvider.logout();
                  if (authProvider.user == null) {
                    setState(() {
                      showSnackBar("User Logged Out", context);
                      Navigator.of(context).pushReplacementNamed('/login');
                    });
                  }
                },
                child: const Text("Sign Out"),
              )
            ],
          ),
        ),
        body: FutureBuilder<List<Post>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Post post = snapshot.data![index];
                  return DataCard(
                    title: post.title,
                    subtitle: post.body,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
