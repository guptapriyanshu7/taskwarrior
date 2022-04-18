import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskwarrior/database/database.dart';
import 'package:taskwarrior/domain/task.dart';

part 'create_task_bloc.freezed.dart';

@freezed
class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState({
    String? description,
    @Default('Please enter a description.')
        String? descriptionValidationErrorMsg,
    String? existingProjectId,
    String? newProjectName,
    String? tag,
    DateTime? due,
    String? dependsOnTaskId,
    @Default(false) bool isLoading,
  }) = _CreateTaskState;
}

@freezed
class CreateTaskEvent with _$CreateTaskEvent {
  const factory CreateTaskEvent.descriptionChanged(String description) =
      _DescriptionChanged;
  const factory CreateTaskEvent.existingProjectChanged(
      String existingProjectId) = _ExistingProjectChanged;
  const factory CreateTaskEvent.newProjectNameChanged(String newProjectName) =
      _NewProjectNameChanged;
  const factory CreateTaskEvent.tagChanged(String tag) = _TagChanged;
  const factory CreateTaskEvent.dueChanged(DateTime? due) = _DueChanged;
  const factory CreateTaskEvent.dependsOnTaskChanged(String dependsOnTaskId) =
      _DependsOnTaskChanged;
  const factory CreateTaskEvent.created() = _Created;
}

class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  final TaskDatabase _taskDB;

  CreateTaskBloc(this._taskDB) : super(const CreateTaskState()) {
    on<CreateTaskEvent>((event, emit) {
      event.when(
        descriptionChanged: (description) {
          String? msg;
          if (description.trim().isEmpty) {
            msg = 'Please enter a description.';
          } else if (description.length > 500) {
            msg = 'description too big';
          }
          emit(state.copyWith(
            description: description,
            descriptionValidationErrorMsg: msg,
          ));
        },
        existingProjectChanged: (existingProjectId) =>
            emit(state.copyWith(existingProjectId: existingProjectId)),
        newProjectNameChanged: (newProjectName) =>
            emit(state.copyWith(newProjectName: newProjectName)),
        tagChanged: (tag) => emit(state.copyWith(tag: tag)),
        dueChanged: (due) => emit(state.copyWith(due: due)),
        dependsOnTaskChanged: (dependsOnTaskId) =>
            emit(state.copyWith(dependsOnTaskId: dependsOnTaskId)),
        created: () async {
          final task = Task(
            id: '1',
            createdAt: DateTime.now(),
            description: state.description!,
            urgency: 1,
            dependsOnTaskId: state.dependsOnTaskId,
            projectId: state.existingProjectId,
            due: state.due,
          );
          await _taskDB.createTask(task);
          emit(state.copyWith(isLoading: true));
        },
      );
    });
  }
}
