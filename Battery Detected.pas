{COPYRIGHT 2021 BY @lni-patrick}
{Pascal N IDE}
{Date:16-2-2021}
{Note: Jika info Jenis Baterai Tidak sesuai Silahkan hubungi Patrick Untuk memperbaikinya}
uses aBattery, crt;
var
  status, health, level : Integer;
  plugType : Integer;
  tech : string;
  vol : Integer;
  temp : Integer;

procedure printStatus(i : Integer);
begin
  {menampilkan status data:
  1 - unknown;
  2 - charging;
  3 - discharging;
  4 - not charging;
  5 - full;}
  writeln('  ╔══════════════╗');
  writeln('  ║╔════════════╗╚╗');
  writeln('  ║║██░░░░░░░░░░╚╗╚╗');
  writeln('  ║║██Baterai info░║');
  writeln('  ║║██░░░░░░░░░░╔╝╔╝');
  writeln('  ║╚════════════╝╔╝');
  writeln('  ╚══════════════╝');
  write('[Tekan Enter Untuk menampilkan info Baterai]');readln();
  writeln('');
  write('Status Baterai: ');
  case i of
    1 : writeln('unknown');
    2 : writeln('Baterai Sedang Diisi');
    3 : writeln('Baterai Sedang Dipakai');
    4 : writeln('not charging');
    5 : writeln('full');
  end;
end;

procedure printHealth(i : integer);
begin
  {Returns the most recently received battery health data:
  1 - unknown;
  2 - good;
  3 - overheat;
  4 - dead;
  5 - over voltage;
  6 - unspecified failure;}
  case i of
    1 : writeln('unknown');
    2 : writeln('Powered');
    3 : writeln('overheat');
    4 : writeln('not dead');
    5 : writeln('over voltage');
    6 : writeln('unspecified failure');
  end;
end;

procedure printPlugType(i : Integer);
begin
  {Returns the most recently received plug type data:
  -1 - unknown
  0 - unplugged;
  1 - power items is an AC charger
  2 - power items is a USB port
  }
  case i of
    -1 : writeln('unknown');
    0 : writeln('unplugged');
    1 : writeln('power source is an AC charger');
    2 : writeln('power source is a USB port');
  end;
end;

procedure printLevel(i : Integer);
begin
  writeln('Persentase Baterai(percentage): [', i, ' %]');
  writeln('');
end;

procedure printTechnology(tech : string);
begin
  writeln('Jenis Baterai: [', tech,']');
  writeln('');
end;

procedure printVoltage(vol : Integer);
begin
  writeln('Voltage listrik: ', vol);
  writeln('');
end;

procedure printTemp(temp : Integer);
begin
  writeln('Temperatur Baterai: ', temp,'°');
  writeln('');
end;

begin
  {Start monitor}
  writeln('[Source Code di github.com/Ini-patrick]');
  batteryStartMonitoring;
  {Enter & Tunggu 1 detik untuk menampilkan info}
  delay(1000);

  status := batteryGetStatus;
  printStatus(status);
  delay(1000);
  health := batteryGetHealth;
  printHealth(health);
  delay(1000);
  level := batteryGetLevel;
  printLevel(level);
  delay(1000);
  plugType := batteryGetPlugType;
  printPlugType(plugType);
  delay(1000);
  tech := batteryGetTechnology;
  printTechnology(tech);
  delay(1000);
  temp := batteryGetTemperature;
  printTemp(temp);
  delay(1000);
  vol := batteryGetVoltage;
  printVoltage(vol);
  delay(1000);
  {stop}
  batteryStopMonitoring;
  readln;
end.
