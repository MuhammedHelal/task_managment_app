import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:planning_app/core/di/locator.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/features/home/ui/views/home_view.dart';
import 'package:planning_app/features/notes/folder/logic/folders_cubit/folders_cubit.dart';
import 'package:planning_app/features/notes/folder/ui/views/folders_view.dart';
import 'package:planning_app/features/tasks/logic/cubit/tasks_list_cubit.dart';
import 'package:planning_app/features/tasks/ui/views/tasks_view.dart';

class PersistentBottomNavbar extends StatefulWidget {
  const PersistentBottomNavbar({super.key});

  @override
  State<PersistentBottomNavbar> createState() => _PersistentBottomNavbarState();
}

class _PersistentBottomNavbarState extends State<PersistentBottomNavbar> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider.value(
        value: locator<FoldersCubit>(),
        child: const HomeView(),
      ),
      BlocProvider.value(
        value: locator<FoldersCubit>(),
        child: const FoldersView(),
      ),
      BlocProvider.value(
        value: locator<TasksListCubit>(),
        child: const TasksView(),
      ),
      const HomeView(),
    ];
  }

  _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: CupertinoColors.systemGrey,
        icon: const Icon(CupertinoIcons.doc_text),
        activeColorPrimary: AppColors.purple,
        title: ("Notes"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorPrimary: AppColors.blue,
        icon: const Icon(Icons.checklist_outlined),
        title: ("Todo"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorPrimary: AppColors.black,
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      resizeToAvoidBottomInset: true,
      padding: const EdgeInsets.only(top: 8),
      animationSettings: const NavBarAnimationSettings(
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
        ),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
