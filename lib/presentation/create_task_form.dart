import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskwarrior/bloc/create_task_bloc.dart';
import 'package:taskwarrior/database/database.dart';

class CreateTaskForm extends StatelessWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTaskBloc(
        context.read<TaskDatabase>(),
      ),
      child: const _BuildForm(),
    );
  }
}

class _BuildForm extends StatelessWidget {
  const _BuildForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 18.0,
          ),
          children: [
            const _DescriptionFormField(),
            const _TagFormField(),
            const _ProjectFormField(),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.timer, color: Colors.grey),
                _DueDatePicker(),
                _DueDateTime(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.done),
        onPressed: () {
          final validated = _formkey.currentState!.validate();
          if (validated == true) {
            context.read<CreateTaskBloc>().add(const CreateTaskEvent.created());
          }
        },
      ),
    );
  }
}

class _DueDateTime extends StatelessWidget {
  const _DueDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final due = context.select((CreateTaskBloc bloc) => bloc.state.due);
    return Container(
      child: due == null
          ? null
          : Text(
              'Deadline: ${due.month}/${due.day}/${due.year} at ${due.hour}:${due.minute <= 9 ? '0' '${due.minute}' : due.minute}',
            ),
    );
  }
}

class _DueDatePicker extends StatelessWidget {
  const _DueDatePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('Pick due time'),
      onPressed: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          final pickedTime = await showTimePicker(
            context: context,
            initialTime: const TimeOfDay(
              hour: 0,
              minute: 0,
            ),
          );
          if (pickedTime != null) {
            final pickedDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            context
                .read<CreateTaskBloc>()
                .add(CreateTaskEvent.dueChanged(pickedDateTime));
          }
        }
      },
    );
  }
}

class _ProjectFormField extends StatelessWidget {
  const _ProjectFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Project',
        icon: Icon(Icons.work_outline),
      ),
      onChanged: (newProjectName) => context
          .read<CreateTaskBloc>()
          .add(CreateTaskEvent.newProjectNameChanged(newProjectName)),
    );
  }
}

class _TagFormField extends StatelessWidget {
  const _TagFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Tag',
        icon: Icon(Icons.tag),
      ),
      onChanged: (tag) =>
          context.read<CreateTaskBloc>().add(CreateTaskEvent.tagChanged(tag)),
    );
  }
}

class _DescriptionFormField extends StatelessWidget {
  const _DescriptionFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionValidationErrorMsg = context.select(
        (CreateTaskBloc bloc) => bloc.state.descriptionValidationErrorMsg);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: 3,
      maxLines: null,
      decoration: const InputDecoration(
        labelText: 'Description',
        icon: Icon(Icons.text_fields),
      ),
      onChanged: (description) => context
          .read<CreateTaskBloc>()
          .add(CreateTaskEvent.descriptionChanged(description)),
      validator: (_) => descriptionValidationErrorMsg,
    );
  }
}
