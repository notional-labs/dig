import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_second_avatar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:dig_mobile_app/generated/l10n.dart';

enum DrawerMenu { account, staking, proposals }

typedef OnMenuChange = Function(DrawerMenu drawerMenu);
typedef OnAccountChange = Function(AccountPublicInfo account);

class HomeDrawer extends StatelessWidget {
  final List<AccountPublicInfo> accounts;
  final AccountPublicInfo? lastAccountSelected;
  final DrawerMenu? lastSelected;
  final OnMenuChange onMenuChange;
  final OnAccountChange onAccountChange;
  final VoidCallback onNewAccountTap;

  const HomeDrawer(
      {required this.accounts,
      required this.onMenuChange,
      required this.onAccountChange,
      required this.onNewAccountTap,
      this.lastAccountSelected,
      this.lastSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: DSColors.tundora,
        child: Container(
          padding: const EdgeInsets.fromLTRB(32.0, 60.0, 32.0, 8.0),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    width: 68,
                    height: 50,
                    child: Image.asset(AppAssets.icDigLogoWithText)),
              ),
              const SizedBox(height: 22),
              const Divider(
                height: 1,
                color: DSColors.tulipTree,
                thickness: 1,
              ),
              const SizedBox(height: 50),
              _AccountMenu(
                isSelected: () {
                  if (lastSelected == null) {
                    return true;
                  }
                  return lastSelected == DrawerMenu.account;
                }(),
                accounts: accounts,
                lastAccountSelected: lastAccountSelected,
                onAccountChange: (AccountPublicInfo accountPublicInfo) {
                  onAccountChange(accountPublicInfo);
                },
                onNewAccountTap: onNewAccountTap,
              ),
              const SizedBox(height: 50),
              _MenuItem(
                isSelected: lastSelected == DrawerMenu.staking,
                title: S.current.staking,
                onTap: () {
                  onMenuChange(DrawerMenu.staking);
                },
              ),
              const SizedBox(height: 50),
              _MenuItem(
                isSelected: lastSelected == DrawerMenu.proposals,
                title: S.current.proposals.toUpperCase(),
                onTap: () {
                  onMenuChange(DrawerMenu.proposals);
                },
              )
            ],
          ),
        ),
      );
}

class _AccountMenu extends StatelessWidget {
  final bool isSelected;
  final List<AccountPublicInfo> accounts;
  final AccountPublicInfo? lastAccountSelected;
  final OnAccountChange onAccountChange;
  final VoidCallback onNewAccountTap;

  const _AccountMenu(
      {required this.accounts,
      required this.onAccountChange,
      required this.onNewAccountTap,
      this.lastAccountSelected,
      this.isSelected = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuItem(
            title: S.current.account,
            onTap: () {},
            isSelected: isSelected,
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int index) {
              final account = accounts[index];
              bool isSelectedAccount = false;
              DSAvatarType avatarType = DSAvatarType.none;
              _PrimaryDotType dotType = _PrimaryDotType.none;
              if (lastAccountSelected == null) {
                isSelectedAccount = index == 0;
              } else if (lastAccountSelected!.accountId == account.accountId) {
                isSelectedAccount = true;
              }

              if (isSelectedAccount) {
                avatarType = DSAvatarType.active;
              }

              if (isSelected && isSelectedAccount) {
                dotType = _PrimaryDotType.selectedAndActive;
              } else if (isSelectedAccount) {
                dotType = _PrimaryDotType.selectedAndNone;
              }

              return _accoutItem(
                  account, avatarType, dotType, isSelectedAccount);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 20),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: _CreateAccountButton(
              onTap: onNewAccountTap,
            ),
          )
        ],
      );

  Widget _accoutItem(AccountPublicInfo account, DSAvatarType avatarType,
      _PrimaryDotType dotType, bool isSelectedAccount) {
    final color =
        isSelectedAccount ? DSColors.tulipTree : Colors.white.withOpacity(0.5);

    return GestureDetector(
      onTap: () {
        onAccountChange(account);
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 35),
            DSSecondAvatar(
              type: avatarType,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    account.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DSTextStyle.tsMontserratT16R.copyWith(color: color),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    account.publicAddress,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DSTextStyle.tsMontserratT10R.copyWith(color: color),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            _PrimaryDot(type: dotType)
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  const _MenuItem({
    required this.title,
    required this.onTap,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  Color _resolveTextColor() {
    if (isSelected) {
      return DSColors.tulipTree;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            children: [
              if (isSelected)
                const Padding(
                    padding: EdgeInsets.only(right: 15), child: _SecondDot())
              else
                const SizedBox(width: 23),
              Expanded(
                child: Text(
                  title,
                  style: DSTextStyle.tsMontserratT20B
                      .copyWith(color: _resolveTextColor()),
                ),
              ),
            ],
          ),
        ),
      );
}

class _CreateAccountButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CreateAccountButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [6, 6],
        radius: const Radius.circular(5),
        color: DSColors.tulipTree,
        child: SizedBox(
            width: double.infinity,
            height: 38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(
                    Icons.add,
                    color: DSColors.tulipTree,
                    size: 22,
                  ),
                ),
                Text(
                  'New account',
                  style: DSTextStyle.tsMontserratT12R
                      .copyWith(color: DSColors.tulipTree),
                )
              ],
            )),
      ),
    );
  }
}

enum _PrimaryDotType { selectedAndActive, selectedAndNone, none }

class _PrimaryDot extends StatelessWidget {
  final _PrimaryDotType type;
  const _PrimaryDot({this.type = _PrimaryDotType.none, Key? key})
      : super(key: key);

  Color _resolveBackgroudColor() {
    switch (type) {
      case _PrimaryDotType.selectedAndActive:
        return DSColors.tulipTree;
      default:
        return Colors.white.withOpacity(0.5);
    }
  }

  Widget _resolveInnerDot() {
    if (type != _PrimaryDotType.none) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: _resolveBackgroudColor(), shape: BoxShape.circle),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: _resolveBackgroudColor()),
          shape: BoxShape.circle),
      child: _resolveInnerDot(),
    );
  }
}

class _SecondDot extends StatelessWidget {
  const _SecondDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
          color: DSColors.tulipTree, shape: BoxShape.circle),
    );
  }
}
