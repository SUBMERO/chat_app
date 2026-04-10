import 'package:chat_app/core/constants/constants.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/home/data/models/message_model.dart';
import 'package:chat_app/features/home/data/services/messages_service.dart';
import 'package:chat_app/features/home/presentation/widgets/chat_card_receiver.dart';
import 'package:chat_app/features/home/presentation/widgets/chat_card_sender.dart';
import 'package:chat_app/features/home/presentation/widgets/chat_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late Stream<List<MessageModel>> _messagesStream;
  final MessagesService _messagesService = MessagesService();
  int _previousMessageCount = 0;

  @override
  void initState() {
    _messagesStream = _messagesService.getMessagesStream();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = (context.read<AuthCubit>().state as AuthSuccessState).email;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kSecondaryColor,
        centerTitle: true,
        title: Text(
          'Chat App',
          style: AppTextStyle.indieFlower36Bold.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<MessageModel>>(
                stream: _messagesStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  }

                  final messagesList = snapshot.data!;

                  if (messagesList.length != _previousMessageCount) {
                    _previousMessageCount = messagesList.length;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                  }

                  return ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      if (email == messagesList[index].email) {
                        return ChatCardSender(
                          text: messagesList[index].message,
                        );
                      } else {
                        return ChatCardReceiver(
                          text: messagesList[index].message,
                        );
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ChatTextFiled(
              controller: controller,
              onSubmitted: (data) {
                if (data.trim().isEmpty) return;
                _messagesService.addMessage(email: email, message: data);
                controller.clear();
                _scrollToBottom();
              },
              onTap: () {
                if (controller.text.trim().isEmpty) return;
                _messagesService.addMessage(
                  email: email,
                  message: controller.text,
                );
                controller.clear();
                _scrollToBottom();
              },
            ),
          ],
        ),
      ),
    );
  }
}
