import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';
import 'package:jocar_web/widgets/cut_corner_button.dart';

class IngenieriaContactForm extends StatefulWidget {
  const IngenieriaContactForm({super.key});

  @override
  State<IngenieriaContactForm> createState() => _IngenieriaContactFormState();
}

class _IngenieriaContactFormState extends State<IngenieriaContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedService = 'Soldadura y Estructuras';

  final List<String> _services = [
    'Soldadura y Estructuras',
    'Electricidad y Automatización',
    'Vidrio y Aluminio',
    'Sistemas HVAC',
    'Mantenimiento General',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget _buildFieldContainer({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: labelSmStyle(color: colorOnSurfaceVariant.withValues(alpha: 0.6))
              .copyWith(letterSpacing: 1.2),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  InputDecoration _getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: bodyMdStyle(
        color: colorOnSurfaceVariant.withValues(alpha: 0.4),
      ),
      filled: true,
      fillColor: colorSurfaceContainerLow,
      contentPadding: const EdgeInsets.all(16),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0x33003298), width: 2),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0x1F003298), width: 2),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: colorSecondary, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTwoColumns = constraints.maxWidth > 650;

        return Container(
          padding: EdgeInsets.all(isTwoColumns ? 40 : 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: colorPrimary.withValues(alpha: 0.05),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: colorPrimary.withValues(alpha: 0.08),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (isTwoColumns) ...[
                  // Row 1: Nombre & Correo
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildFieldContainer(
                          label: 'Nombre Completo',
                          child: TextFormField(
                            controller: _nameController,
                            style: bodyMdStyle(color: colorOnBackground),
                            decoration: _getInputDecoration('Ej. Juan Pérez'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Por favor escribe tu nombre completo';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _buildFieldContainer(
                          label: 'Correo Corporativo',
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: bodyMdStyle(color: colorOnBackground),
                            decoration: _getInputDecoration('nombre@empresa.com'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Por favor ingresa tu correo';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
                                return 'Por favor ingresa un correo válido';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Row 2: Servicio & Ubicación
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildFieldContainer(
                          label: 'Servicio de Interés',
                          child: DropdownButtonFormField<String>(
                            initialValue: _selectedService,
                            style: bodyMdStyle(color: colorOnBackground),
                            decoration: _getInputDecoration(''),
                            items: _services.map((String service) {
                              return DropdownMenuItem<String>(
                                value: service,
                                child: Text(service),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() {
                                  _selectedService = newValue;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: _buildFieldContainer(
                          label: 'Ubicación del Proyecto',
                          child: TextFormField(
                            controller: _locationController,
                            style: bodyMdStyle(color: colorOnBackground),
                            decoration: _getInputDecoration('Ciudad / Estado'),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Por favor ingresa la ubicación';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  // Mobile stack
                  _buildFieldContainer(
                    label: 'Nombre Completo',
                    child: TextFormField(
                      controller: _nameController,
                      style: bodyMdStyle(color: colorOnBackground),
                      decoration: _getInputDecoration('Ej. Juan Pérez'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor escribe tu nombre';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFieldContainer(
                    label: 'Correo Corporativo',
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: bodyMdStyle(color: colorOnBackground),
                      decoration: _getInputDecoration('nombre@empresa.com'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa tu correo';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
                          return 'Por favor ingresa un correo válido';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFieldContainer(
                    label: 'Servicio de Interés',
                    child: DropdownButtonFormField<String>(
                      initialValue: _selectedService,
                      style: bodyMdStyle(color: colorOnBackground),
                      decoration: _getInputDecoration(''),
                      items: _services.map((String service) {
                        return DropdownMenuItem<String>(
                          value: service,
                          child: Text(service),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedService = newValue;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFieldContainer(
                    label: 'Ubicación del Proyecto',
                    child: TextFormField(
                      controller: _locationController,
                      style: bodyMdStyle(color: colorOnBackground),
                      decoration: _getInputDecoration('Ciudad / Estado'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor ingresa la ubicación';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                // Full Width Row: Descripción
                _buildFieldContainer(
                  label: 'Descripción del Requerimiento',
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 4,
                    style: bodyMdStyle(color: colorOnBackground),
                    decoration: _getInputDecoration(
                      'Describa brevemente las necesidades técnicas...',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Por favor escribe la descripción del requerimiento';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 32),
                // Submit Button
                Center(
                  child: SizedBox(
                    width: isTwoColumns ? null : double.infinity,
                    child: CutCornerButton(
                      text: 'ENVIAR SOLICITUD DE INGENIERÍA',
                      horizontalPadding: 40,
                      verticalPadding: 20,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: colorSecondaryContainer,
                              content: Text(
                                '¡Solicitud técnica enviada! Un especialista se pondrá en contacto en menos de 24 horas.',
                                style: bodyMdStyle(
                                  color: colorOnSecondaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                          _nameController.clear();
                          _emailController.clear();
                          _locationController.clear();
                          _descriptionController.clear();
                          setState(() {
                            _selectedService = 'Soldadura y Estructuras';
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
