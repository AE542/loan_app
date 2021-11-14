import 'package:flutter/material.dart';

import 'package:loan_app/features/loan_application/loan_application.dart';

class BigPersistentApplyButton extends SliverPersistentHeaderDelegate {
  BigPersistentApplyButton({
    required this.onApply,
  });

  final VoidCallback onApply;

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 95;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      height: 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 0,
        child: InkWell(
          onTap: () async {
            await Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => const NewLoanApplication(),
                  ),
                )
                .then((_) => onApply());
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Apply for a loan now',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'You can take loans as much as RWF 50,000',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
