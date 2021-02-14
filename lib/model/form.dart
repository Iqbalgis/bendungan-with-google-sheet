class FeedbackForm {
  String nama;
  String namabendung;
  String tanggal;
  String jam;
  String limpas;
  String debit;
  String cuaca;
  String status;
  String salsup;
  String curahhujan;
  String kiridibuka;
  String bmakiri;
  String debitdropkiri;
  String tengahdibuka;
  String bmatengah;
  String debitdroptengah;
  String kanandibuka;
  String bmakanan;
  String debitdropkanan;
  String debitlos;

  FeedbackForm(
      this.nama,
      this.namabendung,
      this.tanggal,
      this.jam,
      this.limpas,
      this.debit,
      this.cuaca,
      this.status,
      this.salsup,
      this.curahhujan,
      this.kiridibuka,
      this.bmakiri,
      this.debitdropkiri,
      this.tengahdibuka,
      this.bmatengah,
      this.debitdroptengah,
      this.kanandibuka,
      this.bmakanan,
      this.debitdropkanan,
      this.debitlos);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['nama']}",
        "${json['namabendung']}",
        "${json['tanggal']}",
        "${json['jam']}",
        "${json['limpas']}",
        "${json['debit']}",
        "${json['cuaca']}",
        "${json['status']}",
        "${json['salsup']}",
        "${json['curahhujan']}",
        "${json['kiridibuka']}",
        "${json['bmakiri']}",
        "${json['debitdropkiri']}",
        "${json['tengahdibuka']}",
        "${json['bmatengah']}",
        "${json['debitdroptengah']}",
        "${json['kanandibuka']}",
        "${json['bmakanan']}",
        "${json['debitdropkanan']}",
        "${json['debitlos']}");
  }

  // Method to make GET parameters
  Map toJson() => {
        'nama': nama,
        'namabendung': namabendung,
        'tanggal': tanggal,
        'jam': jam,
        'limpas': limpas,
        'debit': debit,
        'cuaca': cuaca,
        'status': status,
        'salsup': salsup,
        'curahhujan': curahhujan,
        'kiridibuka': kiridibuka,
        'bmakiri': bmakiri,
        'debitdropkiri': debitdropkiri,
        'tengahdibuka': tengahdibuka,
        'bmatengah': bmatengah,
        'debitdroptengah': debitdroptengah,
        'kanandibuka': kanandibuka,
        'bmakanan': bmakanan,
        'debitdropkanan': debitdropkanan,
        'debitlos': debitlos,
      };
}
