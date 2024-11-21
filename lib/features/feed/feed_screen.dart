import 'package:collab/core/common/error_text.dart';
import 'package:collab/core/common/loader.dart';
import 'package:collab/core/common/post_card.dart';
import 'package:collab/features/auth/controller/auth_controller.dart';
import 'package:collab/features/community/controller/community_controller.dart';
import 'package:collab/features/post/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final userCommunities =  ref.watch(userCommunitiesProvider);
    final isGuest = !user.isAuthenticated;
    if(userCommunities.value!.isEmpty) {
      return TextButton(
              onPressed: () {},
              child: const Text(
                'Welcome to the COLLAB! Join a community to see posts.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ));
    }
    else if (!isGuest) {
      return ref.watch(userCommunitiesProvider).when(
            data: (communities) => ref.watch(userPostsProvider(communities)).when(
                  data: (data) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final post = data[index];
                        return PostCard(post: post, isHome: true,);
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return ErrorText(
                      error: error.toString(),
                    );
                  },
                  loading: () => const Loader(),
                ),
            error: (error, stackTrace) => ErrorText(
              error: stackTrace.toString(),
            ),
            loading: () => const Loader(),
          );
    }
    return ref.watch(userCommunitiesProvider).when(
          data: (communities) => ref.watch(guestPostsProvider).when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final post = data[index];
                      return PostCard(post: post, isHome: true,);
                    },
                  );
                },
                error: (error, stackTrace) {
                  return ErrorText(
                    error: error.toString(),
                  );
                },
                loading: () => const Loader(),
              ),
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}