program blowfish_base64;

{$mode objfpc}{$H+}

uses
  Classes, base64, BlowFish;

var
  s1: TStringStream;
  en: TBlowFishEncryptStream;
begin
  if ParamCount = 0 then begin
    WriteLn('Encrypt a string with Blowfish and encode as base64. Version 1.0');
    WriteLn('github.com/MFernstrom/OffensivePascal-Blowfish-base64');
    WriteLn;
    WriteLn('Usage: blowfish_base64 encryption_key "string_to_encrypt"');
    WriteLn('blowfish_base64.exe test "some payload here"');
    WriteLn('blowfish_base64.exe test singleword');
    Halt(1);
  end;
  s1 := TStringStream.Create('');
  en := TBlowFishEncryptStream.Create(ParamStr(1),s1);
  en.WriteAnsiString(ParamStr(2));
  en.Free;
  WriteLn(EncodeStringBase64(s1.DataString));
end.

