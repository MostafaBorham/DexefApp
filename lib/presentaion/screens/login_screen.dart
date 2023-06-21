import 'package:auto_size_text/auto_size_text.dart';
import 'package:dexef_task/core/app_functions/show_snackbar.dart';
import 'package:dexef_task/core/app_widgets/custom_circular_progress_indicator.dart';
import 'package:dexef_task/domain/entities/user_auth.dart';
import 'package:dexef_task/presentaion/managers/auth_cubit/auth_cubit.dart';
import 'package:dexef_task/presentaion/ui_resources/app_colors.dart';
import 'package:dexef_task/presentaion/ui_resources/app_assets.dart';
import 'package:dexef_task/presentaion/ui_resources/app_sizes.dart';
import 'package:dexef_task/presentaion/ui_resources/app_strings.dart';
import 'package:dexef_task/presentaion/ui_resources/app_styles.dart';
import 'package:dexef_task/core/app_routes/routes.dart';
import 'package:dexef_task/presentaion/widgets/full_action_button.dart';
import 'package:dexef_task/presentaion/widgets/horizontal_line.dart';
import 'package:dexef_task/presentaion/widgets/user_input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthCubit _authCubit;
  late final BuildContext _loginContext;
  final _ipController = TextEditingController();
  final _databaseController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  late final List<UserInputEntity>? _userInputs;

  @override
  void initState() {
    super.initState();
    _userInputs = [
      UserInputEntity(
          controller: _ipController,
          hintText: AppStrings.ipHintText,
          inputType: TextInputType.number),
      UserInputEntity(
          controller: _databaseController,
          hintText: AppStrings.databaseHintText,
          inputType: TextInputType.text),
      UserInputEntity(
          controller: _userNameController,
          hintText: AppStrings.userNameHintText,
          inputType: TextInputType.text),
      UserInputEntity(
          controller: _passwordController,
          hintText: AppStrings.passwordHintText,
          inputType: TextInputType.text),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _authCubit.close();
    _ipController.dispose();
    _userNameController.dispose();
    _databaseController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///init AuthCubit instance
    _authCubit = AuthCubit.get(context);

    ///share context for access it in all methods in class
    _loginContext = context;

    return Scaffold(
      body: _buildLoginBody(),
    );
  }

  Widget? _buildLoginBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: AppHeight.s42, bottom: AppHeight.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLoginAppBar(),
              SizedBox(
                height: AppHeight.s42,
              ),
              _buildLoginBanner(),
              SizedBox(
                height: AppHeight.s14,
              ),
              _buildLoginForm(),
              _buildRememberPassword(),
              SizedBox(
                height: AppHeight.s18,
              ),
              _buildActionButtons(),
              SizedBox(
                height: AppHeight.s8,
              ),
              _buildLoginTips(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginAppBar() {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(start: AppWidth.s33, end: AppWidth.s16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                AppStrings.companyName,
                style: AppStyles.getDexefStyle(),
              ),
              SizedBox(
                height: AppHeight.s10,
              ),
              HorizontalLine(
                color: AppColors.darkGrey,
                width: AppWidth.s73,
              )
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.searchIcon,
                fit: BoxFit.contain,
                height: AppHeight.s24,
                width: AppWidth.s28,
              ),
              SizedBox(
                width: AppWidth.s7,
              ),
              SvgPicture.asset(
                AppAssets.addIcon,
                fit: BoxFit.contain,
                height: AppHeight.s27,
                width: AppWidth.s28,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBanner() {
    return SvgPicture.asset(
      AppAssets.loginBanner,
      height: AppHeight.s245,
      width: AppWidth.s329,
      fit: BoxFit.contain,
    );
  }

  Widget _buildLoginForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Form Title Text
          AutoSizeText(
            AppStrings.loginTitle,
            style: AppStyles.getDexefStyle(
                color: AppColors.whiteBrown, fontSize: 22),
          ),
          SizedBox(
            height: AppHeight.s13,
          ),

          ///Form Inputs
          Column(
            children: _userInputs!
                .map<Widget>((UserInputEntity userInput) => Column(
                      children: [
                        UserInputText(
                            controller: userInput.controller,
                            hintText: userInput.hintText,
                            inputType: userInput.inputType),
                        SizedBox(
                          height: AppHeight.s20,
                        )
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _buildRememberPassword() {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: AppWidth.s22),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.rememberCheckerIcon,
            height: AppHeight.s26,
            width: AppWidth.s26,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: AppWidth.s8,
          ),
          AutoSizeText(
            AppStrings.rememberPassword,
            style: AppStyles.getDexefStyle(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///Login Btn
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              Navigator.pushNamed(context, AppRoutes.mainScreenRoute);
              showSuccessSnackBar(
                context: _loginContext,
                message:
                    '${AppStrings.welcomeMessage}\n${AppStrings.privilegeIDMessage}${state.userVerificationData!.privilegeID}\n${AppStrings.branchIDMessage}${state.userVerificationData!.branchID}',
              );
            } else if (state is AuthFailedState) {
              showErrorSnackBar(
                  context: _loginContext, message: state.failureMessage);
            }
          },
          builder: (context, state) {
            return state is AuthLoadingState
                ? const CustomCircularProgressIndicator(
                    color: AppColors.whiteBlue,
                  )
                : FullActionButton(
                    text: AppStrings.login,
                    width: AppWidth.s360,
                    height: AppHeight.s46,
                    backgroundColor: AppColors.whiteBlue,
                    onPressed: () {
                      debugPrint('ip : ${_ipController.text}');
                      _authCubit.authUser(
                          userAuthData: UserAuth(
                        password: _passwordController.text,
                        database: _databaseController.text,
                        ip: _ipController.text,
                        userName: _userNameController.text,
                      ));
                    },
                  );
          },
        ),
        SizedBox(
          height: AppHeight.s12,
        ),

        ///Demo Version Btn
        FullActionButton(
          text: AppStrings.demoVersion,
          width: AppWidth.s360,
          height: AppHeight.s46,
          backgroundColor: AppColors.whiteGreen,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildLoginTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          AppStrings.demoVersionTip,
          style: AppStyles.getDexefStyle(
            fontSize: 12,
            color: AppColors.darkGrey,
          ),
        ),
        SizedBox(
          height: AppHeight.s3,
        ),
        AutoSizeText(
          AppStrings.haveGoodDayTip,
          style: AppStyles.getDexefStyle(
            fontSize: 12,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}

class UserInputEntity {
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? hintText;

  UserInputEntity({this.inputType, this.controller, this.hintText});
}
