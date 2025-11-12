import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/init/data/datasources/comment_api_service.dart';
import 'package:test_project/app/features/init/data/models/comment_response.dart';
import 'package:test_project/app/features/init/logic/comment_cubit.dart';
import 'package:test_project/core/config/di/service_locator.dart';
import 'package:test_project/core/cubit/base_state.dart';
import 'package:test_project/core/widgets/views/error_view.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentCubit(sl<CommentApiService>())..fetchComments(),
      child: Scaffold(
        floatingActionButton: _fab(context),
        appBar: AppBar(title: Text("Comments")),

        body: BlocConsumer<CommentCubit, BaseState<Comment>>(
          listener: (context, state) {},

          builder: (context, state) {
            if (state is BaseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BaseSuccess<Comment>) {
              if (state.hasList) {
                final list = state.itemList!;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    final comment = list[index];
                    return ListTile(title: Text(comment.body ?? 'No body'));
                  },
                );
              }
            } else if (state is BaseError<Comment>) {
              return ErrorView(
                message: state.message,
                onRetry: () => context.read<CommentCubit>().fetchComments(),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  FilledButton _fab(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<CommentCubit>().fetchComments();
      },
      child: Text('aa'),
    );
  }
}
