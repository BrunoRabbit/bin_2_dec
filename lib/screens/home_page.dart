import 'package:bin_2_dec/providers/calculo.dart';
import 'package:bin_2_dec/providers/colors_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Calcular _controller = Provider.of<Calcular>(context);

    final ColorsProvider _controllerColor =
        Provider.of<ColorsProvider>(context);

    return Scaffold(
      backgroundColor: _controllerColor.whiteColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.35,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Número Binário!',
                        style: TextStyle(
                          color: _controllerColor.yellowColor,
                        ),
                      ),
                    ),
                    // const Spacer(),
                    Tooltip(
                      message: 'Insira apenas digitos - 0 e 1',
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _controllerColor.yellowColor,
                      ),
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: _controllerColor.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.help_outline_outlined,
                          color: _controllerColor.blackColor,
                          size: 19,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: _controllerColor.blackColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: _controller.binaryController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-1]'))
                    ],
                    maxLength: 8,
                    cursorColor: _controllerColor.whiteColor,
                    style: TextStyle(
                      color: _controllerColor.whiteColor,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: _controllerColor.yellowColor,
                        primary: _controllerColor.blackColor,
                      ),
                      onPressed: () => _controller
                          .onConverter(_controller.binaryController.text),
                      child: const Text('Converter!'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        _controller.onClear(),
                        _controller.binaryController.text = ''
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: _controllerColor.yellowColor,
                        primary: _controllerColor.blackColor,
                      ),
                      child: const Text('Limpar!'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Binário: ',
                        style: TextStyle(color: _controllerColor.yellowColor)),
                    TextSpan(
                        text: _controller.binaryNum,
                        style: TextStyle(color: _controllerColor.blackColor)),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Decimal: ',
                        style: TextStyle(color: _controllerColor.yellowColor)),
                    TextSpan(
                        text: _controller.decimal.toString(),
                        style: TextStyle(color: _controllerColor.blackColor)),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  _controller.errorTxt,
                  style: TextStyle(
                    color: _controllerColor.yellowColor,
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
