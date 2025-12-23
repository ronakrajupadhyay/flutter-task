import 'dart:io';

void main() {
  List<Map<String, String>> contacts = [];
  Set<String> phoneNumbers = {}; // to avoid duplicates

  bool running = true;

  while (running) {
    print("\n📒 Contact Book Menu");
    print("1. Add Contact");
    print("2. View Contacts");
    print("3. Search Contact");
    print("4. Delete Contact");
    print("5. Exit");

    print("Enter your choice:");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addContact(contacts, phoneNumbers);
        break;

      case 2:
        viewContacts(contacts);
        break;

      case 3:
        searchContact(contacts);
        break;

      case 4:
        deleteContact(contacts, phoneNumbers);
        break;

      case 5:
        running = false;
        print("👋 Exiting Contact Book");
        break;

      default:
        print("❌ Invalid choice");
    }
  }
}
void addContact(List<Map<String, String>> contacts, Set<String> phoneNumbers) {
  print("Enter name:");
  String name = stdin.readLineSync()!;

  print("Enter phone:");
  String phone = stdin.readLineSync()!;

  if (phoneNumbers.contains(phone)) {
    print("⚠️ Phone number already exists!");
    return;
  }

  print("Enter email:");
  String email = stdin.readLineSync()!;

  contacts.add({
    "name": name,
    "phone": phone,
    "email": email,
  });

  phoneNumbers.add(phone);

  print("✅ Contact added successfully");
}
void viewContacts(List<Map<String, String>> contacts) {
  if (contacts.isEmpty) {
    print("No contacts found");
    return;
  }

  contacts.forEach((contact) {
    print(
        "Name: ${contact['name']} | Phone: ${contact['phone']} | Email: ${contact['email']}");
  });
}
void searchContact(List<Map<String, String>> contacts) {
  print("Enter name to search:");
  String searchName = stdin.readLineSync()!;

  var result = contacts.where((contact) =>
      contact['name']!.toLowerCase().contains(searchName.toLowerCase()));

  if (result.isEmpty) {
    print("❌ Contact not found");
  } else {
    result.forEach((contact) {
      print(
          "Name: ${contact['name']} | Phone: ${contact['phone']} | Email: ${contact['email']}");
    });
  }
}
void deleteContact(
    List<Map<String, String>> contacts, Set<String> phoneNumbers) {
  print("Enter phone number to delete:");
  String phone = stdin.readLineSync()!;

  contacts.removeWhere((contact) {
    if (contact['phone'] == phone) {
      phoneNumbers.remove(phone);
      return true;
    }
    return false;
  });

  print("🗑 Contact deleted (if existed)");
}
