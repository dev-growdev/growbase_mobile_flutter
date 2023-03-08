import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/view/widgets/body_layout.widget.dart';
import '../../../../shared/view/widgets/primary_button.widget.dart';
import '../../../../utils/routes.dart';
import 'faqs.store.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  final store = FaqsStore(GetIt.I());

  @override
  void initState() {
    super.initState();
    store.getFaqs();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs - Dúvidas Frequentes'),
      ),
      body: Observer(builder: (context) {
        if (store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return BodyLayout(
          bottomWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                'Não encontrou o que procura?',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.requestHelp),
                text: 'Pedir ajuda',
              ),
            ],
          ),
          child: store.state.isEmpty
              ? const Center(
                  child: Text('Nenhuma pergunta encontrada.'),
                )
              : Column(
                  children: List.generate(
                    store.state.length,
                    (index) {
                      final faq = store.state.elementAt(index);
                      return _FaqTile(
                        question: faq.question,
                        answer: faq.answer,
                      );
                    },
                  ),
                ),
        );
      }),
    );
  }
}

class _FaqTile extends StatelessWidget {
  final String question;
  final String answer;
  const _FaqTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: theme.colorScheme.surfaceTint,
        color: theme.colorScheme.surface,
        shadowColor: theme.colorScheme.shadow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ExpansionTile(
          clipBehavior: Clip.antiAlias,
          onExpansionChanged: (value) {},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          title: Text(
            question,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
          iconColor: theme.colorScheme.primary,
          collapsedIconColor: theme.colorScheme.primary,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.onSurface.withOpacity(0.12),
                    width: 1,
                  ),
                ),
              ),
              child: Text(answer,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
