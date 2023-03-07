import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/view/stores/app.store.dart';
import '../../../shared/view/widgets/body_layout.widget.dart';
import '../../../utils/routes.dart';
import 'update_profile/update_profile.page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final appStore = GetIt.I<AppStore>();

  void openUpdateProfile() {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (context) => const UpdateProfilePage(),
    );
  }

  void logout() async {
    final navigator = Navigator.of(context);
    await appStore.logout();
    navigator.pushReplacementNamed(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: BodyLayout(
        hasAppBar: false,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        bottomWidget: const _ByGrowdev(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.topCenter,
              child: Observer(builder: (_) {
                return Text(
                  appStore.user?.name ?? '',
                  style: theme.textTheme.titleLarge,
                );
              }),
            ),
            const SizedBox(height: 32),
            _SectionMenu(
              title: 'Meus dados',
              itens: [
                _SectionItem(
                  icon: Icons.account_circle_outlined,
                  title: 'Meu perfil',
                  onTap: openUpdateProfile,
                ),
                _SectionItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'Trocar senha',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionMenu(
              title: 'Outros',
              itens: [
                _SectionItem(
                  icon: Icons.support_agent_outlined,
                  title: 'Central de ajuda',
                  onTap: () {},
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton.icon(
                onPressed: logout,
                icon: const Icon(Icons.logout_outlined),
                label: const Text(
                  'Encerrar sessão',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ByGrowdev extends StatelessWidget {
  const _ByGrowdev();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Text(
          'Desenvolvido por Growdev',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _SectionMenu extends StatelessWidget {
  final String title;
  final List<_SectionItem> itens;

  const _SectionMenu({
    Key? key,
    required this.title,
    required this.itens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...itens,
      ],
    );
  }
}

class _SectionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const _SectionItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          splashColor: theme.colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
