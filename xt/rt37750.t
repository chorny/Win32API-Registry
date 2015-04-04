
use Test::More qw/no_plan/;
use strict;
use Win32API::Registry qw( :ALL );
#use Win32::TieRegistry;
my $hkey = HKEY_CURRENT_USER;
my $name = 'Software\\Perl\\test\\';


my $k;
RegOpenKeyEx( $hkey, $name, 0, KEY_SET_VALUE, $k )
  or  die "Can't open HKEY_LOCAL_MACHINE\\SYSTEM\\Disk: ",
          regLastError();
RegSetValueEx($k, 'zero_value', 0, Win32API::Registry::REG_SZ(), '')
  or die $^E;
RegCloseKey( $k );


RegOpenKeyEx( $hkey, $name, 0, KEY_READ, $k )
  or  die "Can't open HKEY_LOCAL_MACHINE\\SYSTEM\\Disk: ",
          regLastError();
my ($type, $data);
RegQueryValueEx( $k, "zero_value", [], $type, $data, [] )
  or  die "Can't read zero_value: ",
          regLastError();
print '#'; #should be separate print or error would not appear
print "$data\n";
ok(1);
