import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class CapitalHumanoContactForm extends StatefulWidget {
  const CapitalHumanoContactForm({super.key});

  @override
  State<CapitalHumanoContactForm> createState() =>
      _CapitalHumanoContactFormState();
}

class _CapitalHumanoContactFormState extends State<CapitalHumanoContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedArea = 'Desarrollo de Capital Humano';

  final List<String> _areas = [
    'Desarrollo de Capital Humano',
    'Certificaciones ISO/CONOCER',
    'Medio Ambiente',
    'Ingeniería y Tecnología',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: colorOnSurfaceVariant.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fast Communication',
              style: headlineMdStyle(color: colorPrimary),
            ),
            const SizedBox(height: 32),

            // Nombre Completo
            TextFormField(
              controller: _nameController,
              style: bodyMdStyle(color: colorOnBackground),
              decoration: InputDecoration(
                labelText: 'NOMBRE COMPLETO',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Escriba su nombre',
                hintStyle: bodyMdStyle(
                  color: colorOnSurfaceVariant.withValues(alpha: 0.4),
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
                  return 'Por favor escribe tu nombre completo';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // Email Corporativo
            TextFormField(
              controller: _emailController,
              style: bodyMdStyle(color: colorOnBackground),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'EMAIL CORPORATIVO',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'nombre@empresa.com',
                hintStyle: bodyMdStyle(
                  color: colorOnSurfaceVariant.withValues(alpha: 0.4),
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
                  return 'Por favor ingresa un correo electrónico';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Por favor ingresa un correo válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // Área de Interés
            DropdownButtonFormField<String>(
              initialValue: _selectedArea,
              style: bodyMdStyle(color: colorOnBackground),
              decoration: InputDecoration(
                labelText: 'ÁREA DE INTERÉS',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0x33003298), width: 2),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: colorSecondary, width: 2),
                ),
              ),
              items: _areas.map((String area) {
                return DropdownMenuItem<String>(value: area, child: Text(area));
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedArea = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 32),

            // Mensaje
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              style: bodyMdStyle(color: colorOnBackground),
              decoration: InputDecoration(
                labelText: 'MENSAJE',
                labelStyle: labelSmStyle(color: colorPrimary),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Cuéntenos sobre sus necesidades...',
                hintStyle: bodyMdStyle(
                  color: colorOnSurfaceVariant.withValues(alpha: 0.4),
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
                  return 'Por favor redacta tu mensaje';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),

            // Submit Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorPrimary,
                elevation: 4,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Simulate submission success
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: colorSecondary,
                      content: Text(
                        '¡Solicitud enviada con éxito! Nos comunicaremos a la brevedad.',
                        style: bodyMdStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                  _nameController.clear();
                  _emailController.clear();
                  _messageController.clear();
                  setState(() {
                    _selectedArea = 'Desarrollo de Capital Humano';
                  });
                }
              },
              child: Text(
                'Enviar Solicitud',
                style: labelSmStyle(
                  color: Colors.white,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
