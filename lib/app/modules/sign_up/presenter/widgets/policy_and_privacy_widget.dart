// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PolicyAndPrivacyWidget extends StatefulWidget {
  const PolicyAndPrivacyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PolicyAndPrivacyWidget> createState() => _PolicyAndPrivacyWidgetState();
}

class _PolicyAndPrivacyWidgetState extends State<PolicyAndPrivacyWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    final size = MediaQuery.of(context).size;
    final bool isNotMinorHeight = size.height > 720;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: FormField<bool>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        builder: (state) {
          return Column(
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Checkbox(
                      value: isTapped,
                      onChanged: (v) => setState(() {
                        isTapped = v!;
                        state.didChange(v);
                      }),
                      activeColor: color,
                      side: BorderSide(
                        color: color,
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          fontSize: isNotMinorHeight ? 14 : 13,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: state.errorText == null ? 0 : 10),
                    child: Text(
                      state.errorText ?? '',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        validator: (value) {
          if (!isTapped) {
            return 'You need to accept terms';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
