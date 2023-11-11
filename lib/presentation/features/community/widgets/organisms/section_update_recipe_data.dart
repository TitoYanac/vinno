import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionUpdateRecipeData extends StatefulWidget {
  const SectionUpdateRecipeData({super.key, required this.nameRecipeController, required this.numPersonsController, required this.difficultyController, required this.onCountrySelected});

  final Function(String) onCountrySelected;
  final TextEditingController nameRecipeController;
  final TextEditingController numPersonsController;
  final TextEditingController difficultyController;
  @override
  State<SectionUpdateRecipeData> createState() =>
      _SectionUpdateRecipeDataState();
}

class _SectionUpdateRecipeDataState extends State<SectionUpdateRecipeData> {
  /// Default.
  final countryPicker = const FlCountryCodePicker();
  String _countrySelected = "";

  /// With custom params.


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.only(top: 24),
      child: ExpansionTile(
        title: const Text("Datos de la receta"),
        initiallyExpanded: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Nombre de la receta',
                      fillColor: Theme.of(context).colorScheme.surface,
                      floatingLabelBehavior: FloatingLabelBehavior
                          .auto, // O FloatingLabelBehavior.never
                    ),
                    controller: widget.nameRecipeController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'N° Personas',
                      fillColor: Theme.of(context).colorScheme.surface,
                      floatingLabelBehavior: FloatingLabelBehavior
                          .auto, // O FloatingLabelBehavior.never
                    ),
                    controller: widget.numPersonsController,
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Dificultad',
                      fillColor: Theme.of(context).colorScheme.surface,
                      floatingLabelBehavior: FloatingLabelBehavior
                          .auto, // O FloatingLabelBehavior.never
                    ),
                    controller: widget.difficultyController,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final code = await FlCountryCodePicker(
                        localize: true,
                        showDialCode: true,
                        showSearchBar: true,
                        favoritesIcon: Icon(
                          Icons.history,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        favorites: [
                          "PE",
                          "MX",
                          "AR",
                          "CO",
                          "CL",
                          "EC",
                        ],
                        title: Text(
                          "Pais",
                          style: GoogleFonts.roboto(
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        filteredCountries: [],
                        countryTextStyle:
                            GoogleFonts.roboto(color: Theme.of(context).colorScheme.secondary, fontSize: 14),
                        dialCodeTextStyle:
                            GoogleFonts.roboto(color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
                        searchBarDecoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          hintText: "Buscar...",
                          hintStyle:
                              GoogleFonts.roboto(color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: const Icon(Icons.cancel),
                          contentPadding: const EdgeInsets.all(16),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),



                        ),
                      ).showPicker(context: context);
                      if (code != null) {
                        setState(() {
                          _countrySelected = code.name;
                          widget.onCountrySelected(_countrySelected);
                        });
                      }
                      ;
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 15.0),
                      ),
                    ),
                    child: Text(
                      _countrySelected == ""
                          ? "País de la receta"
                          : _countrySelected,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
