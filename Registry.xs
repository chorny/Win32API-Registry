/* Win32API/Registry.xs */

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#define  WIN32_LEAN_AND_MEAN	/* Tell windows.h to skip much */
#include <windows.h>
#ifdef __cplusplus
#include <malloc.h>
}
#endif


#ifndef DEBUGGING
# define	Debug(list)	/*Nothing*/
#else
# define	Debug(list)	ErrPrintf list
# include <stdarg.h>
    static void
    ErrPrintf( const char *fmt, ... )
    {
      va_list alist;
      static char *env= NULL;
      DWORD dwErr= GetLastError();
	if(  NULL == env  ) {
	    if(  NULL == ( env= getenv("DEBUG_WIN32API_REGISTRY") )  )
		env= "";
	}
	if(  '\0' == *env  )
	    return;
	va_start( alist, fmt );
	vfprintf( stderr, fmt, alist );
	va_end( alist );
	SetLastError( dwErr );
    }
#endif /* DEBUGGING */


DWORD
constant( char *name, int arg )
{
    errno= 0;
    if(  '\0' == name[0]  ||  '\0' == name[1]
     ||  '\0' == name[2]  ||  '\0' == name[3]  ) {
	;
    } else switch(  name[4]  ) {
	case 's':
	    if(  strEQ(name,"constant")  )
		break;	/* Prevent infinite recursion for some typos */
	    break;
	case '_':
	    if(  strEQ( name, "HKEY_CLASSES_ROOT" )  )
#ifdef HKEY_CLASSES_ROOT
		return (DWORD)HKEY_CLASSES_ROOT;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "HKEY_CURRENT_CONFIG" )  )
#ifdef HKEY_CURRENT_CONFIG
		return (DWORD)HKEY_CURRENT_CONFIG;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "HKEY_CURRENT_USER" )  )
#ifdef HKEY_CURRENT_USER
		return (DWORD)HKEY_CURRENT_USER;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "HKEY_DYN_DATA" )  )
#ifdef HKEY_DYN_DATA
		return (DWORD)HKEY_DYN_DATA;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "HKEY_LOCAL_MACHINE" )  )
#ifdef HKEY_LOCAL_MACHINE
		return (DWORD)HKEY_LOCAL_MACHINE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "HKEY_PERFORMANCE_DATA" )  )
#ifdef HKEY_PERFORMANCE_DATA
		return (DWORD)HKEY_PERFORMANCE_DATA;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "HKEY_USERS" )  )
#ifdef HKEY_USERS
		return (DWORD)HKEY_USERS;
#else
		goto not_there;
#endif
	    break;
	case 'A':
	    if(  strEQ( name, "KEY_ALL_ACCESS" )  )
#ifdef KEY_ALL_ACCESS
		return (DWORD)KEY_ALL_ACCESS;
#else
		goto not_there;
#endif
	    break;
	case 'B':
	    if(  strEQ( name, "REG_BINARY" )  )
#ifdef REG_BINARY
		return REG_BINARY;
#else
		goto not_there;
#endif
	    break;
	case 'C':
	    if(  strEQ( name, "KEY_CREATE_LINK" )  )
#ifdef KEY_CREATE_LINK
		return KEY_CREATE_LINK;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "KEY_CREATE_LINK" )  )
#ifdef KEY_CREATE_LINK
		return KEY_CREATE_LINK;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "KEY_CREATE_SUB_KEY" )  )
#ifdef KEY_CREATE_SUB_KEY
		return KEY_CREATE_SUB_KEY;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_CREATED_NEW_KEY" )  )
#ifdef REG_CREATED_NEW_KEY
		return REG_CREATED_NEW_KEY;
#else
		goto not_there;
#endif
	    break;
	case 'D':
	    if(  strEQ( name, "REG_DWORD" )  )
#ifdef REG_DWORD
		return REG_DWORD;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_DWORD_BIG_ENDIAN" )  )
#ifdef REG_DWORD_BIG_ENDIAN
		return REG_DWORD_BIG_ENDIAN;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_DWORD_LITTLE_ENDIAN" )  )
#ifdef REG_DWORD_LITTLE_ENDIAN
		return REG_DWORD_LITTLE_ENDIAN;
#else
		goto not_there;
#endif
	    break;
	case 'E':
	    if(  strEQ( name, "KEY_ENUMERATE_SUB_KEYS" )  )
#ifdef KEY_ENUMERATE_SUB_KEYS
		return KEY_ENUMERATE_SUB_KEYS;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "KEY_EXECUTE" )  )
#ifdef KEY_EXECUTE
		return KEY_EXECUTE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_EXPAND_SZ" )  )
#ifdef REG_EXPAND_SZ
		return REG_EXPAND_SZ;
#else
		goto not_there;
#endif
	    break;
	case 'F':
	    if(  strEQ( name, "REG_FULL_RESOURCE_DESCRIPTOR" )  )
#ifdef REG_FULL_RESOURCE_DESCRIPTOR
		return REG_FULL_RESOURCE_DESCRIPTOR;
#else
		goto not_there;
#endif
	    break;
	case 'G':
	    break;
	case 'H':
	    break;
	case 'I':
	    break;
	case 'J':
	    break;
	case 'K':
	    break;
	case 'L':
	    if(  strEQ( name, "REG_LEGAL_CHANGE_FILTER" )  )
#ifdef REG_LEGAL_CHANGE_FILTER
		return REG_LEGAL_CHANGE_FILTER;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_LEGAL_OPTION" )  )
#ifdef REG_LEGAL_OPTION
		return REG_LEGAL_OPTION;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_LINK" )  )
#ifdef REG_LINK
		return REG_LINK;
#else
		goto not_there;
#endif
	    break;
	case 'M':
	    if(  strEQ( name, "REG_MULTI_SZ" )  )
#ifdef REG_MULTI_SZ
		return REG_MULTI_SZ;
#else
		goto not_there;
#endif
	    break;
	case 'N':
	    if(  strEQ( name, "KEY_NOTIFY" )  )
#ifdef KEY_NOTIFY
		return KEY_NOTIFY;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_NO_LAZY_FLUSH" )  )
#ifdef REG_NO_LAZY_FLUSH
		return REG_NO_LAZY_FLUSH;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_NONE" )  )
#ifdef REG_NONE
		return REG_NONE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_NOTIFY_CHANGE_ATTRIBUTES" )  )
#ifdef REG_NOTIFY_CHANGE_ATTRIBUTES
		return REG_NOTIFY_CHANGE_ATTRIBUTES;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_NOTIFY_CHANGE_LAST_SET" )  )
#ifdef REG_NOTIFY_CHANGE_LAST_SET
		return REG_NOTIFY_CHANGE_LAST_SET;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_NOTIFY_CHANGE_NAME" )  )
#ifdef REG_NOTIFY_CHANGE_NAME
		return REG_NOTIFY_CHANGE_NAME;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_NOTIFY_CHANGE_SECURITY" )  )
#ifdef REG_NOTIFY_CHANGE_SECURITY
		return REG_NOTIFY_CHANGE_SECURITY;
#else
		goto not_there;
#endif
	    break;
	case 'O':
	    if(  strEQ( name, "REG_OPENED_EXISTING_KEY" )  )
#ifdef REG_OPENED_EXISTING_KEY
		return REG_OPENED_EXISTING_KEY;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_OPTION_BACKUP_RESTORE" )  )
#ifdef REG_OPTION_BACKUP_RESTORE
		return REG_OPTION_BACKUP_RESTORE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_OPTION_CREATE_LINK" )  )
#ifdef REG_OPTION_CREATE_LINK
		return REG_OPTION_CREATE_LINK;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_OPTION_NON_VOLATILE" )  )
#ifdef REG_OPTION_NON_VOLATILE
		return REG_OPTION_NON_VOLATILE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_OPTION_OPEN_LINK" )  )
#ifdef REG_OPTION_OPEN_LINK
		return REG_OPTION_OPEN_LINK;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_OPTION_RESERVED" )  )
#ifdef REG_OPTION_RESERVED
		return REG_OPTION_RESERVED;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_OPTION_VOLATILE" )  )
#ifdef REG_OPTION_VOLATILE
		return REG_OPTION_VOLATILE;
#else
		goto not_there;
#endif
	    break;
	case 'P':
	    break;
	case 'Q':
	    if(  strEQ( name, "KEY_QUERY_VALUE" )  )
#ifdef KEY_QUERY_VALUE
		return KEY_QUERY_VALUE;
#else
		goto not_there;
#endif
	    break;
	case 'R':
	    if(  strEQ( name, "KEY_READ" )  )
#ifdef KEY_READ
		return KEY_READ;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_REFRESH_HIVE" )  )
#ifdef REG_REFRESH_HIVE
		return REG_REFRESH_HIVE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_RESOURCE_LIST" )  )
#ifdef REG_RESOURCE_LIST
		return REG_RESOURCE_LIST;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_RESOURCE_REQUIREMENTS_LIST" )  )
#ifdef REG_RESOURCE_REQUIREMENTS_LIST
		return REG_RESOURCE_REQUIREMENTS_LIST;
#else
		goto not_there;
#endif
	    break;
	case 'S':
	    if(  strEQ( name, "KEY_SET_VALUE" )  )
#ifdef KEY_SET_VALUE
		return KEY_SET_VALUE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_SZ" )  )
#ifdef REG_SZ
		return REG_SZ;
#else
		goto not_there;
#endif
	    break;
	case 'T':
	    break;
	case 'U':
	    break;
	 case 'V':
	    break;
	 case 'W':
	    if(  strEQ( name, "KEY_WRITE" )  )
#ifdef KEY_WRITE
		return KEY_WRITE;
#else
		goto not_there;
#endif
	    if(  strEQ( name, "REG_WHOLE_HIVE_VOLATILE" )  )
#ifdef REG_WHOLE_HIVE_VOLATILE
		return REG_WHOLE_HIVE_VOLATILE;
#else
		goto not_there;
#endif
	    break;
	 case 'X':
	    break;
	 case 'Y':
	    break;
	 case 'Z':
	    break;
    }
    errno = EINVAL;
    return 0;
not_there:
    errno = ENOENT;
    return 0;
}


static LONG
ErrorRet( DWORD dwErr )
{
    if(  ERROR_SUCCESS == dwErr  )
	return( TRUE );
    SetLastError( dwErr );
    /* if(  ERROR_INSUFFICIENT_BUFFER == dwErr  )
	return( TRUE );
    */
    return FALSE;
}


/* Buffer arguments are usually followed by an argument specifying their size.
 * The size can be measured in bytes ("cbSize") or in characters ("cwSize")
 * [the latter only being different for WCHAR buffers].
 * The size sometimes does and sometimes doesn't include the trailing '\0'
 * (or L'\0'), so we always add or substract 1 in the appropriate places so
 * we don't care about this detail.
 * A call may  1) request a pointer to the buffer size which means that the
 * buffer size will be overwritten with the size of the data written;
 * 2) have an extra argument which is a pointer to the place to write the
 * size of the written data;  or  3) provide the size of the written data
 * in the functions return value.
 * The user can pass in an empty list reference, `[]', to indicate NULL for
 * the pointer to the buffer which means that they don't want that data.
 * The user can pass in `[]' or `0' to indicate that they don't care about
 * the buffer size [we aren't programming in C here, after all] and just make
 * sure they get the data.
 *
 * Before calling the actual C function, you must make sure the Perl variable
 * actually has a big enough buffer allocated, and, if the user didn't want
 * to specify a buffer size, set the buffer size to be correct.
 *
 * Once the actual C function returns, you must set the Perl variable to know
 * the size of the written data.
 *
 * If the buffer was too small (ERROR_MORE_DATA) and the data size is handy,
 * then just grow the buffer and repeat the call.
 *
 * The following macros do most of these items:
 */


/* Is an argument `[]', meaning we should pass `NULL'? */
#define null_arg(a)	(  SvROK(a)  &&  SVt_PVAV == SvTYPE(SvRV(a))	\
			   &&  -1 == av_len((AV*)SvRV(a))  )

/* Minimum buffer size to use on first call: */
#define MIN_GROW_SIZE	8

/* Used in Debug() messages to show which macro call is involved: */
#define string(arg) #arg

/* Slightly simplify using SvGROW() for byte-sized buffers: */
#define bSvGROW(sv,n)	(void *) SvGROW( sv, (n)+1 )

/* Simplify using SvGROW() for WCHAR-sized buffers: */
#define wSvGROW(sv,n)	(WCHAR *) SvGROW( sv, ((n)+1)*sizeof(WCHAR) )

/* Grow a buffer that takes a pointer to its size in bytes: */
#define	grow_buf_pcb( sBuf,svBuf, pcbSize )	do {			\
	Debug(( "grow_buf_pcb( %s,[%s, %s ); 0x%lX==0x%lX %ld\n",	\
	  string(sBuf), strchr(string(svBuf),'('), string(pcbSize),	\
	  sBuf, SvPVX(svBuf), pcbSize ? *pcbSize : -10 ));		\
	if(  ! null_arg(svBuf)  ) {					\
	    if(  NULL == pcbSize  )					\
		*( pcbSize= (DWORD *) _alloca( sizeof(DWORD) ) )= 0;	\
	    if(  ! SvOK(svBuf)  )    sv_setpvn(svBuf,"",0);		\
	    sBuf= (void *) SvPV_force( svBuf, na );			\
	    Debug(( "`%s' 0x%lX==0x%lX %ld of %ld\n", sBuf,		\
	      sBuf, SvPVX(svBuf), SvCUR(svBuf), SvLEN(svBuf) ));	\
	    if(  0 == *pcbSize  )					\
		*pcbSize= MIN_GROW_SIZE;				\
	    sBuf= bSvGROW( svBuf, *pcbSize );				\
	    *pcbSize= SvLEN(svBuf) - 1;					\
	    Debug(( "New sBuf=0x%lX, new *pcbSize=%ld\n",		\
		    sBuf, *pcbSize ));					\
	}								\
    } while( FALSE )

/* Grow a buffer that takes a pointer to its size in WCHARs: */
#define	grow_buf_pcw( sBuf,svBuf, pcwSize )	do {			\
	Debug(( "grow_buf_pcw( %s,[%s, %s ); 0x%lX==0x%lX %ld\n",	\
	  string(sBuf), strchr(string(svBuf),'('), string(pcwSize),	\
	  sBuf, SvPVX(svBuf), pcwSize ? *pcwSize : -10 ));		\
	if(  ! null_arg(svBuf)  ) {					\
	    if(  NULL == pcwSize  )					\
		*( pcwSize= (DWORD *) _alloca( sizeof(DWORD) ) )= 0;	\
	    if(  ! SvOK(svBuf)  )    sv_setpvn(svBuf,"",0);		\
	    sBuf= (WCHAR *) SvPV_force( svBuf, na );			\
	    Debug(( "`%ls' 0x%lX==0x%lX %ld of %ld\n", sBuf,		\
	      sBuf, SvPVX(svBuf), SvCUR(svBuf), SvLEN(svBuf) ));	\
	    if(  0 == *pcwSize  )					\
		*pcwSize= MIN_GROW_SIZE;				\
	    sBuf= wSvGROW( svBuf, *pcwSize );				\
	    *pcwSize= SvLEN(svBuf)/sizeof(WCHAR) - 1;			\
	    Debug(( "New sBuf=0x%lX, new *pcwSize=%ld\n",		\
		    sBuf, *pcwSize ));					\
	}								\
    } while( FALSE )

/* Grow a buffer to a fixed data type: */
#define	grow_buf_typ( pBuf,svBuf, Type )	do {			\
	Debug(( "grow_buf_typ( %s,[%s, %s ); 0x%lX==0x%lX %ld\n",	\
	  string(pBuf), strchr(string(svBuf),'('), string(Type),	\
	  pBuf, SvPVX(svBuf), sizeof(Type) ));				\
	if(  ! null_arg(svBuf)  ) {					\
	    if(  ! SvOK(svBuf)  )    sv_setpvn(svBuf,"",0);		\
	    (void) SvPV_force( svBuf, na );				\
	    pBuf= (Type *) SvGROW( svBuf, sizeof(Type) );		\
	    Debug(( "0x%lX==0x%lX %ld of %ld\n",			\
	      pBuf, SvPVX(svBuf), SvCUR(svBuf), SvLEN(svBuf) ));	\
	}								\
    } while( FALSE )

/* Set data size for a buffer that takes a pointer to its size in bytes: */
#define	trunc_buf_pcb( sBuf,svBuf, pcbSize )	do {			\
	Debug(( "trunc_buf_pcb( %s,[%s, %s ); 0x%lX==0x%lX, %ld\n",	\
	  string(sBuf), strchr(string(svBuf),'('), string(pcbSize),	\
	  sBuf, SvPVX(svBuf), pcbSize ? *pcbSize : -10 ));		\
	if(  RETVAL  &&  NULL != sBuf  ) {				\
	    /*SvPOK_only( svBuf );*/					\
	    SvCUR_set( svBuf, *pcbSize );				\
	    /*sv_setpvn( svBuf, (char *)sBuf, *pcbSize );*/		\
	    Debug(( "`%s' 0x%lX==0x%lX %ld of %ld\n", sBuf,		\
	      sBuf, SvPVX(svBuf), SvCUR(svBuf), SvLEN(svBuf) ));	\
	}								\
    } while( FALSE )

/* Set data size for a buffer that takes a pointer to its size in WCHARs: */
#define	trunc_buf_pcw( sBuf,svBuf, pcwSize )	do {			\
	Debug(( "trunc_buf_pcw( %s,[%s, %s ); 0x%lX==0x%lX, %ld\n",	\
	  string(sBuf), strchr(string(svBuf),'('), string(pcwSize),	\
	  sBuf, SvPVX(svBuf), pcwSize ? *pcwSize : -10 ));		\
	if(  RETVAL  &&  NULL != sBuf  ) {				\
	    SvCUR_set( svBuf, (*pcwSize)*sizeof(WCHAR) );		\
	    Debug(( "`%ls' 0x%lX==0x%lX %ld of %ld\n", sBuf,		\
	      sBuf, SvPVX(svBuf), SvCUR(svBuf), SvLEN(svBuf) ));	\
	}								\
    } while( FALSE )

/* Set data size for a buffer to a fixed data type: */
#define	trunc_buf_typ( pBuf,svBuf, Type )	do {			\
	Debug(( "trunc_buf_typ( %s,[%s, %s ); 0x%lX==0x%lX, %ld\n",	\
	  string(pBuf), strchr(string(svBuf),'('), string(Type),	\
	  pBuf, SvPVX(svBuf), sizeof(Type) ));				\
	if(  RETVAL  &&  NULL != pBuf  ) {				\
	    SvCUR_set( svBuf, sizeof(Type) );				\
	    Debug(( "0x%lX==0x%lX %ld of %ld\n",			\
	      pBuf, SvPVX(svBuf), SvCUR(svBuf), SvLEN(svBuf) ));	\
	}								\
    } while( FALSE )



MODULE = Win32API::Registry		PACKAGE = Win32API::Registry		

PROTOTYPES: DISABLE


long
constant( name, arg )
	char *	name
	int	arg
    CODE:
	RETVAL= constant( name, arg );
    OUTPUT:
	RETVAL


BOOL
AbortSystemShutdownA( sMachine )
	char *	sMachine
    CODE:
	RETVAL= AbortSystemShutdownA( sMachine );
    OUTPUT:
	RETVAL


BOOL
AbortSystemShutdownW( sMachine )
	WCHAR *	sMachine
    CODE:
	RETVAL= AbortSystemShutdownW( sMachine );
    OUTPUT:
	RETVAL


BOOL
InitiateSystemShutdownA( sMachine, sMessage, iTimeoutSecs, bForce, bReboot )
	char *	sMachine
	char *	sMessage
	DWORD	iTimeoutSecs
	BOOL	bForce
	BOOL	bReboot
    CODE:
	RETVAL= InitiateSystemShutdownA(
		  sMachine, sMessage, iTimeoutSecs, bForce, bReboot );
    OUTPUT:
	RETVAL


BOOL
InitiateSystemShutdownW( sMachine, sMessage, iTimeoutSecs, bForce, bReboot )
	WCHAR *	sMachine
	WCHAR *	sMessage
	DWORD	iTimeoutSecs
	BOOL	bForce
	BOOL	bReboot
    CODE:
	RETVAL= InitiateSystemShutdownW(
		  sMachine, sMessage, iTimeoutSecs, bForce, bReboot );
    OUTPUT:
	RETVAL


LONG
RegCloseKey( hKey )
	HKEY	hKey
    CODE:
	RETVAL= ErrorRet(  RegCloseKey( hKey )  );
    OUTPUT:
	RETVAL


LONG
RegConnectRegistryA( sMachine, hKey, phKey )
	char *	sMachine
	HKEY	hKey
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegConnectRegistryA( sMachine, hKey, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegConnectRegistryW( sMachine, hKey, phKey )
	WCHAR *	sMachine
	HKEY	hKey
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegConnectRegistryW( sMachine, hKey, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegCreateKeyA( hKey, sSubKey, phKey )
	HKEY	hKey
	char *	sSubKey
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegCreateKeyA( hKey, sSubKey, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegCreateKeyW( hKey, sSubKey, phKey )
	HKEY	hKey
	WCHAR *	sSubKey
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegCreateKeyW( hKey, sSubKey, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegCreateKeyExA(hKey,sSubKey,iZero,sClass,iOpts,samWant,pSecAttr,phKey,piDisp)
	HKEY	hKey
	char *	sSubKey
	DWORD	iZero
	char *	sClass
	DWORD	iOpts
	REGSAM	samWant
	void *	pSecAttr
	HKEY *	phKey
	DWORD *	piDisp
    CODE:
	RETVAL= ErrorRet(  RegCreateKeyExA( hKey, sSubKey, iZero,
	  sClass, iOpts, samWant, pSecAttr, phKey, piDisp )  );
    OUTPUT:
	RETVAL
	phKey
	piDisp


LONG
RegCreateKeyExW(hKey,sSubKey,iZero,sClass,iOpts,samWant,pSecAttr,phKey,piDisp)
	HKEY	hKey
	WCHAR *	sSubKey
	DWORD	iZero
	WCHAR *	sClass
	DWORD	iOpts
	REGSAM	samWant
	void *	pSecAttr
	HKEY *	phKey
	DWORD *	piDisp
    CODE:
	RETVAL= ErrorRet(  RegCreateKeyExW( hKey, sSubKey, iZero,
	  sClass, iOpts, samWant, pSecAttr, phKey, piDisp )  );
    OUTPUT:
	RETVAL
	phKey
	piDisp


LONG
RegDeleteKeyA( hKey, sSubKey )
	HKEY	hKey
	char *	sSubKey
    CODE:
	RETVAL= ErrorRet(  RegDeleteKeyA( hKey, sSubKey )  );
    OUTPUT:
	RETVAL


LONG
RegDeleteKeyW( hKey, sSubKey )
	HKEY	hKey
	WCHAR *	sSubKey
    CODE:
	RETVAL= ErrorRet(  RegDeleteKeyW( hKey, sSubKey )  );
    OUTPUT:
	RETVAL


LONG
RegDeleteValueA( hKey, sValueName )
	HKEY	hKey
	char *	sValueName
    CODE:
	RETVAL= ErrorRet(  RegDeleteValueA( hKey, sValueName )  );
    OUTPUT:
	RETVAL


LONG
RegDeleteValueW( hKey, sValueName )
	HKEY	hKey
	WCHAR *	sValueName


LONG
_RegEnumKeyA( hKey, iIndex, sName, cbNameSize )
	HKEY	hKey
	DWORD	iIndex
	char *	sName
	DWORD	cbNameSize
    CODE:
	RETVAL= ErrorRet(  RegEnumKeyA( hKey, iIndex, sName, cbNameSize )  );
    OUTPUT:
	RETVAL
	sName
	cbNameSize


LONG
_RegEnumKeyW( hKey, iIndex, sName, cwNameSize )
	HKEY	hKey
	DWORD	iIndex
	WCHAR *	sName
	DWORD	cwNameSize
    CODE:
	RETVAL= ErrorRet(  RegEnumKeyW( hKey, iIndex, sName, cwNameSize )  );
    OUTPUT:
	RETVAL
	sName
	cwNameSize


LONG
_RegEnumKeyExA(hKey,iIndex,sName,pcbName,pNull,sClass,pcbClass,pftLastWrite)
	HKEY		hKey
	DWORD		iIndex
	char *		sName
	DWORD *		pcbName
	DWORD *		pNull
	char *		sClass
	DWORD *		pcbClass
	FILETIME *	pftLastWrite
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( sName,ST(2), pcbName );
	    grow_buf_pcb( sClass,ST(5), pcbClass );
	    grow_buf_typ( pftLastWrite,ST(7), FILETIME );
	    dwErr= RegEnumKeyExA( hKey, iIndex, sName, pcbName,
	      pNull, sClass, pcbClass, pftLastWrite );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( sName,ST(2), pcbName );
		grow_buf_pcb( sClass,ST(5), pcbClass );
		dwErr= RegEnumKeyExA( hKey, iIndex, sName, pcbName,
		  pNull, sClass, pcbClass, pftLastWrite );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( sName,ST(2), pcbName );
	trunc_buf_pcb( sClass,ST(5), pcbClass );
	trunc_buf_typ( pftLastWrite,ST(7), FILETIME );
    OUTPUT:
	RETVAL
	pcbName
	pNull
	pcbClass
	pftLastWrite


LONG
_RegEnumKeyExW(hKey,iIndex,sName,pcwName,pNull,sClass,pcwClass,pftLastWrite)
	HKEY		hKey
	DWORD		iIndex
	WCHAR *		sName
	DWORD *		pcwName
	DWORD *		pNull
	WCHAR *		sClass
	DWORD *		pcwClass
	FILETIME *	pftLastWrite
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcw( sName,ST(2), pcwName );
	    grow_buf_pcw( sClass,ST(5), pcwClass );
	    grow_buf_typ( pftLastWrite,ST(7), FILETIME );
	    dwErr= RegEnumKeyExW( hKey, iIndex, sName, pcwName,
	      pNull, sClass, pcwClass, pftLastWrite );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcw( sName,ST(2), pcwName );
		grow_buf_pcw( sClass,ST(5), pcwClass );
		dwErr= RegEnumKeyExW( hKey, iIndex, sName, pcwName,
		  pNull, sClass, pcwClass, pftLastWrite );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcw( sName,ST(2), pcwName );
	trunc_buf_pcw( sClass,ST(5), pcwClass );
	trunc_buf_typ( pftLastWrite,ST(7), FILETIME );
    OUTPUT:
	RETVAL
	pcwName
	pNull
	pcwClass
	pftLastWrite


LONG
_RegEnumValueA(hKey,iIndex,sValName,pcbValName,pNull,piType,pValData,pcbValData)
	HKEY	hKey
	DWORD	iIndex
	char *	sValName
	DWORD *	pcbValName
	DWORD *	pNull
	DWORD *	piType
	BYTE *	pValData
	DWORD *	pcbValData
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( sValName,ST(2), pcbValName );
	    grow_buf_pcb( pValData,ST(6), pcbValData );
	    if(  NULL == piType  &&  NULL != pValData  )
		piType= (DWORD *) _alloca( sizeof(DWORD) );
	    dwErr= RegEnumValueA( hKey, iIndex, sValName,
	      pcbValName, pNull, piType, pValData, pcbValData );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( sValName,ST(2), pcbValName );
		grow_buf_pcb( pValData,ST(6), pcbValData );
		dwErr= RegEnumValueA( hKey, iIndex, sValName,
		  pcbValName, pNull, piType, pValData, pcbValData );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( sValName,ST(2), pcbValName );
	trunc_buf_pcb( pValData,ST(6), pcbValData );
	/* Strip trailing '\0' from string value data: */
	if(  RETVAL  &&  NULL != pValData  &&  NULL != pcbValData
	 &&  ( REG_SZ == *piType || REG_EXPAND_SZ == *piType )  )
	    SvCUR_set( ST(6), *pcbValData-1 );
    OUTPUT:
	RETVAL
	sValName
	pcbValName
	pNull
	piType
	pValData
	pcbValData


LONG
_RegEnumValueW(hKey,iIndex,sValName,pcwValName,pNull,piType,pValData,pcbValData)
	HKEY	hKey
	DWORD	iIndex
	WCHAR *	sValName
	DWORD *	pcwValName
	DWORD *	pNull
	DWORD *	piType
	BYTE *	pValData
	DWORD *	pcbValData
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcw( sValName,ST(2), pcwValName );
	    grow_buf_pcb( pValData,ST(5), pcbValData );
	    dwErr= RegEnumValueW( hKey, iIndex, sValName, pcwValName,
	      pNull, piType, pValData, pcbValData );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcw( sValName,ST(2), pcwValName );
		grow_buf_pcb( pValData,ST(5), pcbValData );
		dwErr= RegEnumValueW( hKey, iIndex, sValName, pcwValName,
		  pNull, piType, pValData, pcbValData );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcw( sValName,ST(2), pcwValName );
	trunc_buf_pcb( pValData,ST(5), pcbValData );
    OUTPUT:
	RETVAL
	pcwValName
	pNull
	piType
	pcbValData


LONG
RegFlushKey( hKey )
	HKEY	hKey
    CODE:
	RETVAL= ErrorRet(  RegFlushKey( hKey )  );
    OUTPUT:
	RETVAL


LONG
_RegGetKeySecurity( hKey, iSecInfo, pSecDesc, pcbSecDesc )
	HKEY			hKey
	SECURITY_INFORMATION	iSecInfo
	SECURITY_DESCRIPTOR *	pSecDesc
	DWORD *			pcbSecDesc
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( pSecDesc,ST(2), pcbSecDesc );
	    dwErr= RegGetKeySecurity( hKey, iSecInfo, pSecDesc, pcbSecDesc );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( pSecDesc,ST(2), pcbSecDesc );
		dwErr= RegGetKeySecurity(
		  hKey, iSecInfo, pSecDesc, pcbSecDesc );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( pSecDesc,ST(2), pcbSecDesc );
    OUTPUT:
	RETVAL
	pcbSecDesc


LONG
RegLoadKeyA( hKey, sSubKey, sFileName )
	HKEY	hKey
	char *	sSubKey
	char *	sFileName
    CODE:
	RETVAL= ErrorRet(  RegLoadKeyA( hKey, sSubKey, sFileName )  );
    OUTPUT:
	RETVAL


LONG
RegLoadKeyW( hKey, sSubKey, sFileName )
	HKEY	hKey
	WCHAR *	sSubKey
	WCHAR *	sFileName
    CODE:
	RETVAL= ErrorRet(  RegLoadKeyW( hKey, sSubKey, sFileName )  );
    OUTPUT:
	RETVAL


BOOL
AllowPriv( sPrivName, bEnable )
	char *	sPrivName
	BOOL	bEnable
    CODE:
    	{ HANDLE hToken= INVALID_HANDLE_VALUE;
	  TOKEN_PRIVILEGES tokPrivNew;
	    tokPrivNew.PrivilegeCount= 1;
	    if(  bEnable  ) {
		tokPrivNew.Privileges[0].Attributes= SE_PRIVILEGE_ENABLED;
	    } else {
		tokPrivNew.Privileges[0].Attributes= 0;
	    }
	    RETVAL= FALSE;
	    if(  OpenProcessToken( GetCurrentProcess(),
		   TOKEN_ADJUST_PRIVILEGES, &hToken )
	     &&  LookupPrivilegeValue( NULL, sPrivName,
		   &tokPrivNew.Privileges[0].Luid )
	     &&  AdjustTokenPrivileges( hToken, FALSE, &tokPrivNew,
		   NULL, NULL, NULL )  ) {
		RETVAL= TRUE;
		CloseHandle( hToken );
	    } else if(  INVALID_HANDLE_VALUE != hToken  ) {
	      DWORD dwErr= GetLastError();
		CloseHandle( hToken );
		SetLastError( dwErr );
	    }
	}
    OUTPUT:
	RETVAL


LONG
RegNotifyChangeKeyValue( hKey, bWatchSubtree, iNotifyFilter, hEvent, bAsync )
	HKEY	hKey
	BOOL	bWatchSubtree
	DWORD	iNotifyFilter
	HANDLE	hEvent
	BOOL	bAsync
    CODE:
	RETVAL= ErrorRet(  RegNotifyChangeKeyValue(
	  hKey, bWatchSubtree, iNotifyFilter, hEvent, bAsync )  );
    OUTPUT:
	RETVAL


LONG
RegOpenKeyA( hKey, sSubKey, phKey )
	HKEY	hKey
	char *	sSubKey
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegOpenKeyA( hKey, sSubKey, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegOpenKeyW( hKey, sSubKey, phKey )
	HKEY	hKey
	WCHAR *	sSubKey
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegOpenKeyW( hKey, sSubKey, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegOpenKeyExA( hKey, sSubKey, iOptions, samWanted, phKey )
	HKEY	hKey
	char *	sSubKey
	DWORD	iOptions
	REGSAM	samWanted
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegOpenKeyExA(
	  hKey, sSubKey, iOptions, samWanted, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
RegOpenKeyExW( hKey, sSubKey, iOptions, samWanted, phKey )
	HKEY	hKey
	WCHAR *	sSubKey
	DWORD	iOptions
	REGSAM	samWanted
	HKEY *	phKey
    CODE:
	RETVAL= ErrorRet(  RegOpenKeyExW(
	  hKey, sSubKey, iOptions, samWanted, phKey )  );
    OUTPUT:
	RETVAL
	phKey


LONG
_RegQueryInfoKeyA( hKey, sClass, pcbClass, pNull, piSubKeys, pcbSubKey, pcbSubClass, piValues, pcbValName, pcbValData, pcbSecDesc, pftTime )
	HKEY		hKey
	char *		sClass
	DWORD *		pcbClass
	DWORD *		pNull
	DWORD *		piSubKeys
	DWORD *		pcbSubKey
	DWORD *		pcbSubClass
	DWORD *		piValues
	DWORD *		pcbValName
	DWORD *		pcbValData
	DWORD *		pcbSecDesc
	FILETIME *	pftTime
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( sClass,ST(1), pcbClass );
	    grow_buf_typ( pftTime,ST(11), FILETIME );
	    dwErr= RegQueryInfoKeyA( hKey, sClass, pcbClass,
	      pNull, piSubKeys, pcbSubKey, pcbSubClass, piValues,
	      pcbValName, pcbValData, pcbSecDesc, pftTime );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( sClass,ST(1), pcbClass );
		dwErr= RegQueryInfoKeyA( hKey, sClass, pcbClass,
		  pNull, piSubKeys, pcbSubKey, pcbSubClass, piValues,
		  pcbValName, pcbValData, pcbSecDesc, pftTime );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( sClass,ST(1), pcbClass );
	trunc_buf_typ( pftTime,ST(11), FILETIME );
    OUTPUT:
	RETVAL
	pcbClass
	pNull
	piSubKeys
	pcbSubKey
	pcbSubClass
	piValues
	pcbValName
	pcbValData
	pcbSecDesc
	pftTime


LONG
_RegQueryInfoKeyW( hKey, sClass, pcwClass, pNull, piSubKeys, pcwSubKey, pcwSubClass, piValues, pcwValName, pcbValData, pcbSecDesc, pftTime )
	HKEY		hKey
	WCHAR *		sClass
	DWORD *		pcwClass
	DWORD *		pNull
	DWORD *		piSubKeys
	DWORD *		pcwSubKey
	DWORD *		pcwSubClass
	DWORD *		piValues
	DWORD *		pcwValName
	DWORD *		pcbValData
	DWORD *		pcbSecDesc
	FILETIME *	pftTime
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcw( sClass,ST(1), pcwClass );
	    grow_buf_typ( pftTime,ST(11), FILETIME );
	    dwErr= RegQueryInfoKeyW( hKey, sClass, pcwClass,
	      pNull, piSubKeys, pcwSubKey, pcwSubClass, piValues,
	      pcwValName, pcbValData, pcbSecDesc, pftTime );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcw( sClass,ST(1), pcwClass );
		dwErr= RegQueryInfoKeyW( hKey, sClass, pcwClass,
		  pNull, piSubKeys, pcwSubKey, pcwSubClass, piValues,
		  pcwValName, pcbValData, pcbSecDesc, pftTime );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcw( sClass,ST(1), pcwClass );
	trunc_buf_typ( pftTime,ST(11), FILETIME );
    OUTPUT:
	RETVAL
	pcwClass
	pNull
	piSubKeys
	pcwSubKey
	pcwSubClass
	piValues
	pcwValName
	pcbValData
	pcbSecDesc
	pftTime


LONG
_RegQueryMultipleValuesA( hKey, pValueEnts, iValueEnts, pBuffer, pcbBuffer )
	HKEY	hKey
	void *	pValueEnts
	DWORD	iValueEnts
	char *	pBuffer
	DWORD *	pcbBuffer
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( pBuffer,ST(3), pcbBuffer );
	    dwErr= RegQueryMultipleValuesA(
	      hKey, pValueEnts, iValueEnts, pBuffer, pcbBuffer );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( pBuffer,ST(3), pcbBuffer );
		dwErr= RegQueryMultipleValuesA(
		  hKey, pValueEnts, iValueEnts, pBuffer, pcbBuffer );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( pBuffer,ST(3), pcbBuffer );
    OUTPUT:
	RETVAL
	pcbBuffer


LONG
_RegQueryMultipleValuesW( hKey, pValueEnts, iValueEnts, pBuffer, pcbBuffer )
	HKEY	hKey
	void *	pValueEnts
	DWORD	iValueEnts
	WCHAR *	pBuffer
	DWORD *	pcbBuffer
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( pBuffer,ST(3), pcbBuffer );
	    dwErr= RegQueryMultipleValuesW(
	      hKey, pValueEnts, iValueEnts, pBuffer, pcbBuffer );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( pBuffer,ST(3), pcbBuffer );
		dwErr= RegQueryMultipleValuesW(
		  hKey, pValueEnts, iValueEnts, pBuffer, pcbBuffer );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( pBuffer,ST(3), pcbBuffer );
    OUTPUT:
	RETVAL
	pcbBuffer


LONG
_RegQueryValueA( hKey, sSubKey, sValueData, pcbValueData )
	HKEY	hKey
	char *	sSubKey
	char *	sValueData
	LONG *	pcbValueData
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( sValueData,ST(2), pcbValueData );
	    dwErr= RegQueryValueA( hKey, sSubKey, sValueData, pcbValueData );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( sValueData,ST(2), pcbValueData );
		dwErr= RegQueryValueA(
		  hKey, sSubKey, sValueData, pcbValueData );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( sValueData,ST(2), pcbValueData );
    OUTPUT:
	RETVAL
	pcbValueData


LONG
_RegQueryValueW( hKey, sSubKey, sValueData, pcbValueData )
	HKEY	hKey
	WCHAR *	sSubKey
	WCHAR *	sValueData
	LONG *	pcbValueData
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( sValueData,ST(2), pcbValueData );
	    dwErr= RegQueryValueW( hKey, sSubKey, sValueData, pcbValueData );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( sValueData,ST(2), pcbValueData );
		dwErr= RegQueryValueW(
		  hKey, sSubKey, sValueData, pcbValueData );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( sValueData,ST(2), pcbValueData );
    OUTPUT:
	RETVAL
	pcbValueData


LONG
_RegQueryValueExA( hKey, sValueName, pNull, piType, pValueData, pcbValueData )
	HKEY	hKey
	char *	sValueName
	DWORD *	pNull
	DWORD *	piType
	BYTE *	pValueData
	DWORD *	pcbValueData
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( pValueData,ST(4), pcbValueData );
	    if(  NULL == piType  )
		piType= (DWORD *) _alloca( sizeof(DWORD) );
	    dwErr= RegQueryValueExA(
	      hKey, sValueName, pNull, piType, pValueData, pcbValueData );
	    if(  ERROR_MORE_DATA == dwErr  ) {
		grow_buf_pcb( pValueData,ST(4), pcbValueData );
		dwErr= RegQueryValueExA(
		  hKey, sValueName, pNull, piType, pValueData, pcbValueData );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( pValueData,ST(4), pcbValueData );
	/* Strip trailing '\0' from string value data: */
	if(  RETVAL  &&  NULL != pValueData  &&  NULL != pcbValueData
	 &&  REG_SZ == *piType  ||  REG_EXPAND_SZ == *piType  )
	    SvCUR_set( ST(4), *pcbValueData-1 );
    OUTPUT:
	RETVAL
	pNull
	piType
	pcbValueData


LONG
_RegQueryValueExW( hKey, sValueName, pNull, piType, pValueData, pcbValueData )
	HKEY	hKey
	WCHAR *	sValueName
	DWORD *	pNull
	DWORD *	piType
	BYTE *	pValueData
	DWORD *	pcbValueData
    CODE:
	{ DWORD dwErr;
	    grow_buf_pcb( pValueData,ST(4), pcbValueData );
	    RETVAL= RegQueryValueExW(
	      hKey, sValueName, pNull, piType, pValueData, pcbValueData );
	    if(  ERROR_MORE_DATA == RETVAL  ) {
		grow_buf_pcb( pValueData,ST(4), pcbValueData );
		RETVAL= RegQueryValueExW(
		  hKey, sValueName, pNull, piType, pValueData, pcbValueData );
	    }
	    RETVAL= ErrorRet( dwErr );
	}
	trunc_buf_pcb( pValueData,ST(4), pcbValueData );
    OUTPUT:
	RETVAL
	pNull
	piType
	pcbValueData


LONG
RegReplaceKeyA( hKey, sSubKey, sNewFile, sOldFile )
	HKEY	hKey
	char *	sSubKey
	char *	sNewFile
	char *	sOldFile
    CODE:
	RETVAL= ErrorRet(
	  RegReplaceKeyA( hKey, sSubKey, sNewFile, sOldFile )  );
    OUTPUT:
	RETVAL


LONG
RegReplaceKeyW( hKey, sSubKey, sNewFile, sOldFile )
	HKEY	hKey
	WCHAR *	sSubKey
	WCHAR *	sNewFile
	WCHAR *	sOldFile
    CODE:
	RETVAL= ErrorRet(
	  RegReplaceKeyW( hKey, sSubKey, sNewFile, sOldFile )  );
    OUTPUT:
	RETVAL


LONG
RegRestoreKeyA( hKey, sFileName, iFlags )
	HKEY	hKey
	char *	sFileName
	DWORD	iFlags
    CODE:
	RETVAL= ErrorRet(  RegRestoreKeyA( hKey, sFileName, iFlags )  );
    OUTPUT:
	RETVAL


LONG
RegRestoreKeyW( hKey, sFileName, iFlags )
	HKEY	hKey
	WCHAR *	sFileName
	DWORD	iFlags
    CODE:
	RETVAL= ErrorRet(  RegRestoreKeyW( hKey, sFileName, iFlags )  );
    OUTPUT:
	RETVAL


LONG
RegSaveKeyA( hKey, sFileName, pSecAttr )
	HKEY			hKey
	char *			sFileName
	SECURITY_ATTRIBUTES *	pSecAttr
    CODE:
	RETVAL= ErrorRet(  RegSaveKeyA( hKey, sFileName, pSecAttr )  );
    OUTPUT:
	RETVAL


LONG
RegSaveKeyW( hKey, sFileName, pSecAttr )
	HKEY			hKey
	WCHAR *			sFileName
	SECURITY_ATTRIBUTES *	pSecAttr
    CODE:
	RETVAL= ErrorRet(  RegSaveKeyW( hKey, sFileName, pSecAttr )  );
    OUTPUT:
	RETVAL


LONG
RegSetKeySecurity( hKey, iSecInfo, pSecDesc )
	HKEY			hKey
	SECURITY_INFORMATION	iSecInfo
	SECURITY_DESCRIPTOR *	pSecDesc
    CODE:
	RETVAL= ErrorRet(  RegSetKeySecurity( hKey, iSecInfo, pSecDesc )  );
    OUTPUT:
	RETVAL


LONG
_RegSetValueA( hKey, sSubKey, iType, sValueData, cbValueData )
	HKEY	hKey
	char *	sSubKey
	DWORD	iType
	char *	sValueData
	DWORD	cbValueData
    CODE:
	if(  0 == cbValueData  )
	    cbValueData= SvCUR( ST(3) );
	RETVAL= ErrorRet(
	  RegSetValueA( hKey, sSubKey, iType, sValueData, cbValueData )  );
    OUTPUT:
	RETVAL


LONG
_RegSetValueW( hKey, sSubKey, iType, sValueData, cbValueData )
	HKEY	hKey
	WCHAR *	sSubKey
	DWORD	iType
	WCHAR *	sValueData
	DWORD	cbValueData
    CODE:
	if(  0 == cbValueData  )
	    cbValueData= SvCUR( ST(3) );
	RETVAL= ErrorRet(
	  RegSetValueW( hKey, sSubKey, iType, sValueData, cbValueData )  );
    OUTPUT:
	RETVAL


LONG
_RegSetValueExA( hKey, sValueName, iZero, iType, pValueData, cbValueData )
	HKEY	hKey
	char *	sValueName
	DWORD	iZero
	DWORD	iType
	BYTE *	pValueData
	DWORD	cbValueData
    CODE:
	if(  0 == cbValueData  )
	    cbValueData= SvCUR( ST(4) );
	RETVAL= ErrorRet(  RegSetValueExA(
	  hKey, sValueName, iZero, iType, pValueData, cbValueData )  );
    OUTPUT:
	RETVAL


LONG
_RegSetValueExW( hKey, sValueName, iZero, iType, pValueData, cbValueData )
	HKEY	hKey
	WCHAR *	sValueName
	DWORD	iZero
	DWORD	iType
	BYTE *	pValueData
	DWORD	cbValueData
    CODE:
	if(  0 == cbValueData  )
	    cbValueData= SvCUR( ST(4) );
	RETVAL= ErrorRet(  RegSetValueExW(
	  hKey, sValueName, iZero, iType, pValueData, cbValueData )  );
    OUTPUT:
	RETVAL


LONG
RegUnLoadKeyA( hKey, sSubKey )
	HKEY	hKey
	char *	sSubKey
    CODE:
	RETVAL= ErrorRet(  RegUnLoadKeyA( hKey, sSubKey )  );
    OUTPUT:
	RETVAL


LONG
RegUnLoadKeyW( hKey, sSubKey )
	HKEY	hKey
	WCHAR *	sSubKey
    CODE:
	RETVAL= ErrorRet(  RegUnLoadKeyW( hKey, sSubKey )  );
    OUTPUT:
	RETVAL
