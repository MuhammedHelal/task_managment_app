import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planning_app/core/networking/api_error_handler.dart';

part 'quote_state.freezed.dart';

@freezed
class QuoteState<T> with _$QuoteState<T> {
  const factory QuoteState.initial() = _Initial;
  const factory QuoteState.loading() = Loading;
  const factory QuoteState.success(T data) = Success;
  const factory QuoteState.error(ErrorHandler error) = Error;
}
