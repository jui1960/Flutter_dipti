import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_view_model.dart';

class NoteHomePage extends StatelessWidget {
  const NoteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteVM = Provider.of<NoteViewModel>(context);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("My Notes")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter note here...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                noteVM.addNote(controller.text);
                controller.clear();
              },
              child: const Text("Add Note"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: noteVM.notes.isEmpty
                  ? const Center(child: Text("No notes yet"))
                  : ListView.builder(
                itemCount: noteVM.notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(noteVM.notes[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final editController = TextEditingController(
                                      text: noteVM.notes[index]);
                                  return AlertDialog(
                                    title: const Text("EDIT NOTE"),
                                    content: TextField(
                                      controller: editController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("CANCEL"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          noteVM.updateNoteAt(index, editController.text);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("SAVE",),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => noteVM.deleteNoteAt(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}