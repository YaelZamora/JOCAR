import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: colorSurface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: colorPrimary.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              style: bodyMdStyle(color: colorOnBackground),
              decoration: InputDecoration(
                labelText: 'NOMBRE COMPLETO',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Escribe tu nombre',
                hintStyle: bodyMdStyle(
                  color: colorOnSurfaceVariant.withOpacity(0.4),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0x33003298), width: 2),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorSecondary, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor ingresa tu nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _companyController,
              style: bodyMdStyle(color: colorOnBackground),
              decoration: InputDecoration(
                labelText: 'EMPRESA',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Nombre de tu organización',
                hintStyle: bodyMdStyle(
                  color: colorOnSurfaceVariant.withOpacity(0.4),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0x33003298), width: 2),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorSecondary, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor ingresa el nombre de tu empresa';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              style: bodyMdStyle(color: colorOnBackground),
              decoration: InputDecoration(
                labelText: 'MENSAJE',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '¿Cómo podemos apoyarte?',
                hintStyle: bodyMdStyle(
                  color: colorOnSurfaceVariant.withOpacity(0.4),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0x33003298), width: 2),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorSecondary, width: 2),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Por favor escribe tu mensaje';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            CutCornerButton(
              text: 'ENVIAR MENSAJE',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Simulate submission success
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: colorSecondary,
                      content: Text(
                        '¡Mensaje enviado con éxito! Nos pondremos en contacto contigo.',
                        style: bodyMdStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                  _nameController.clear();
                  _companyController.clear();
                  _messageController.clear();
                }
              },
              verticalPadding: 20,
            ),
          ],
        ),
      ),
    );
  }
}
