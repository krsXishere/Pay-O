String byte =
    "01101000 01110100 01110100 01110000 00111010 00101111 00101111 01101100 01101111 01100011 01100001 01101100 01101000 01101111 01110011 01110100 00111010 00111001 00110000 00110000 00110000";

String encode(String value) {
  return value.codeUnits
      .map(
        (v) => v.toRadixString(2).padLeft(8, '0'),
      )
      .join(" ");
}

String decode(String value) {
  return String.fromCharCodes(
    value.split(" ").map(
          (v) => int.parse(v, radix: 2),
        ),
  );
}

String url = decode(byte);

String signInURL = "$url/login";

String signUpURL = "$url/register";

String getUserURL = "$url/getuser";
