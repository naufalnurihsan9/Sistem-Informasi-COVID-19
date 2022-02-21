class ChartModel {
  DateTime key;
  JumlahMeninggal jumlahMeninggal;
  JumlahSembuh jumlahSembuh;
  JumlahPotitif jumlahPotitif;
  JumlahDirawat jumlahDirawat;
  JumlahMeninggalTotal jumlahMeninggaltotal;
  JumlahSembuhTotal jumlahSembuhTotal;
  JumlahPotitifTotal jumlahPotitifTotal;
  JumlahDirawatTotal jumlahDirawatTotal;
  ChartModel(
      {this.key,
      this.jumlahMeninggal,
      this.jumlahSembuh,
      this.jumlahPotitif,
      this.jumlahDirawat,
      this.jumlahMeninggaltotal,
      this.jumlahSembuhTotal,
      this.jumlahPotitifTotal,
      this.jumlahDirawatTotal});

  ChartModel.fromJson(Map<String, dynamic> json) {
    key = DateTime.fromMillisecondsSinceEpoch(json['key']);
    jumlahMeninggal = json['jumlah_meninggal'] != null
        ? new JumlahMeninggal.fromJson(json['jumlah_meninggal'])
        : null;
    jumlahSembuh = json['jumlah_sembuh'] != null
        ? new JumlahSembuh.fromJson(json['jumlah_sembuh'])
        : null;
    jumlahPotitif = json['jumlah_positif'] != null
        ? new JumlahPotitif.fromJson(json['jumlah_positif'])
        : null;
    jumlahDirawat = json['jumlah_dirawat'] != null
        ? new JumlahDirawat.fromJson(json['jumlah_dirawat'])
        : null;

    jumlahMeninggaltotal = json['jumlah_meninggal_kum'] != null
        ? new JumlahMeninggalTotal.fromJson(json['jumlah_meninggal_kum'])
        : null;
    jumlahSembuhTotal = json['jumlah_sembuh_kum'] != null
        ? new JumlahSembuhTotal.fromJson(json['jumlah_sembuh_kum'])
        : null;
    jumlahPotitifTotal = json['jumlah_positif_kum'] != null
        ? new JumlahPotitifTotal.fromJson(json['jumlah_positif_kum'])
        : null;
    jumlahDirawatTotal = json['jumlah_dirawat_kum'] != null
        ? new JumlahDirawatTotal.fromJson(json['jumlah_dirawat_kum'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.jumlahMeninggal != null) {
      data['jumlah_meninggal'] = this.jumlahMeninggal.toJson();
    }

    if (this.jumlahSembuh != null) {
      data['jumlah_sembuh'] = this.jumlahSembuh.toJson();
    }

    if (this.jumlahPotitif != null) {
      data['jumlah_positif'] = this.jumlahPotitif.toJson();
    }

    if (this.jumlahDirawat != null) {
      data['jumlah_dirawat'] = this.jumlahDirawat.toJson();
    }

    if (this.jumlahMeninggaltotal != null) {
      data['jumlah_meninggal_kum'] = this.jumlahMeninggaltotal.toJson();
    }

    if (this.jumlahSembuhTotal != null) {
      data['jumlah_sembuh_kum'] = this.jumlahSembuhTotal.toJson();
    }

    if (this.jumlahPotitifTotal != null) {
      data['jumlah_positif_kum'] = this.jumlahPotitifTotal.toJson();
    }

    if (this.jumlahDirawatTotal != null) {
      data['jumlah_dirawat_kum'] = this.jumlahDirawatTotal.toJson();
    }

    return data;
  }
}

class JumlahMeninggal {
  int value;

  JumlahMeninggal({this.value});

  JumlahMeninggal.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahSembuh {
  int value;

  JumlahSembuh({this.value});

  JumlahSembuh.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahPotitif {
  int value;

  JumlahPotitif({this.value});

  JumlahPotitif.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahDirawat {
  int value;

  JumlahDirawat({this.value});

  JumlahDirawat.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahMeninggalTotal {
  int value;

  JumlahMeninggalTotal({this.value});

  JumlahMeninggalTotal.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahSembuhTotal {
  int value;

  JumlahSembuhTotal({this.value});

  JumlahSembuhTotal.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahPotitifTotal {
  int value;

  JumlahPotitifTotal({this.value});

  JumlahPotitifTotal.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class JumlahDirawatTotal {
  int value;

  JumlahDirawatTotal({this.value});

  JumlahDirawatTotal.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
