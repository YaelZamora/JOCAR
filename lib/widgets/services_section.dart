import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/division_card.dart';
import 'package:jocar_web/widgets/amisi_logo.dart';

class ServicesSection extends StatelessWidget {
  final bool isDesktop;

  const ServicesSection({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorSurfaceContainerLow,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1280),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header Layout
              isDesktop
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DIVISIONES ESTRATÉGICAS',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: colorPrimary,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Integramos tecnología, talento e ingeniería para ofrecer resultados que transforman organizaciones.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: colorOnSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 48),
                        AmisiLogo(),
                      ],
                    )
                  : const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DIVISIONES ESTRATÉGICAS',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: colorPrimary,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Integramos tecnología, talento e ingeniería para ofrecer resultados que transforman organizaciones.',
                              style: TextStyle(
                                fontSize: 18,
                                color: colorOnSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        AmisiLogo(),
                      ],
                    ),
              const SizedBox(height: 64),

              // Service Cards Layout
              isDesktop
                  ? Row(
                      children: [
                        Expanded(
                          child: DivisionCard(
                            imageUrl:
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuB0XDxxT16WGfEsSYUl4xYEiR891D8roDdar9vWe8wYDL5CHtDA443f4BD6kY4ZjX81qWzkaNfNnjF-HA7JbmmGUJxSHZq6QLvwxWiYC4ZusAEdpuJDZ3OmUfLI4VXAArwacEJaebZwCAF6WOxtsvupMKFPA8KHPhOdn41gQgX3cYZqmdkOxMUmDN-8GuBWcDZUi8aEMoMHxcjuZOpqF1ohsBZsUIXmtlO5ifonHtLDOXpF5N9-lAPSg32xgEvaYGyNB28X3b0wUMY',
                            icon: Icons.groups,
                            title: 'Capital Humano',
                            description:
                                'Desarrollo de habilidades y capacitación técnica de alto nivel.',
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: DivisionCard(
                            imageUrl:
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuB7WTSlWQx4AHESMzxnpWxieMVcmsOIjTA5qy7rjRQA9K9ghwf4BvemGbmE7bwK0kamJcgdav-N4IChnnRJp0HtDuaa0kD1Nk2wk9zdhEJ_ppsdkFsQV5ma6ZocfheoPmG2FBo981_sjg2OCZQb5XPSFm_T9Xam6U3swLvEqnBtepB933COZRlYcZucPfsRlPqiWvPEDI07_OUzCHvrDuVEvLYFlCT3_50x43pMgnpZDCgAHy6aSTbcj9pN3eTbEE3z-qDwF_xJUSE',
                            icon: Icons.precision_manufacturing,
                            title: 'Ingeniería',
                            description:
                                'Mantenimiento industrial e innovación en maquinaria de precisión.',
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: DivisionCard(
                            imageUrl:
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCFL2di1Zk8Mp5W_-ZaV37C5UlachREDyhLVTrdvhji_dQQrRYpwTu5CeojQvuAe0tDbxM1JGxRAlauqeszNyLAz1QpnFkJMmsieRrdfdf3CklGJzBn9ItjMkNLaEagtabJCO381uSGQZ30yTz85G7HuNre7jC7U94dRyyldPC2pUNca2-wdsz-5lYixFg0gpmKcg3fY5ejODM0ur66DQlwLVYXfdS0HbyG1Th146-jHamAekfaJwqS-BdrDDpe6S0K0yki_-M33-0',
                            icon: Icons.psychology,
                            title: 'Tecnología e IA',
                            description:
                                'Digitalización de procesos y aplicación de Inteligencia Artificial.',
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        DivisionCard(
                          imageUrl:
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuB0XDxxT16WGfEsSYUl4xYEiR891D8roDdar9vWe8wYDL5CHtDA443f4BD6kY4ZjX81qWzkaNfNnjF-HA7JbmmGUJxSHZq6QLvwxWiYC4ZusAEdpuJDZ3OmUfLI4VXAArwacEJaebZwCAF6WOxtsvupMKFPA8KHPhOdn41gQgX3cYZqmdkOxMUmDN-8GuBWcDZUi8aEMoMHxcjuZOpqF1ohsBZsUIXmtlO5ifonHtLDOXpF5N9-lAPSg32xgEvaYGyNB28X3b0wUMY',
                          icon: Icons.groups,
                          title: 'Capital Humano',
                          description:
                              'Desarrollo de habilidades y capacitación técnica de alto nivel.',
                        ),
                        const SizedBox(height: 32),
                        DivisionCard(
                          imageUrl:
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuB7WTSlWQx4AHESMzxnpWxieMVcmsOIjTA5qy7rjRQA9K9ghwf4BvemGbmE7bwK0kamJcgdav-N4IChnnRJp0HtDuaa0kD1Nk2wk9zdhEJ_ppsdkFsQV5ma6ZocfheoPmG2FBo981_sjg2OCZQb5XPSFm_T9Xam6U3swLvEqnBtepB933COZRlYcZucPfsRlPqiWvPEDI07_OUzCHvrDuVEvLYFlCT3_50x43pMgnpZDCgAHy6aSTbcj9pN3eTbEE3z-qDwF_xJUSE',
                          icon: Icons.precision_manufacturing,
                          title: 'Ingeniería',
                          description:
                              'Mantenimiento industrial e innovación en maquinaria de precisión.',
                        ),
                        const SizedBox(height: 32),
                        DivisionCard(
                          imageUrl:
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuCFL2di1Zk8Mp5W_-ZaV37C5UlachREDyhLVTrdvhji_dQQrRYpwTu5CeojQvuAe0tDbxM1JGxRAlauqeszNyLAz1QpnFkJMmsieRrdfdf3CklGJzBn9ItjMkNLaEagtabJCO381uSGQZ30yTz85G7HuNre7jC7U94dRyyldPC2pUNca2-wdsz-5lYixFg0gpmKcg3fY5ejODM0ur66DQlwLVYXfdS0HbyG1Th146-jHamAekfaJwqS-BdrDDpe6S0K0yki_-M33-0',
                          icon: Icons.psychology,
                          title: 'Tecnología e IA',
                          description:
                              'Digitalización de procesos y aplicación de Inteligencia Artificial.',
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
