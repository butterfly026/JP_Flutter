import 'dart:convert';
import 'package:basic_utils/basic_utils.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart' as enc;

// Define your public key
const String publicKey = '-----BEGIN PUBLIC KEY-----\n'
    'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDWUOBXzlw65KrG7JiIM1Wi+k9fdH+ICcJObBcDSroI2pbYiSNW9A5qbrIUmYQp7+Sc+26lWiT3cxtbezqP5Nbvckb40bj2LOjyapGW1Q8h4JW/k90V8LrlNTvxa96UCutatNhfQe4kYpn40Liqm0JULVL6zr+aTkHTyIqN8vAzwQIDAQAB\n'
    '-----END PUBLIC KEY-----\n';

// MD5 hashing function
String md5(String input) {
  return crypto.md5.convert(utf8.encode(input)).toString();
}

// RSA encryption function
Future<String?> encryptRsa(String str) async {
  // final publicKeyParser = rsa.RSAKeyParser();
  // final parsedKey = await publicKeyParser.parse(publicKey);
  // final encrypter = rsa.Encrypter(rsa.RSAEngine());

  // final hashedData = md5(str ?? '');
  // final encryptedData =
  //     encrypter.encrypt(parsedKey, utf8.encode(hashedData)) as rsa.Encrypted;
  var pub = CryptoUtils.rsaPublicKeyFromPem(publicKey);
  final encrypter = enc.Encrypter(enc.RSA(publicKey: pub));
  String bs64AesKey = base64.encode(utf8.encode(str));
  final encryptedAesBytes = encrypter.encrypt(bs64AesKey);

  return encryptedAesBytes.base64;
}

void main() async {
  // Example usage
  // final encrypted = await encryptRsa('Hello, World!');
  // print('Encrypted data: $encrypted');
}
