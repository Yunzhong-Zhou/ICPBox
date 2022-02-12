import 'package:flutter/material.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/viewmodel/MVVMDemoViewModel.dart';
import 'package:provider/provider.dart';

class MVVMDemoView extends StatefulWidget {
  const MVVMDemoView({Key? key}) : super(key: key);

  @override
  _MVVMDemoViewState createState() => _MVVMDemoViewState();
}

class _MVVMDemoViewState extends State<MVVMDemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM设计模式"),
      ),
      body: TextButton(
        onPressed: () {
          context.read<MVVMDemoViewModel>().getDemo(1, Provider.of<AppDataProvider>(context,listen: false).Count);
          // Provider.of<MVVMDemoViewModel>(context).getDemo(1, Provider.of<AppDataProvider>(context,listen: false).Count);
        },
        child: Text("调用ViewModel"),
      ),
    );
  }
}
