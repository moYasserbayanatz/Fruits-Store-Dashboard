import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/core/widgets/show_error.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/manager/add_product_cubit.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/widgets/image_filed.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/widgets/is_featured_check_box.dart';
import 'package:fruits_dashboard/view/addProduct/presentation/widgets/is_orgainc_check_box.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/add_product_entity.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name, description, code;
  late num price, expirationMonths, numberOfCalories, unitAmount;

  bool isOrganic = false;
  bool isFeatured = false;
  late File image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                CustomTextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintText: 'Product Name',
                    inputType: TextInputType.text),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      price = num.parse(value!);
                    },
                    hintText: 'Product Price',
                    inputType: TextInputType.number),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    description = value!;
                  },
                  hintText: 'Product Description',
                  inputType: TextInputType.text,
                  maxLines: 5,
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    expirationMonths = num.parse(value!);
                  },
                  hintText: 'Expiration Months',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    numberOfCalories = num.parse(value!);
                  },
                  hintText: 'Number Of Calories',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  },
                  hintText: 'Unit Amont',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                    onSaved: (value) {
                      code = value!.toLowerCase();
                    },
                    hintText: "Product Code",
                    inputType: TextInputType.number),
                SizedBox(
                  height: 16,
                ),
                ImageField(
                  onFileChanged: (image) {
                    this.image = image!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                IsFeaturedCheckBox(
                  onChanged: (value) {
                    isFeatured = value;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                IsOrganicCheckBox(
                  onChanged: (value) {
                    isOrganic = value;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                    onPressed: () {
                      if (image != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          AddProductEntity addProductEntity = AddProductEntity(
                            reviews: [],
                              name: name,
                              description: description,
                              isOrganic: isOrganic,
                              code: code,
                              expirationsMonths: expirationMonths.toInt(),
                              numberOfCalories: numberOfCalories.toInt(),
                              unitAmount: unitAmount.toInt(),
                              price: price,
                              isFeatured: isFeatured,
                              image: image);
                          context
                              .read<AddProductCubit>()
                              .addProduct(addProductEntity);
                        }
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        showError(context, 'Please fill all fields');
                      }
                    },
                    title: 'Add')
              ],
            )),
      ),
    );
  }
}
