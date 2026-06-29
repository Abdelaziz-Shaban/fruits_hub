import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/signup_cubit/signup_cubit.dart';
import '../../cubits/signup_cubit/signup_state.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'تم إنشاء الحساب بنجاح! 🎉',
                style: TextStyle(fontFamily: 'Cairo'),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }

        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message,
                style: const TextStyle(fontFamily: 'Cairo'),
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}