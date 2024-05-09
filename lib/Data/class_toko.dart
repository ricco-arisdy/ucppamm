class Toko {
  final String id;
  final String namaToko;
  final String alamat;
  final String noTelp;
  final String kesan;

  Toko({
    required this.id,
    required this.namaToko,
    required this.alamat,
    required this.noTelp,
    required this.kesan,
  });

  factory Toko.fromJson(Map<String, dynamic> json) {
    return Toko(
      id: json['id'],
      namaToko: json['nama_toko'],
      alamat: json['alamat'],
      noTelp: json['notelp'],
      kesan: json['kesan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_toko': namaToko,
      'alamat': alamat,
      'notelp': noTelp,
      'kesan': kesan,
    };
  }
}
