# Registry.pm -- Low-level access to functions/constants from WINREG.h

package Win32API::Registry;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $AUTOLOAD);
$VERSION = '0.12';

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT= qw();
%EXPORT_TAGS= (
    Func =>	[qw(		AllowPriv
	AbortSystemShutdown	InitiateSystemShutdown
	RegCloseKey		RegConnectRegistry	RegCreateKey
	RegCreateKeyEx		RegDeleteKey		RegDeleteValue
	RegEnumKey		RegEnumKeyEx		RegEnumValue
	RegFlushKey		RegGetKeySecurity	RegLoadKey
	RegNotifyChangeKeyValue	RegOpenKey		RegOpenKeyEx
	RegQueryInfoKey		RegQueryMultipleValues	RegQueryValue
	RegQueryValueEx		RegReplaceKey		RegRestoreKey
	RegSaveKey		RegSetKeySecurity	RegSetValue
	RegSetValueEx		RegUnLoadKey )],
    FuncA =>	[qw(
	AbortSystemShutdownA	InitiateSystemShutdownA
	RegConnectRegistryA	RegCreateKeyA		RegCreateKeyExA
	RegDeleteKeyA		RegDeleteValueA		RegEnumKeyA
	RegEnumKeyExA		RegEnumValueA		RegLoadKeyA
	RegOpenKeyA		RegOpenKeyExA		RegQueryInfoKeyA
	RegQueryMultipleValuesA	RegQueryValueA		RegQueryValueExA
	RegReplaceKeyA		RegRestoreKeyA		RegSaveKeyA
	RegSetValueA		RegSetValueExA		RegUnLoadKeyA )],
    FuncW =>	[qw(
	AbortSystemShutdownW	InitiateSystemShutdownW
	RegConnectRegistryW	RegCreateKeyW		RegCreateKeyExW
	RegDeleteKeyW		RegDeleteValueW		RegEnumKeyW
	RegEnumKeyExW		RegEnumValueW		RegLoadKeyW
	RegOpenKeyW		RegOpenKeyExW		RegQueryInfoKeyW
	RegQueryMultipleValuesW	RegQueryValueW		RegQueryValueExW
	RegReplaceKeyW		RegRestoreKeyW		RegSaveKeyW
	RegSetValueW		RegSetValueExW		RegUnLoadKeyW )],
    HKEY_ =>	[qw(
	HKEY_CLASSES_ROOT	HKEY_CURRENT_CONFIG	HKEY_CURRENT_USER
	HKEY_DYN_DATA		HKEY_LOCAL_MACHINE	HKEY_PERFORMANCE_DATA
	HKEY_USERS )],
    KEY_ =>	[qw(
	KEY_QUERY_VALUE		KEY_SET_VALUE		KEY_CREATE_SUB_KEY
	KEY_ENUMERATE_SUB_KEYS	KEY_NOTIFY		KEY_CREATE_LINK
	KEY_READ		KEY_WRITE		KEY_EXECUTE
	KEY_ALL_ACCESS )],
    REG_ =>	[qw(
	REG_OPTION_RESERVED	REG_OPTION_NON_VOLATILE	REG_OPTION_VOLATILE
	REG_OPTION_CREATE_LINK	REG_OPTION_BACKUP_RESTORE
	REG_OPTION_OPEN_LINK	REG_LEGAL_OPTION	REG_CREATED_NEW_KEY
	REG_OPENED_EXISTING_KEY	REG_WHOLE_HIVE_VOLATILE	REG_REFRESH_HIVE
	REG_NO_LAZY_FLUSH	REG_NOTIFY_CHANGE_ATTRIBUTES
	REG_NOTIFY_CHANGE_NAME	REG_NOTIFY_CHANGE_LAST_SET
	REG_NOTIFY_CHANGE_SECURITY			REG_LEGAL_CHANGE_FILTER
	REG_NONE		REG_SZ			REG_EXPAND_SZ
	REG_BINARY		REG_DWORD		REG_DWORD_LITTLE_ENDIAN
	REG_DWORD_BIG_ENDIAN	REG_LINK		REG_MULTI_SZ
	REG_RESOURCE_LIST	REG_FULL_RESOURCE_DESCRIPTOR
	REG_RESOURCE_REQUIREMENTS_LIST )],
);
@EXPORT_OK= ();
{ my $ref;
    foreach $ref (  values(%EXPORT_TAGS)  ) {
	push( @EXPORT_OK, @$ref );
    }
}
$EXPORT_TAGS{ALL}= \@EXPORT_OK;

#######################################################################
# This AUTOLOAD is used to 'autoload' constants from the constant()
# XS function.  If a constant is not found then control is passed
# to the AUTOLOAD in AutoLoader.

sub AUTOLOAD {
    my($constname);
    ($constname = $AUTOLOAD) =~ s/.*:://;
    #reset $! to zero to reset any current errors.
    $!=0;
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
	    my($pack,$file,$line)= caller;
	    die "Your vendor has not defined Win32::Misc macro $constname,",
	        " used at $file line $line.";
	}
    }
    eval "sub $AUTOLOAD { $val }";
    goto &$AUTOLOAD;
}

bootstrap Win32API::Registry $VERSION;

# Preloaded methods go here.

# Replace "&rout;" with "goto &rout;" when that is supported on Win32.

# Let user omit all buffer sizes:
sub RegEnumKeyExA {
    if(  6 == @_  ) {	splice(@_,4,0,[]);  splice(@_,2,0,[]); }
    &_RegEnumKeyExA;
}
sub RegEnumKeyExW {
    if(  6 == @_  ) {	splice(@_,4,0,[]);  splice(@_,2,0,[]); }
    &_RegEnumKeyExW;
}
sub RegEnumValueA {
    if(  6 == @_  ) {	splice(@_,2,0,[]);  push(@_,[]); }
    &_RegEnumValueA;
}
sub RegEnumValueW {
    if(  6 == @_  ) {	splice(@_,2,0,[]);  push(@_,[]); }
    &_RegEnumValueW;
}
sub RegQueryInfoKeyA {
    if(  11 == @_  ) {	splice(@_,2,0,[]); }
    &_RegQueryInfoKeyA;
}
sub RegQueryInfoKeyW {
    if(  11 == @_  ) {	splice(@_,2,0,[]); }
    &_RegQueryInfoKeyW;
}

sub RegGetKeySecurity {
    push(@_,[])   if  3 == @_;
    &_RegGetKeySecurity;
}
sub RegQueryMultipleValuesA {
    push(@_,[])   if  4 == @_;
    &_RegQueryMultipleValuesA;
}
sub RegQueryMultipleValuesW {
    push(@_,[])   if  4 == @_;
    &_RegQueryMultipleValuesW;
}
sub RegQueryValueA {
    push(@_,[])   if  3 == @_;
    &_RegQueryValueA;
}
sub RegQueryValueW {
    push(@_,[])   if  3 == @_;
    &_RegQueryValueW;
}
sub RegQueryValueExA {
    push(@_,[])   if  5 == @_;
    &_RegQueryValueExA;
}
sub RegQueryValueExW {
    push(@_,[])   if  5 == @_;
    &_RegQueryValueExW;
}

sub RegEnumKeyA {
    push(@_,0)   if  3 == @_;
    &_RegEnumKeyA;
}
sub RegEnumKeyW {
    push(@_,0)   if  3 == @_;
    &_RegEnumKeyW;
}
sub RegSetValueA {
    push(@_,0)   if  4 == @_;
    &_RegSetValueA;
}
sub RegSetValueW {
    push(@_,0)   if  4 == @_;
    &_RegSetValueW;
}
sub RegSetValueExA {
    push(@_,0)   if  5 == @_;
    &_RegSetValueExA;
}
sub RegSetValueExW {
    push(@_,0)   if  5 == @_;
    &_RegSetValueExW;
}

# Aliases for non-Unicode functions:
sub AbortSystemShutdown		{ &AbortSystemShutdownA; }
sub InitiateSystemShutdown	{ &InitiateSystemShutdownA; }
sub RegConnectRegistry		{ &RegConnectRegistryA; }
sub RegCreateKey		{ &RegCreateKeyA; }
sub RegCreateKeyEx		{ &RegCreateKeyExA; }
sub RegDeleteKey		{ &RegDeleteKeyA; }
sub RegDeleteValue		{ &RegDeleteValueA; }
sub RegEnumKey			{ &RegEnumKeyA; }
sub RegEnumKeyEx		{ &RegEnumKeyExA; }
sub RegEnumValue		{ &RegEnumValueA; }
sub RegLoadKey			{ &RegLoadKeyA; }
sub RegOpenKey			{ &RegOpenKeyA; }
sub RegOpenKeyEx		{ &RegOpenKeyExA; }
sub RegQueryInfoKey		{ &RegQueryInfoKeyA; }
sub RegQueryMultipleValues	{ &RegQueryMultipleValuesA; }
sub RegQueryValue		{ &RegQueryValueA; }
sub RegQueryValueEx		{ &RegQueryValueExA; }
sub RegReplaceKey		{ &RegReplaceKeyA; }
sub RegRestoreKey		{ &RegRestoreKeyA; }
sub RegSaveKey			{ &RegSaveKeyA; }
sub RegSetValue			{ &RegSetValueA; }
sub RegSetValueEx		{ &RegSetValueExA; }
sub RegUnLoadKey		{ &RegUnLoadKeyA; }

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

Win32API::Registry - Low-level access to Win32 system API calls from WINREG.H

=head1 SYNOPSIS

  use Win32API::Registry 0.10 qw( :ALL );

  RegOpenKeyEx( HKEY_LOCAL_MACHINE, "SYSTEM\\Disk", 0, KEY_READ, $key );
    or  die "Can't open HKEY_LOCAL_MACHINE\\SYSTEM\\Disk: $^E\n";
  RegQueryValueEx( $key, "Information", [], $type, $data, [] );
    or  die "Can't read HKEY_L*MACHINE\\SYSTEM\\Disk\\Information: $^E\n";
  [...]
  RegCloseKey( $key )
    and  die "Can't close HKEY_LOCAL_MACHINE\\SYSTEM\\Disk: $^E\n";

=head1 DESCRIPTION

This provides fairly low-level access to the Win32 System API
calls dealing with the Registry (mostly from WINREG.H).  This is
mostly intended for use by Tie::Registry(3), which provides an
extremely Perl-friendly method for using the Registry.  

To pass in C<NULL> as the pointer to an optional buffer, pass in
an empty list reference, C<[]>.

Beyond raw access to the API calls and related constants, this module
handles smart buffer allocation and translation of return codes.

All calls return a true value for success and a false value for
failure.  After any failure, C<$^E> should automatically be set to
indicate the reason.  If you have a version of Perl that does not
yet connect C<$^E> to C<GetLastError()> under Win32, then you can
use C<$dwError= Win32::GetLastError()> to get the numeric error
code and pass that to C<Win32::FormatMessage($dwError)> to to get
the descriptive string, or just
C<Win32::FormatMessage(Win32::GetLastError())>.  Note that C<$!>
is not set by these routines except by C<Win32API::constant()>
when a constant is not defined.

=head2 Buffer sizes

For each argument that specifies a buffer size, a value of C<0> can be
passed.  For arguments that are pointers to buffer sizes, you can also
pass in C<NULL> by specifying an empty list reference, C<[]>.  Both of
these cases will ensure that the variable has E<some> buffer allocated
for it and pass in that buffer's allocated size.  All of the calls should
indicate, via C<ERROR_MORE_DATA>, that the buffer size was not sufficient
and the F<Registry.xs> code will automatically enlarge the buffer to the
required size and repeat the call.

Positive buffer sizes are used as minimum initial sizes for the
buffers.  The larger of this size and the size of space already
allocated to the scalar will be passed to the underlying routine. 
If that size was insufficient, then the buffer will be enlarged
and the call repeated as above.

The underlying calls define buffer size arguments as unsigned, so
negative buffer sizes are currently treated as very large positive
buffer sizes which usually cause C<malloc()> to fail.  This will
probably change in a future version so that negative buffer sizes
will disable automatic buffer growing.

Some Reg*() calls may not currently set the buffer size when they
return C<ERROR_MORE_DATA>.  But some that are not documented as
doing so, do so anyway.  So the code assumes that any routine
E<might> do this and resizes any buffers and repeats the call. 
We hope that eventually all routines will provide this feature.

When you use C<[]> for a buffer size, you can still find the
length of the data returned by using C<length($buffer)>.  Note
that this length will be in bytes while a few of the buffer sizes
would have been in units of wide characters.

Note that C<RegQueryValueExA()> and C<RegEnumValueA()> [and
hence C<RegQueryValueEx()> and C<RegEnumValue()>] know how to
trim the trailing C<'\0'> from data values of type C<REG_SZ> and
C<REG_EXPAND_EZ>.  C<RegQueryValueA()> and C<RegQueryValue()>
cannot realibly tell when to do this and so never do.  This is
just one more reason not to use these deprecated calls.

=head2 Exports

Nothing is exported by default.  The following tags can be used to have
large sets of symbols exported:

=over

=item :Func

The basic function names.

=item :FuncA

The ASCI-specific function names.

=item :FuncW

The UNICODE-specific function names.

=item :HKEY_

All C<HKEY_*> constants.

=item :KEY_

All C<KEY_*> constants.

=item :REG_

All C<REG_*> constants.

=item :ALL

All of the above.

=back

=head1 BUGS

The ActiveState ports of Perl for Win32 do not support the tools
for building extensions and so do not support this extension. 
Suggestions on how to build this extension for use with the
ActiveState ports are welcome.

There is not yet any way to prevent buffers from being automatically
enlarged [other than passing in C<[]> for that buffer].

No routines are provided for using the data returned in the C<FILETIME>
buffers.  Those will be in Win32API::File(3) when it becomes available.

No routines are provided for dealing with UNICODE data effectively.
Such are available elsewhere.

Parts of the module test will fail if used on a version of Perl that
does not yet set C<$^E> based on C<GetLastError()>.

On NT 4.0 (at least), the RegEnum* calls do not set the required
buffer sizes when returning C<ERROR_MORE_DATA> so this module will
not grow the buffers in such cases.  L<Tie::Registry(3)> overcomes
this by using values from C<RegQueryInfoKey()> for buffer sizes in
RegEnum* calls.

On NT 4.0 (at least), C<RegQueryInfoKey()> on C<HKEY_PERFORMANCE_DATA>
never succeeds.  Also, C<RegQueryValueEx()> on C<HKEY_PERFORMANCE_DATA>
never returns the required buffer size.  To access C<HKEY_PERFORMANCE_DATA>
you will need to keep growing the data buffer until the call succeeds.

=head1 AUTHOR

Tye McQueen, tye@metronet.com, http://www.metronet.com/~tye/.

=head1 SEE ALSO

Tie::Registry(3)

=cut
