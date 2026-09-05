import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_example/provider_example/provider_view_model.dart';
import 'package:state_manager_example/repository/todo_repository.dart';
import 'package:state_manager_example/text_fileld_widget.dart';

class ProviderView extends StatefulWidget {
  const ProviderView({super.key});

  @override
  State<ProviderView> createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: _changeNotifierProvider(),
    );
  }

  Widget _changeNotifierProvider() {
    return ChangeNotifierProvider(
      lazy: true,
      create: (context) => ProviderViewModel(TodoRepository()),
      builder: (context, child) {
        final vm = context.watch<ProviderViewModel>();
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                vm.create(val);
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  for (final todo in vm.state.todos)
                    ListTile(title: Text('$todo')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _listenableProvider() {
    return ListenableProvider(
      lazy: true,
      dispose: (context, value) {
        print("${value.state.todos}");
      },
      create: (context) => ProviderViewModel(TodoRepository()),
      builder: (context, child) {
        final vm = context.watch<ProviderViewModel>();
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                vm.create(val);
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  for (final todo in vm.state.todos)
                    ListTile(title: Text('$todo')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _multiProvider() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => ProviderViewModel(TodoRepository()),
        ),
      ],
      builder: (context, child) {
        final vm = context.watch<ProviderViewModel>();
        return Column(
          children: [
            TextFieldWidget(
              onCreate: (val) {
                vm.create(val);
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  for (final todo in vm.state.todos)
                    ListTile(title: Text('$todo')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
