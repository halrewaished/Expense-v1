import 'package:flutter/material.dart';
import '../Dashboards/DashBoard.dart';
import '../Model/colors.dart' as color;
import 'show.dart';
import 'home.dart';

class TabBarItem {
  final IconData icon;
  final String label;
  final Widget page;

  TabBarItem(this.icon, this.label, this.page);
}

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final PageController _pageController = PageController();
  int indexTap = 0;

  List<TabBarItem> tabItems = [
    TabBarItem(Icons.home_filled, "الرئيسية", TopSection()),
    TabBarItem(Icons.bar_chart, "الإحصائيات",
        DefaultTabController(length: 2, child: Dashboard()))
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: color.Colors.backgroundGreenColor,
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                // useRootNavigator : false,
                builder: (BuildContext context) {
                  return const FractionallySizedBox(
                    heightFactor: 0.75,
                    child: show(),
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
          controller: _pageController,
          children: _getChildrenTabBar(),
          onPageChanged: (index) {
            setState(() {
              indexTap = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: color.Colors.backgroundGreenColor,
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          onTap: (index) {
            setState(() {
              indexTap = index;
            });
            _pageController.animateToPage(indexTap,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: indexTap,
          items: _renderTaps(),
        ),
      ),
    );
  }

  List<Widget> _getChildrenTabBar() {
    List<Widget> items = [];
    for (var item in tabItems) {
      items.add(item.page);
    }
    return items;
  }

  List<BottomNavigationBarItem> _renderTaps() {
    List<BottomNavigationBarItem> items = [];
    for (var i = 0; i < tabItems.length; i++) {
      BottomNavigationBarItem obj = BottomNavigationBarItem(
          icon: Icon(
            tabItems[i].icon,
            color: indexTap == i
                ? color.Colors.backgroundGreenColor
                : Colors.black26,
          ),
          label: tabItems[i].label);
      items.add(obj);
    }
    return items;
  }
}
