import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../tools/shared_preferences_helper.dart';
import '../../tools/tools.dart';

class CurrencyConverter extends StatefulWidget {
  final Map<String, String>? currencySymbols;
  final String? fromCurrency;
  final String? toCurrency;
  final double? exchangeRate;
  final bool rateError;
  final void Function(String fromCurrency, String toCurrency) onCurrencyChanged;

  const CurrencyConverter({
    super.key,
    required this.currencySymbols,
    required this.fromCurrency,
    required this.toCurrency,
    required this.exchangeRate,
    required this.rateError,
    required this.onCurrencyChanged,
  });

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final _amountController = TextEditingController(text: '1');
  final _convertedAmountController = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    _updateConverted();
  }

  @override
  void didUpdateWidget(covariant CurrencyConverter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.exchangeRate != widget.exchangeRate) {
      _updateConverted();
    }
  }


  void _updateConverted() {
    final amount = double.tryParse(_amountController.text) ?? 0;

    // Prevent update if exchangeRate is null
    if (widget.exchangeRate == null) {
      _convertedAmountController.text = '';
      return;
    }

    final converted = amount * widget.exchangeRate!;
    _convertedAmountController.text = converted.toStringAsFixed(2);
  }

  void _updateFromConverted() {
    final converted = double.tryParse(_convertedAmountController.text) ?? 0;

    // Prevent update if exchangeRate is null or 0
    if (widget.exchangeRate == null || widget.exchangeRate == 0) {
      _amountController.text = '';
      return;
    }

    final amount = converted / widget.exchangeRate!;
    _amountController.text = amount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final hasAllData = widget.currencySymbols != null &&
        widget.fromCurrency != null &&
        widget.toCurrency != null;

    final fromCurrencyValid =
        widget.currencySymbols?.containsKey(widget.fromCurrency) ?? false;
    final toCurrencyValid =
        widget.currencySymbols?.containsKey(widget.toCurrency) ?? false;

    // If there's an error, hide the widget completely
    if (widget.rateError) {
      return const SizedBox.shrink();
    }

    // While loading or missing data, show loading indicator
    if (!hasAllData || !fromCurrencyValid || !toCurrencyValid) {
      return SizedBox(
        height: 180,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }
    return SizedBox(
      height: 180,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First line: FROM
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => _updateConverted(),
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.from_amount,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.currency,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: widget.fromCurrency,
                          items: widget.currencySymbols?.keys.map((code) {
                            return DropdownMenuItem<String>(
                              value: code,
                              child: Text(Tools.translateCurrency(context, code)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null && widget.toCurrency != null ) {
                              widget.onCurrencyChanged(value, widget.toCurrency!);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Second line: TO
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _convertedAmountController,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => _updateFromConverted(),
                      style: const TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.to_amount,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.currency,
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: widget.toCurrency,
                          items: widget.currencySymbols?.keys.map((code) {
                            return DropdownMenuItem<String>(
                              value: code,
                              child: Text(Tools.translateCurrency(context, code)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              widget.onCurrencyChanged(widget.fromCurrency!, value);
                              SharedPreferencesHelper.saveTargetCurrency(value);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                widget.exchangeRate != null
                    ? '${AppLocalizations.of(context)!.exchange_rate}: 1 ${widget.fromCurrency} = ${widget.exchangeRate!.toStringAsFixed(2)} ${widget.toCurrency}'
                    : AppLocalizations.of(context)!.loading_exchange_rate, // You can also hardcode: 'Loading exchange rate...'
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
