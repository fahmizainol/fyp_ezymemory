import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:stacked/stacked.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    viewModel.futureToRun();
    // print(viewModel.fetchedUser?.username.toString());
    return viewModel.isBusy
        ? const CircularProgressIndicator()
        : EMScaffold(
            appBar: EMAppBar(
              title: viewModel.fetchedUser != null
                  ? "Welcome ${viewModel.fetchedUser?.username.toString()}"
                  : "Welcome nulls",
            ),
            bottomNavigationBar: EMBottomBar(),
            backgroundColor: Colors.grey,
            // bottomNavigationBar: BottomNavigationBar(
            //   items: const <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.business),
            //       label: 'Business',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.school),
            //       label: 'School',
            //     ),
            //   ],
            //   // currentIndex: _selectedIndex,
            //   selectedItemColor: Colors.amber[800],
            //   // onTap: _onItemTapped,
            // ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      verticalSpaceLarge,
                      Column(
                        children: [
                          ListView.builder(
                              itemCount: viewModel.fetchedUserDeckList?.length,
                              // prototypeItem: ListTile(
                              //   title: Text(viewModel.fetchedUserDeckList?.l),
                              // ),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  leading: Text(index.toString()),
                                  // title: Text(viewModel.fetchedUserDeckList.isNotEmpty
                                  //     ? viewModel.fetchedUserDeckList[index].name
                                  //     : "null"),
                                  title: Text(viewModel
                                          .fetchedUserDeckList?[index].name ??
                                      ""),
                                );
                              }))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            color: kcDarkGreyColor,
                            onPressed: viewModel.showDialog,
                            child: const Text(
                              'Import Deck +',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          MaterialButton(
                            color: kcDarkGreyColor,
                            onPressed: viewModel.toCreateDeckView,
                            child: const Text(
                              'Create Deck +',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
    // );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
