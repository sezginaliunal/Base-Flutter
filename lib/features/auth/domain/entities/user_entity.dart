/// User entity for authentication
class UserEntity {
  final String id;
  final String email;
  final String? name;
  final String? surname;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  const UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.surname,
    this.avatarUrl,
    required this.createdAt,
    this.lastLoginAt,
  });

  /// Get full name
  String get fullName {
    if (name != null && surname != null) {
      return '$name $surname';
    } else if (name != null) {
      return name!;
    }
    return email;
  }

  /// Create a copy with updated fields
  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? surname,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          name == other.name &&
          surname == other.surname &&
          avatarUrl == other.avatarUrl &&
          createdAt == other.createdAt &&
          lastLoginAt == other.lastLoginAt;

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      name.hashCode ^
      surname.hashCode ^
      avatarUrl.hashCode ^
      createdAt.hashCode ^
      lastLoginAt.hashCode;

  @override
  String toString() =>
      'UserEntity(id: $id, email: $email, name: $name, surname: $surname)';
}
