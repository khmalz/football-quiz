import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/app/data/constant/color.dart';

import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighterGray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: lighterGray,
        foregroundColor: textPrimary,
      ),
      body: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
          background: Container(
            color: lighterGray,
          ),
          indicatorColor: Theme.of(context).colorScheme.primary,
          indicatorWeight: 4,
        ),
        tabs: [
          Text(
            'Login',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'New Account',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
        views: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Column(
              children: [
                Obx(
                  () => Material(
                    elevation: 5,
                    shadowColor: textPrimary,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      controller: controller.usernameLoginInput,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: textSecondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: controller.errorLoginUsername.value == null
                              ? Colors.grey.shade600
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        errorText: controller.errorLoginUsername.value,
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.validateLoginUsername(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Material(
                    elevation: 5,
                    shadowColor: textPrimary,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      obscureText: controller.isHidePassword.value,
                      controller: controller.passwordLoginInput,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: controller.isHidePassword.value
                            ? IconButton(
                                onPressed: () =>
                                    controller.isHidePassword.value = false,
                                icon: const Icon(Icons.visibility_off),
                              )
                            : IconButton(
                                onPressed: () =>
                                    controller.isHidePassword.value = true,
                                icon: const Icon(Icons.visibility),
                              ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: textSecondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: controller.errorLoginPassword.value == null
                              ? Colors.grey.shade600
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        errorText: controller.errorLoginPassword.value,
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.validateLoginPassword(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(150, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      controller.isLoading.value ? 'Loading...' : 'Login',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: textSecondary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            child: Column(
              children: [
                Obx(
                  () => Material(
                    elevation: 5,
                    shadowColor: textPrimary,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      controller: controller.usernameRegisInput,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: textSecondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: controller.errorRegisUsername.value == null
                              ? Colors.grey.shade600
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        errorText: controller.errorRegisUsername.value,
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.validateRegisUsername(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Material(
                    elevation: 5,
                    shadowColor: textPrimary,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      controller: controller.nameRegisInput,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: textSecondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: controller.errorRegisName.value == null
                              ? Colors.grey.shade600
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        errorText: controller.errorRegisName.value,
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.validateRegisName(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Material(
                    elevation: 5,
                    shadowColor: textPrimary,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      obscureText: controller.isHidePassword.value,
                      controller: controller.passwordRegisInput,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: controller.isHidePassword.value
                            ? IconButton(
                                onPressed: () =>
                                    controller.isHidePassword.value = false,
                                icon: const Icon(Icons.visibility_off),
                              )
                            : IconButton(
                                onPressed: () =>
                                    controller.isHidePassword.value = true,
                                icon: const Icon(Icons.visibility),
                              ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: textSecondary,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: controller.errorRegisPassword.value == null
                              ? Colors.grey.shade600
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        errorText: controller.errorRegisPassword.value,
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value) => controller.validateRegisPassword(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(150, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      controller.isLoading.value ? 'Loading...' : 'Register',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: textSecondary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        onChange: (index) {},
      ),
    );
  }
}
