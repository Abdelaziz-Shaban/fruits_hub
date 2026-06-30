import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/cubits/login_cubit/login_state.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/repos/auth_repo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: BuildAppBar(context, title: "تسجيل دخول"),
        body: LoginViewBodyBlocConsumer()
      ),
    );
  }
}
