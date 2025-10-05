import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String id; // Firebase UID
  final String? email;
  final String? displayName;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    this.email,
    this.displayName,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [id,email,displayName,avatarUrl];

}
