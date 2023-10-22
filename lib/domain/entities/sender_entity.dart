// Sender should have name and avatar
class SenderEntity {
  final String name;
  final String avatarAssetPath;
  // id
  final String id;

  SenderEntity({required this.name, required this.avatarAssetPath, String? id})
      : id = id ?? name;
}
