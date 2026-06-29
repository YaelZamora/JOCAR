import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

const _colorOutline = Color(0xFF747686);
const _colorOutlineVariant = Color(0xFFC3C5D7);
const _colorSurfaceVariant = Color(0xFFE2E2E5);

class TecnologiaIaContactSection extends StatefulWidget {
  final bool isDesktop;

  const TecnologiaIaContactSection({super.key, required this.isDesktop});

  @override
  State<TecnologiaIaContactSection> createState() =>
      _TecnologiaIaContactSectionState();
}

class _TecnologiaIaContactSectionState
    extends State<TecnologiaIaContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  Widget _buildCutButton({
    required String text,
    required VoidCallback onPressed,
    Color? bgColor,
    Color? textColor,
    BorderSide border = BorderSide.none,
    IconData? icon,
    double verticalPadding = 16,
    double horizontalPadding = 24,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? colorPrimary,
        elevation: (bgColor == Colors.transparent || bgColor == null) ? 0 : 4,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12)),
        ),
        side: border,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: labelSmStyle(
              color: textColor ?? Colors.white,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 16, color: textColor ?? Colors.white),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // --- CTA SECTION (Dark Banner) ---
        Container(
          color: colorOnBackground,
          padding: const EdgeInsets.symmetric(vertical: 96),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: displayLgStyle(
                        color: Colors.white,
                        fontSize: widget.isDesktop ? 48.0 : 32.0,
                      ),
                      children: [
                        const TextSpan(text: '¿Listo para la '),
                        TextSpan(
                          text: 'Transformación?',
                          style: TextStyle(color: colorSecondaryContainer),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Conversemos sobre cómo nuestras soluciones de IA y Desarrollo pueden llevar su productividad al siguiente nivel.',
                    textAlign: TextAlign.center,
                    style: bodyLgStyle(
                      color: _colorSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildCutButton(
                    text: 'Lleva tu tecnología al siguiente nivel',
                    bgColor: colorSecondaryContainer,
                    textColor: colorOnSecondaryContainer,
                    onPressed: () {
                      // Request focus on Name field and scroll to contact
                      _nameFocusNode.requestFocus();
                    },
                    verticalPadding: 20,
                    horizontalPadding: 32,
                  ),
                ],
              ),
            ),
          ),
        ),

        // --- QUICK CONTACT BOX (Light Form) ---
        Container(
          color: colorSurface,
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1280),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: _colorOutlineVariant.withValues(alpha: 0.5),
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(40),
                child: Form(
                  key: _formKey,
                  child: widget.isDesktop
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: _buildContactText(),
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  Expanded(child: _buildNameField()),
                                  const SizedBox(width: 16),
                                  Expanded(child: _buildEmailField()),
                                ],
                              ),
                            ),
                            const SizedBox(width: 32),
                            _buildSubmitButton(),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildContactText(),
                            const SizedBox(height: 32),
                            _buildNameField(),
                            const SizedBox(height: 24),
                            _buildEmailField(),
                            const SizedBox(height: 32),
                            SizedBox(
                              width: double.infinity,
                              child: _buildSubmitButton(),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contacto Inmediato',
          style: headlineLgStyle(color: colorPrimary),
        ),
        const SizedBox(height: 8),
        Text(
          'Un consultor especializado le atenderá en menos de 24 horas.',
          style: bodyMdStyle(color: colorOnSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NOMBRE',
          style: labelSmStyle(
            color: colorOnSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          focusNode: _nameFocusNode,
          style: bodyMdStyle(color: colorOnBackground),
          decoration: InputDecoration(
            filled: true,
            fillColor: colorSurfaceContainerLow,
            hintText: 'Su nombre completo',
            hintStyle: bodyMdStyle(
              color: colorOnSurfaceVariant.withValues(alpha: 0.4),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: _colorOutline, width: 2),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: _colorOutline, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorSecondary, width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Ingresa tu nombre';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EMAIL',
          style: labelSmStyle(
            color: colorOnSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: bodyMdStyle(color: colorOnBackground),
          decoration: InputDecoration(
            filled: true,
            fillColor: colorSurfaceContainerLow,
            hintText: 'email@empresa.com',
            hintStyle: bodyMdStyle(
              color: colorOnSurfaceVariant.withValues(alpha: 0.4),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: _colorOutline, width: 2),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: _colorOutline, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorSecondary, width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Ingresa tu email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Email inválido';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return _buildCutButton(
      text: 'Enviar Solicitud',
      bgColor: colorPrimary,
      textColor: Colors.white,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: colorSecondary,
              content: Text(
                '¡Solicitud enviada con éxito! Nos pondremos en contacto.',
                style: bodyMdStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
          _nameController.clear();
          _emailController.clear();
        }
      },
      verticalPadding: 20,
      horizontalPadding: 32,
    );
  }
}
