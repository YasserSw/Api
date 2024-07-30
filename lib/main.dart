import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubit/getit.dart';
import 'package:flutter_application_3/cubit/my_cubit.dart';
import 'package:flutter_application_3/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initget();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyCubit>(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User>? AllUsers;

  void initState() {
    super.initState();
    BlocProvider.of<MyCubit>(context).emitgetallusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<MyCubit, MyState>(
            builder: (context, state) {
              if (state is AllUsersLoaded) {
                AllUsers = (state).AllUsersList;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: AllUsers!.length,
                    itemBuilder: (context, i) {
                      return Text(AllUsers![i].name.toString());
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}
