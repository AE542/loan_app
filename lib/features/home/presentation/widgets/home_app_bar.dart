import 'package:flutter/material.dart';
import 'package:loan_app/features/loan_history/loan_history.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () => _onLoanHistoryPressed(context),
            icon: Icon(
              Icons.segment_outlined,
              color: _getAppBarTextColor(context),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Leaf Loans',
                style: TextStyle(
                  color: _getAppBarTextColor(context),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: _onProfilePressed,
            icon: Icon(
              Icons.person_outlined,
              color: _getAppBarTextColor(context),
            ),
          ),
        ],
      ),
    );
  }

  void _onProfilePressed() {}

  void _onLoanHistoryPressed(BuildContext context) {
    Navigator.of(context).pushNamed(LoanHistoryScreen.routeName);
  }

  Color _getAppBarTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurface;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
