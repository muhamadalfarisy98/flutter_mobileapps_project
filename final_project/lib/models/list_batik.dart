class ListBatik {
  List<Hasil> hasil;

  ListBatik({this.hasil});

  ListBatik.fromJson(Map<String, dynamic> json) {
    if (json['hasil'] != null) {
      hasil = new List<Hasil>();
      json['hasil'].forEach((v) {
        hasil.add(new Hasil.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hasil != null) {
      data['hasil'] = this.hasil.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hasil {
  int id;
  String namaBatik;
  String daerahBatik;
  String maknaBatik;
  int hargaRendah;
  int hargaTinggi;
  int hitungView;
  String linkBatik;

  Hasil(
      {this.id,
      this.namaBatik,
      this.daerahBatik,
      this.maknaBatik,
      this.hargaRendah,
      this.hargaTinggi,
      this.hitungView,
      this.linkBatik});

  Hasil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBatik = json['nama_batik'];
    daerahBatik = json['daerah_batik'];
    maknaBatik = json['makna_batik'];
    hargaRendah = json['harga_rendah'];
    hargaTinggi = json['harga_tinggi'];
    hitungView = json['hitung_view'];
    linkBatik = json['link_batik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_batik'] = this.namaBatik;
    data['daerah_batik'] = this.daerahBatik;
    data['makna_batik'] = this.maknaBatik;
    data['harga_rendah'] = this.hargaRendah;
    data['harga_tinggi'] = this.hargaTinggi;
    data['hitung_view'] = this.hitungView;
    data['link_batik'] = this.linkBatik;
    return data;
  }
}