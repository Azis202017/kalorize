
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? gym;
    String? kodeGym;
    int? beratBadan;
    String? email;
    String? firstName;
    String? foto;
    int? frekuensiGym;
    String? idUser;
    int? jenisKelamin;
    String? lastName;
    String? noTelepon;
    String? role;
    int? targetKalori;
    int? tinggiBadan;
    int? umur;

    UserModel({
        this.gym,
        this.kodeGym,
        this.beratBadan,
        this.email,
        this.firstName,
        this.foto,
        this.frekuensiGym,
        this.idUser,
        this.jenisKelamin,
        this.lastName,
        this.noTelepon,
        this.role,
        this.targetKalori,
        this.tinggiBadan,
        this.umur,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        gym: json["Gym"],
        kodeGym: json["KodeGym"],
        beratBadan: json["beratBadan"],
        email: json["email"],
        firstName: json["firstName"],
        foto: json["foto"],
        frekuensiGym: json["frekuensiGym"],
        idUser: json["idUser"],
        jenisKelamin: json["jenisKelamin"],
        lastName: json["lastName"],
        noTelepon: json["noTelepon"],
        role: json["role"],
        targetKalori: json["targetKalori"],
        tinggiBadan: json["tinggiBadan"],
        umur: json["umur"],
    );

    Map<String, dynamic> toJson() => {
        "Gym": gym,
        "KodeGym": kodeGym,
        "beratBadan": beratBadan,
        "email": email,
        "firstName": firstName,
        "foto": foto,
        "frekuensiGym": frekuensiGym,
        "idUser": idUser,
        "jenisKelamin": jenisKelamin,
        "lastName": lastName,
        "noTelepon": noTelepon,
        "role": role,
        "targetKalori": targetKalori,
        "tinggiBadan": tinggiBadan,
        "umur": umur,
    };
}
