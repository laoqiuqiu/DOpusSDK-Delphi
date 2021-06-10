{/********************************************************

   Directory Opus 12 Plugin Support Header File

********************************************************/}

unit DOPlugin.Support;

interface
uses
  Winapi.Windows,
  DOPlugin.Types;

// Current version - define PLUGINSUPPORTVERSION when including this file to use an older version
// Verison 1 is Opus 9
// Version 2 is Opus 10
// Version 3 is Opus 11
// Version 12000 is Opus 12.0 (first version using this easier to understand numbering format)
const
  PLUGINSUPPORTVERSION = 12000;

// Taken from winnt.h in case _WIN32_WINNT is not >= 0x0500
//{$IFNDEF RTL_SIZEOF_THROUGH_FIELD}
//#define RTL_FIELD_SIZE(type, field) (sizeof(((type *)0)->field))
//#define RTL_SIZEOF_THROUGH_FIELD(type, field) \
//    (FIELD_OFFSET(type, field) + RTL_FIELD_SIZE(type, field))
//{$ENDIF}

//********************************************************************************/
//
// These functions are exported from dopus.exe for use by plugins
//
// For example, to retrieve the Opus thumbnail settings:
//
//      PFNGETTHUMBNAILPREFS pfnGetThumbPrefs;
//      pfnGetThumbPrefs=(PFNGETTHUMBNAILPREFS)GetProcAddress( GetModuleHandle( 0 ), FUNCNAME_GETTHUMBNAILPREFS );
//      if (pfnGetThumbPrefs != 0)
//      {
//          DOPUSTHUMBNAILPREFSDATA dtp;
//          dtp.cbSize=sizeof(dtp);
//          pfnGetThumbPrefs(&dtp);
//      }
//
// Or use the DOpusPluginHelper helper class. For example,
//
//      DOpusPluginHelper dpHelper;
//      DOPUSTHUMBNAILPREFSDATA dtp;
//      dtp.cbSize=sizeof(dtp);
//      dpHelper.GetThumbnailPrefs(&dtp);
//
//********************************************************************************/

// Structures for load/save config helpers
const
  OPUSCFG_LOAD = 0;
  OPUSCFG_SAVE = 1;

  DPCITYPE_Bool              = 0;
  DPCITYPE_Int               = 1;
  DPCITYPE_DWORD             = 2;
  DPCITYPE_LPSTR             = 3;
  DPCITYPE_LPWSTR            = 4;
  DPCITYPE_Binary            = 5;
  DPCITYPE_LOGFONT           = 6;          // In Opus 12, when loading configs saved by earlier versions, this will always load a fixed size font. (Typically 8pt or 9pt.)
  DPCITYPE_Child             = 7;
  DPCITYPE_LOGFONTWITHHEIGHT = 8;          // Same as DPCITYPE_LOGFONT but: If doing a Load, lfHeight must be filled in by the caller and will be used when loading configs saved before Opus 12.

  {$IFDEF UNICODE}
  DPCITYPE_LPTSTR = DPCITYPE_LPWSTR;
  {$ELSE}
  DPCITYPE_LPTSTR = DPCITYPE_LPSTR;
  {$ENDIF}

type
  // Data structure passed to several functions
  LPVFSFUNCDATA     = Pointer; 
  LPVFSBATCHOPDATA  = Pointer; 
  LPCVFSBATCHOPDATA = LPVFSBATCHOPDATA; 

  PDOpusPluginConfigItemA = ^TDOpusPluginConfigItemA;
  DOpusPluginConfigItemA = record
    pszName   : PAnsiChar;
    iType     : Integer;
    pData     : LPVOID;
    dwDataSize: DWORD;
  end;
  LPDOPUSPLUGINCONFIGITEMA = ^DOpusPluginConfigItemA;
  TDOpusPluginConfigItemA  = DOpusPluginConfigItemA;

  PDOpusPluginConfigDataA = ^TDOpusPluginConfigDataA;
  DOpusPluginConfigDataA = record
    cbSize       : UINT;
    pszName      : PAnsiChar;
    fStateData   : BOOL;
    iNumCfgItems : Integer;
    pCfgItemArray: PDOPUSPLUGINCONFIGITEMA;
  end;
  LPDOPUSPLUGINCONFIGDATAA = ^DOpusPluginConfigDataA;
  TDOpusPluginConfigDataA  = DOpusPluginConfigDataA;

  PDOpusPluginConfigItemW = ^TDOpusPluginConfigItemW;
  DOpusPluginConfigItemW = record
    pszName   : PWideChar;
    iType     : Integer;
    pData     : LPVOID;
    dwDataSize: DWORD;
  end;
  LPDOPUSPLUGINCONFIGITEMW = ^DOpusPluginConfigItemW;
  TDOpusPluginConfigItemW  = DOpusPluginConfigItemW;

  PDOpusPluginConfigDataW = ^TDOpusPluginConfigDataW;
  DOpusPluginConfigDataW = record
    cbSize       : UINT;
    pszName      : PWideChar;
    fStateData   : BOOL;
    iNumCfgItems : Integer;
    pCfgItemArray: PDOPUSPLUGINCONFIGITEMW;
  end;
  LPDOPUSPLUGINCONFIGDATAW = ^DOpusPluginConfigDataW;
  TDOpusPluginConfigDataW  = DOpusPluginConfigDataW;

  {$IFDEF UNICODE}
  DOPUSPLUGINCONFIGITEM   = DOPUSPLUGINCONFIGITEMW;
  DOPUSPLUGINCONFIGDATA   = DOPUSPLUGINCONFIGDATAW;
  LPDOPUSPLUGINCONFIGITEM = LPDOPUSPLUGINCONFIGITEMW;
  LPDOPUSPLUGINCONFIGDATA = LPDOPUSPLUGINCONFIGDATAW;
  {$ELSE}
  DOPUSPLUGINCONFIGITEM   = DOPUSPLUGINCONFIGITEMA;
  DOPUSPLUGINCONFIGDATA   = DOPUSPLUGINCONFIGDATAA;
  LPDOPUSPLUGINCONFIGITEM = LPDOPUSPLUGINCONFIGITEMA;
  LPDOPUSPLUGINCONFIGDATA = LPDOPUSPLUGINCONFIGDATAA;
  {$ENDIF}


// Structure for GetThumbnailPrefs
  PDOpusThumbnailPrefsData = ^TDOpusThumbnailPrefsData;
  DOpusThumbnailPrefsData = record
    cbSize        : UINT;
    dwFlags       : DWORD;
    crFillColor   : COLORREF;
    szThumbSize   : SIZE;
    szMinThumbSize: SIZE;
    szMaxThumbSize: SIZE;
  end;
  LPDOPUSTHUMBNAILPREFSDATA = ^DOpusThumbnailPrefsData;
  TDOpusThumbnailPrefsData  = DOpusThumbnailPrefsData;

const
  DTHUMBF_GRAYSCALE       = (1 shl 0);  // Grayscale thumbnails (DEPRECATED in Opus 10)
  DTHUMBF_SHOWICON        = (1 shl 1);  // Show filetype icon
  DTHUMBF_HIDEICON        = (1 shl 2);  // Hide filetype icon for unregistered filetypes
  DTHUMBF_USESHELL        = (1 shl 3);  // Use shell image extraction (DEPRECATED in Opus 10)
  DTHUMBF_HIGHQUALITY     = (1 shl 4);  // High quality (DEPRECATED in Opus 10)
  DTHUMBF_FOLDERS         = (1 shl 5);  // Generate folder thumbnails
  DTHUMBF_FOLDERCONTENTS  = (1 shl 6);  // Generate from folder contents
  DTHUMBF_AUTOROTATE      = (1 shl 7);  // Auto-rotate using EXIF
  DTHUMBF_SHELLFOLDERS    = (1 shl 8);  // Use the shell (IShellItemImageFactory) to generate folder thumbnails. (Vista and above; Opus 10 and above.)
  DTHUMBF_HIDEICONIFSMALL = (1 shl 9);  // Hide filetype icon if thumbnail is too small

type
// Structure for OpusChooseFont
  PDOpusChooseFontA = ^TDOpusChooseFontA;
  _DOpusChooseFontA = record
    cbSize   : UINT;
    lpFont   : Pointer;
    dwFlags  : DWORD;
    lpszTitle: PAnsiChar;
  end;
  LPDOPUSCHOOSEFONTA = ^_DOpusChooseFontA;
  TDOpusChooseFontA  = _DOpusChooseFontA;

  PDOpusChooseFontW = ^TDOpusChooseFontW;
  _DOpusChooseFontW = record
    cbSize   : UINT;
    lpFont   : Pointer;
    dwFlags  : DWORD;
    lpszTitle: PWideChar;
  end;
  LPDOPUSCHOOSEFONTW = ^_DOpusChooseFontW;
  TDOpusChooseFontW  = _DOpusChooseFontW;

const
  DCHOOSEFONTF_FIXEDONLY = (1 shl 0);  // Fixed fonts only

type
  {$IFDEF UNICODE}
  DOPUSCHOOSEFONT   = TDOpusChooseFontW;
  LPDOPUSCHOOSEFONT = LPDOPUSCHOOSEFONTW;
  {$ELSE}
  DOPUSCHOOSEFONT   = TDOpusChooseFontA;
  LPDOPUSCHOOSEFONT = LPDOPUSCHOOSEFONTA;
  {$ENDIF}

const
  // Path types for GetConfigPath
  OPUSPATH_CONFIG    = 0;
  OPUSPATH_STATEDATA = 1;


  // ShowErrorDlg and ShowFunctionErrorDlg codes
  ERRORACTION_COPY        = 1;
  ERRORACTION_MOVE        = 2;
  ERRORACTION_DELETE      = 3;
  ERRORACTION_MAKEDIR     = 4;
  ERRORACTION_RENAME      = 5;
  ERRORACTION_SHORTCUT    = 6;
  ERRORACTION_UNDELETE    = 7;
  ERRORACTION_MODIFY      = 8;
  ERRORACTION_SPLIT       = 9;
  ERRORACTION_MAKEARC     = 10;
  ERRORACTION_READ        = 11;
  ERRORACTION_WRITE       = 12;
  ERRORACTION_READARCHIVE = 13;


  ERRORTYPE_RETRY_SKIP_CANCEL          = 1;
  ERRORTYPE_RETRY_CANCEL               = 2;
  ERRORTYPE_SKIP_CANCEL                = 3;
  ERRORTYPE_OK                         = 4;
  ERRORTYPE_OK_SKIP_CANCEL             = 5;
  ERRORTYPE_SCHEDULE_RETRY_SKIP_CANCEL = 6;
										 
  ERRORRESULT_ABORT                    = 0;
  ERRORRESULT_RETRY                    = 1;
  ERRORRESULT_SKIP                     = 2;
  ERRORRESULT_SKIP_ALL                 = 3;
  ERRORRESULT_SCHEDULE                 = 4;
  ERRORRESULT_SCHEDULE_ALL             = 5;
  ERRORRESULT_OK                       = 6;

// ShowRequestDlg data
// Callbacks should be prepared to treat NULL strings as empty strings.
type
  TCheckInputCallBackA  = function(Wnd: HWND; lParamCheckInput: LPARAM; lpszOrigString: PAnsiChar; lpszString: PAnsiChar; pszErrorBuf: PAnsiChar; cchErrorMax: Integer): Integer; stdcall;
  TCheckInputCallBackW  = function(Wnd: HWND; lParamCheckInput: LPARAM; lpszOrigString: PWideChar; lpszString: PWideChar; pszErrorBuf: PWideChar; cchErrorMax: Integer): Integer; stdcall;

  TFNOkInputA  = function(Wnd: HWND; lParamCheckInput: LPARAM; lpszOrigString: PAnsiChar; lpszString: PAnsiChar): BOOL; stdcall;
  TFNOkInputW  = function(Wnd: HWND; lParamCheckInput: LPARAM; lpszOrigString: PWideChar; lpszString: PWideChar): BOOL; stdcall;
const
  CHECKINPUT_REJECT = 0;
  CHECKINPUT_ACCEPT = 1;
  CHECKINPUT_ASK    = 2;

type
  {$IFDEF UNICODE}
  TFNCheckInput = TFNOkInputW;
  {$ELSE}
  TFNCheckInput = TFNOkInputA;
  {$ENDIF}

const
  HICON_WARNING                       = HICON(-1);    // $FFFFFFFFFFFFFFFF;
  HICON_ERROR                         = HICON(-2);    // $FFFFFFFFFFFFFFFE;
  HICON_INFO                          = HICON(-3);    // $FFFFFFFFFFFFFFFD;
  HICON_QUESTION                      = HICON(-4);    // $FFFFFFFFFFFFFFFC;
  
{$IFDEF UNICODE}
  BUTTONS_OKA                         = PAnsiChar(1);   // Ok
  BUTTONS_OKCANCELA                   = PAnsiChar(2);   // Ok|Cancel
  BUTTONS_RETRYSKIPA                  = PAnsiChar(3);   // Retry|Skip
  BUTTONS_IGNORECANCELA               = PAnsiChar(4);   // Ignore|Cancel
  BUTTONS_RETRYSKIPABORTA             = PAnsiChar(5);   // Retry|Skip|Skip All|Abort
  BUTTONS_SCHEDULERETRYSKIPABORTA     = PAnsiChar(6);   // Schedule|Schedule All|Retry|Skip|Skip All|Abort
  BUTTONS_REPLACESKIPABORTA           = PAnsiChar(7);   // Replace|Replace All|Skip|Skip All|Abort
  BUTTONS_UNPROTECTSKIPABORTA         = PAnsiChar(8);   // Unprotect|Unprotect All|Skip|Skip All|Abort
  BUTTONS_DELETESKIPABORTA            = PAnsiChar(9);   // Delete|Delete All|Skip|Abort
  BUTTONS_RETRYABORTA                 = PAnsiChar(10);  // Retry|Abort
  BUTTONS_REPLACESKIPRENAMEABORTA     = PAnsiChar(11);  // Replace|Replace All|Skip|Skip All|Rename|Abort
  BUTTONS_DELETECANCELA               = PAnsiChar(12);  // Delete|Cancel
  BUTTONS_SKIPABORTA                  = PAnsiChar(13);  // Skip|Skip All|Abort
  BUTTONS_YESNOA                      = PAnsiChar(14);  // Yes|No
  BUTTONS_REPLACECANCELA              = PAnsiChar(15);  // Replace|Cancel
  BUTTONS_OKSKIPABORTA                = PAnsiChar(16);  // OK|Skip|Abort
  BUTTONS_YESSKIPCANCELA              = PAnsiChar(17);  // Yes|Yes To All|Skip|Cancel
  BUTTONS_RETRYCANCELA                = PAnsiChar(18);  // Retry|Cancel
  BUTTONS_YESNOCANCELA                = PAnsiChar(19);  // Yes|No|Cancel
  BUTTONS_RENAMEREPLACESKIPABORTA     = PAnsiChar(20);  // Rename|Replace|Skip|Abort
  BUTTONS_REPLACERENAMECANCELA        = PAnsiChar(21);  // Replace|Rename|Cancel
  BUTTONS_OKABORTA                    = PAnsiChar(22);  // OK|Abort
{$ELSE}
  BUTTONS_OKW                         = PWideChar(1);   // Ok
  BUTTONS_OKCANCELW                   = PWideChar(2);   // Ok|Cancel
  BUTTONS_RETRYSKIPW                  = PWideChar(3);   // Retry|Skip
  BUTTONS_IGNORECANCELW               = PWideChar(4);   // Ignore|Cancel
  BUTTONS_RETRYSKIPABORTW             = PWideChar(5);   // Retry|Skip|Skip All|Abort
  BUTTONS_SCHEDULERETRYSKIPABORTW     = PWideChar(6);   // Schedule|Schedule All|Retry|Skip|Skip All|Abort
  BUTTONS_REPLACESKIPABORTW           = PWideChar(7);   // Replace|Replace All|Skip|Skip All|Abort
  BUTTONS_UNPROTECTSKIPABORTW         = PWideChar(8);   // Unprotect|Unprotect All|Skip|Skip All|Abort
  BUTTONS_DELETESKIPABORTW            = PWideChar(9);   // Delete|Delete All|Skip|Abort
  BUTTONS_RETRYABORTW                 = PWideChar(10);  // Retry|Abort
  BUTTONS_REPLACESKIPRENAMEABORTW     = PWideChar(11);  // Replace|Replace All|Skip|Skip All|Rename|Abort
  BUTTONS_DELETECANCELW               = PWideChar(12);  // Delete|Cancel
  BUTTONS_SKIPABORTW                  = PWideChar(13);  // Skip|Skip All|Abort
  BUTTONS_YESNOW                      = PWideChar(14);  // Yes|No
  BUTTONS_REPLACECANCELW              = PWideChar(15);  // Replace|Cancel
  BUTTONS_OKSKIPABORTW                = PWideChar(16);  // OK|Skip|Abort
  BUTTONS_YESSKIPCANCELW              = PWideChar(17);  // Yes|Yes To All|Skip|Cancel
  BUTTONS_RETRYCANCELW                = PWideChar(18);  // Retry|Cancel
  BUTTONS_YESNOCANCELW                = PWideChar(19);  // Yes|No|Cancel
  BUTTONS_RENAMEREPLACESKIPABORTW     = PWideChar(20);  // Rename|Replace|Skip|Abort
  BUTTONS_REPLACERENAMECANCELW        = PWideChar(21);  // Replace|Rename|Cancel
  BUTTONS_OKABORTW                    = PWideChar(22);  // OK|Abort
{$ENDIF}

const
  SHOWREQF_NAMEFILTER    = 1 shl 0;  // Filter input string for valid filename characters
  SHOWREQF_SELECTALL     = 1 shl 1;  // Select entire string on init
  SHOWREQF_PASSWORD      = 1 shl 2;  // Password input
  SHOWREQF_DEFAULTCANCEL = 1 shl 3;  // Cancel button default

type
  PShowRequestDlgDataA = ^TShowRequestDlgDataA;
  DOpusShowRequestDlgDataA = record
    cbSize             : UINT;         // size of structure
    hwndParent         : HWND;         // parent window
    pszTitle           : PAnsiChar;    // dialog title
    hIcon              : HICON;        // icon handle
    pszMessage         : PAnsiChar;    // message text
    pszButtons         : PAnsiChar;    // buttons (ok|cancel etc)
    pszStringBuf       : PAnsiChar;    // points to buffer for text input
    cchStringBufMax    : Integer;      // maximum size of input buffer
    dwFlags            : DWORD;        // flags
    pfnCheckInputString: TFarProc;     // function to check input string. Called when OK is clicked to accept/reject the string, possibly via a confirmation dialog.
    lParamCheckInput   : LPARAM;       // userdata for callback function
    pszBoolOption      : PAnsiChar;    // label for boolean option 1
    fBoolOption        : BOOL;         // boolean option state 1
    pszBoolOption2     : PAnsiChar;    // label for boolean option 2
    fBoolOption2       : BOOL;         // boolean option state 2
    pszBoolOption3     : PAnsiChar;    // label for boolean option 3
    fBoolOption3       : BOOL;         // boolean option state 3
    pszBoolOption4     : PAnsiChar;    // label for boolean option 4
    fBoolOption4       : BOOL;         // boolean option state 4
    pszBoolOption5     : PAnsiChar;    // label for boolean option 5
    fBoolOption5       : BOOL;         // boolean option state 5
    pfnOkInputString   : TFarProc;     // function to check input string. Called whenever the string is modified to enable/disable the OK button.
    pFuncData          : Pointer;      // Set NULL if you don't have it.
  end;
  SHOWREQUESTDLGDATAA   = DOpusShowRequestDlgDataA;
  LPSHOWREQUESTDLGDATAA = ^DOpusShowRequestDlgDataA;
  TShowRequestDlgDataA  = DOpusShowRequestDlgDataA;

//#define SHOWREQUESTDLGDATAA_V1_SIZE   ((UINT)RTL_SIZEOF_THROUGH_FIELD(SHOWREQUESTDLGDATAA,fBoolOption))
//{$IF PLUGINSUPPORTVERSION >= 2}
//#define SHOWREQUESTDLGDATAA_V2_SIZE   ((UINT)RTL_SIZEOF_THROUGH_FIELD(SHOWREQUESTDLGDATAA,pfnOkInputString))
//{$ENDIF}

  PShowRequestDlgDataW = ^TShowRequestDlgDataW;
  DOpusShowRequestDlgDataW = record
    cbSize             : UINT;         // size of structure
    hwndParent         : HWND;         // parent window
    pszTitle           : PWideChar;    // dialog title
    hIcon              : HICON;        // icon handle
    pszMessage         : PWideChar;    // message text
    pszButtons         : PWideChar;    // buttons (ok|cancel etc)
    pszStringBuf       : PWideChar;    // points to buffer for text input
    cchStringBufMax    : Integer;      // maximum size of input buffer
    dwFlags            : DWORD;        // flags
    pfnCheckInputString: TFarProc;     // function to check input string. Called when OK is clicked to accept/reject the string, possibly via a confirmation dialog.
    lParamCheckInput   : LPARAM;       // userdata for callback function
    pszBoolOption      : PWideChar;    // label for boolean option
    fBoolOption        : BOOL;         // boolean option state
    pszBoolOption2     : PWideChar;    // label for boolean option 2
    fBoolOption2       : BOOL;         // boolean option state 2
    pszBoolOption3     : PWideChar;    // label for boolean option 3
    fBoolOption3       : BOOL;         // boolean option state 3
    pszBoolOption4     : PWideChar;    // label for boolean option 4
    fBoolOption4       : BOOL;         // boolean option state 4
    pszBoolOption5     : PWideChar;    // label for boolean option 5
    fBoolOption5       : BOOL;         // boolean option state 5
    pfnOkInputString   : TFarProc;     // function to check input string. Called whenever the string is modified to enable/disable the OK button.
    pFuncData          : Pointer;      // Set NULL if you don't have it.
  end;
  SHOWREQUESTDLGDATAW   = DOpusShowRequestDlgDataW;
  LPSHOWREQUESTDLGDATAW = ^DOpusShowRequestDlgDataW;
  TShowRequestDlgDataW  = DOpusShowRequestDlgDataW;

//#define SHOWREQUESTDLGDATAW_V1_SIZE   ((UINT)RTL_SIZEOF_THROUGH_FIELD(SHOWREQUESTDLGDATAW,fBoolOption))
//{$IF PLUGINSUPPORTVERSION >= 2}
//#define SHOWREQUESTDLGDATAW_V2_SIZE   ((UINT)RTL_SIZEOF_THROUGH_FIELD(SHOWREQUESTDLGDATAW,pfnOkInputString))
//{$ENDIF}

  {$IFDEF UNICODE}
  type
  SHOWREQUESTDLGDATA         = SHOWREQUESTDLGDATAW;
  LPSHOWREQUESTDLGDATA       = LPSHOWREQUESTDLGDATAW;
  const
  SHOWREQUESTDLGDATA_V1_SIZE = 0; //SHOWREQUESTDLGDATAW_V1_SIZE; // x86=52; x64=92
  SHOWREQUESTDLGDATA_V2_SIZE = 0; //SHOWREQUESTDLGDATAW_V2_SIZE; // x86=; x64=168
  {$ELSE}
  type
  SHOWREQUESTDLGDATA         = SHOWREQUESTDLGDATAA;
  LPSHOWREQUESTDLGDATA       = LPSHOWREQUESTDLGDATAA;
  const
  SHOWREQUESTDLGDATA_V1_SIZE = SHOWREQUESTDLGDATAA_V1_SIZE;
  SHOWREQUESTDLGDATA_V2_SIZE = SHOWREQUESTDLGDATAA_V2_SIZE;
  {$ENDIF}

const
  // ShowFunctionNewNameDlg
  NEWNAME_ABORT  = 0;
  NEWNAME_SKIP   = 1;
  NEWNAME_SIMPLE = 2;
  NEWNAME_WILD   = 3;


  // ShowFunctionReplaceDlg
  // (REPLACEDLGF_NOTREALSOURCE used to be named REPLACEDLGF_NODESTINFO, which was misleading. It affects the source file.)
  REPLACEDLGF_RESUME          = 1 shl 0;
  REPLACEDLGF_NOTREALSOURCE   = 1 shl 1;  // Source file/path is not a real file. Disables anything that might access the file (e.g. getting information about it, generating thumbnail, context-menu and double-click).
  REPLACEDLGF_READONLY        = 1 shl 2;
  REPLACEDLGF_NOTHUMBS        = 1 shl 3;
  REPLACEDLGF_NOIDENTICAL     = 1 shl 4;  // If set, the dialog should NOT offer the "Skip Identical" and "Skip Identical (All)" options.
  REPLACEDLGF_USEWFDNAMES     = 1 shl 5;  // If set, the dialog should display the names from the WIN32_FIND_DATA. The file paths used to generate the thumbnail preview etc. may point to other files. When not set, the WIN32_FIND_DATA and file paths must be consistent.
  REPLACEDLGF_NOTREALDEST     = 1 shl 6;  // Dest file/path is not a real file. Disables anything that might access the file (e.g. getting information about it, generating thumbnail, context-menu and double-click).
  REPLACEDLGF_NOTACTUALSOURCE = 1 shl 7;  // Disables context-menu and double-click on source thumbnail. Set if the file path is not the actual file (e.g. it's a temp file just provided to generate the thumbnail).
  REPLACEDLGF_NOTACTUALDEST   = 1 shl 8;  // Disables context-menu and double-click on dest thumbnail. Set if the file path is not the actual file (e.g. it's a temp file just provided to generate the thumbnail).
  REPLACEDLGF_AUTORENAMEOLD   = 1 shl 9;  // Allow the Rename Old, Rename All Old response.
  REPLACEDLGF_AUTORENAMENEW   = 1 shl 10;  // Allow the Rename New, Rename All New response.
  REPLACEDLGF_MERGEFOLDERS    = 1 shl 11;  // Asking about merging two folders, not replacing a file
  REPLACEDLGF_ALLOWKEEPNEWER  = 1 shl 12;  // Allow the "Keep Newer" and "Keep Newer (All)" responses.

  REPLACERES_ABORT            = 0;
  REPLACERES_REPLACE          = 1;
  REPLACERES_REPLACEALL       = 2;
  REPLACERES_SKIP             = 3;
  REPLACERES_SKIPALL          = 4;
  REPLACERES_SKIPIDENTICAL    = 5;  // Skip all files where source/dest have the same size and date.
  REPLACERES_RESUME           = 6;
  REPLACERES_RESUMEALL        = 7;
  REPLACERES_RENAME           = 8;
  REPLACERES_RENAMEOLD        = 9;  // Automatically rename the old file out of the way (choosing a unique name).
  REPLACERES_RENAMEALLOLD     = 10;
  REPLACERES_RENAMENEW        = 11;  // Automatically rename the new file (choosing a unique name).
  REPLACERES_RENAMEALLNEW     = 12;
  REPLACERES_KEEPNEWER        = 13;  // Keep newest file.
  REPLACERES_KEEPALLNEWER     = 14;


  // ShowFunctionInitialDeleteDlg / ShowFunctionDeleteDlg
  DELETERES_ABORT     = 0;
  DELETERES_DELETE    = 1;
  DELETERES_DELETEALL = 2;
  DELETERES_SKIP      = 3;


  // AddFunctionFileChange
  OPUSFILECHANGE_CREATE             = 1;
  OPUSFILECHANGE_DELETE             = 2;
  OPUSFILECHANGE_CHANGE             = 3;
  OPUSFILECHANGE_MAKEDIR            = 4;
  OPUSFILECHANGE_REMDIR             = 5;
  OPUSFILECHANGE_REFRESH            = 6;
  OPUSFILECHANGE_REFRESHSUBS        = 7;

                                                 // UpdateFunctionProgressBar
  PROGRESSACTION_STATUSTEXTA        = 1;
  PROGRESSACTION_STATUSTEXTW        = 2;
  PROGRESSACTION_NEXTFILEA          = 3;
  PROGRESSACTION_NEXTFILEW          = 4;
  PROGRESSACTION_SETFILENAMEA       = 5;
  PROGRESSACTION_SETFILENAMEW       = 6;
  PROGRESSACTION_SETFILESIZE        = 7;
  PROGRESSACTION_SETFILESIZE64      = 8;
  PROGRESSACTION_STEPBYTES          = 9;
  PROGRESSACTION_SETBYTES           = 10;
  PROGRESSACTION_SETBYTES64         = 11;
  PROGRESSACTION_SKIPFILE           = 12;
  PROGRESSACTION_PERCENTMODE        = 13;
  PROGRESSACTION_SETPERCENT         = 14;
  PROGRESSACTION_NOPROGRESS         = 15;
  PROGRESSACTION_FORCEESTIMATETIME  = 16;
  PROGRESSACTION_NOOP               = 17;        // Do nothing (except the usual pause logic).
  PROGRESSACTION_NOSKIPALLOWED      = 18;        // Keep the Skip button disabled even if file size is set. (Should be sent before setting the file.)
  PROGRESSACTION_HIDEFILEBYTECOUNTS = 19;        // Hide/show byte-count below the top progress bar. dwData: TRUE to hide, FALSE to show. Does not take effect until next time something updates the file byte count/total.
  PROGRESSACTION_STEPBYTESCLOCK     = 20;
  PROGRESSACTION_STARTCLOCK         = 21;
  PROGRESSACTION_PAUSECLOCK         = 22;
  PROGRESSACTION_RESTARTCLOCK       = 23;
  PROGRESSACTION_FLAG_NOPAUSE       = 1 shl 31;  // Combine with any action to prevent the UpdateFunctionProgressBar call blocking if paused. (You are responsible for checking the pause event yourself in this case.)

  NOPROGRESSF_BATCHCOPY             = 1 shl 0;
  NOPROGRESSF_BATCHDELETE           = 1 shl 1;
  NOPROGRESSF_NOABORT               = 1 shl 2;

  {$IFDEF UNICODE}
  PROGRESSACTION_STATUSTEXT         = PROGRESSACTION_STATUSTEXTW;
  PROGRESSACTION_NEXTFILE           = PROGRESSACTION_NEXTFILEW;
  PROGRESSACTION_SETFILENAME        = PROGRESSACTION_SETFILENAMEW;
  {$ELSE}
  PROGRESSACTION_STATUSTEXT         = PROGRESSACTION_STATUSTEXTA;
  PROGRESSACTION_NEXTFILE           = PROGRESSACTION_NEXTFILEA;
  PROGRESSACTION_SETFILENAME        = PROGRESSACTION_SETFILENAMEA;
  {$ENDIF}


  // Registry wrappers
  //typedef void *OPUSREGKEY;
  type
  OPUSREGKEY = HKEY;
  const
  OPUSREGKEY_CLASSES_ROOT  = HKEY_CLASSES_ROOT;
  OPUSREGKEY_CURRENT_USER  = HKEY_CURRENT_USER;
  OPUSREGKEY_LOCAL_MACHINE = HKEY_LOCAL_MACHINE;
  OPUSREGKEY_USERS         = HKEY_USERS;

  OPUSREG_ELEVATIONCANCELLED = 0;
  OPUSREG_ELEVATED           = 1;
  OPUSREG_ELEVATIONNOTNEEDED = 2;


  // Button icon imagelist indices
  OPUSBUTTONIMAGE_BROWSE                = 00;
  OPUSBUTTONIMAGE_CLEAR                 = 01;
  OPUSBUTTONIMAGE_PLAY                  = 02;
  OPUSBUTTONIMAGE_STOP                  = 03;
  OPUSBUTTONIMAGE_START                 = 04;
  OPUSBUTTONIMAGE_GOBACK                = 05;
  OPUSBUTTONIMAGE_DROPDOWN              = 06;
  OPUSBUTTONIMAGE_DROPDOWNGHOST         = 07;
  OPUSBUTTONIMAGE_ARROWRIGHT            = 08;
  OPUSBUTTONIMAGE_ARROWLEFT             = 09;
  OPUSBUTTONIMAGE_ARROWUP               = 10;
  OPUSBUTTONIMAGE_ARROWDOWN             = 11;
  OPUSBUTTONIMAGE_BROWSEDISKS           = 12;
  OPUSBUTTONIMAGE_LOCKCLOSED            = 13;
  OPUSBUTTONIMAGE_LOCKOPEN              = 14;
  OPUSBUTTONIMAGE_ADDRESSBOOK           = 15;
  OPUSBUTTONIMAGE_PASTE                 = 16;
  OPUSBUTTONIMAGE_NEWSTYLE              = 17;
  OPUSBUTTONIMAGE_DUPESTYLE             = 18;
  OPUSBUTTONIMAGE_RENAMESTYLE           = 19;
  OPUSBUTTONIMAGE_DESCSTYLE             = 20;
  OPUSBUTTONIMAGE_DELSTYLE              = 21;
  OPUSBUTTONIMAGE_MOVEUP                = 22;
  OPUSBUTTONIMAGE_MOVEDOWN              = 23;
  OPUSBUTTONIMAGE_SORT                  = 24;
  OPUSBUTTONIMAGE_FILTER                = 25;
  OPUSBUTTONIMAGE_NEWFOLDER             = 26;
  OPUSBUTTONIMAGE_EDIT                  = 27;
  OPUSBUTTONIMAGE_CHANGEKEY             = 28;
  OPUSBUTTONIMAGE_LOAD                  = 29;
  OPUSBUTTONIMAGE_SAVE                  = 30;
  OPUSBUTTONIMAGE_OPENTYPE              = 31;
  OPUSBUTTONIMAGE_TRUETYPE              = 32;
  OPUSBUTTONIMAGE_REFRESH               = 33;
  OPUSBUTTONIMAGE_SEPARATOR             = 34;
  OPUSBUTTONIMAGE_ABOUT                 = 35;
  OPUSBUTTONIMAGE_HELP                  = 36;
  OPUSBUTTONIMAGE_GDS                   = 37;
  OPUSBUTTONIMAGE_CONNECT               = 38;
  OPUSBUTTONIMAGE_COPY                  = 39;
  OPUSBUTTONIMAGE_EMAIL                 = 40;
  OPUSBUTTONIMAGE_CANCEL                = 41;
  OPUSBUTTONIMAGE_FIND                  = 42;
  OPUSBUTTONIMAGE_UNDO                  = 43;
  OPUSBUTTONIMAGE_LOG                   = 44;
  OPUSBUTTONIMAGE_TEST                  = 45;
  OPUSBUTTONIMAGE_FTP                   = 46;
  OPUSBUTTONIMAGE_SCRIPT                = 47;
  OPUSBUTTONIMAGE_EMAIL2                = 48;
  OPUSBUTTONIMAGE_FLOAT                 = 49;
  OPUSBUTTONIMAGE_GLASSES               = 50;
  OPUSBUTTONIMAGE_RESETFOLDER           = 51;
  OPUSBUTTONIMAGE_BROWSEFOLDER          = 52;
  OPUSBUTTONIMAGE_REMOVEFOLDER          = 53;
  OPUSBUTTONIMAGE_BROWSEFILE            = 54;
  OPUSBUTTONIMAGE_REMOVEFILE            = 55;
  OPUSBUTTONIMAGE_RESETFILE             = 56;
  OPUSBUTTONIMAGE_COPYQUEUE_WITHOUTFILE = 57;
  OPUSBUTTONIMAGE_COPYQUEUE_WITHFILE    = 58;
  OPUSBUTTONIMAGE_COUNT                 = 59;

type
  // Thumbnail cache control
  PThumbCacheControlData = ^TThumbCacheControlData;
  ThumbCacheControlData = record
    cbSize            : UINT;        // set to size of structure before calling function
    iOperation        : Integer;     // one of the valid TCCOP_xxx operations
    pszPath           : PWideChar;   // path to empty cache for or NULL for all paths
    pszFileNamePattern: PWideChar;   // filename pattern to empty from cache or NULL for all files
    hEvent            : THandle;     // event to signal on completion or NULL if not needed
    dwFlags           : DWORD;       // flags
    dwlCacheSize      : DWORDLONG;   // returns size of cache for TCCOP_GETSIZE
  end;
  LPTHUMBCACHECONTROLDATA = ^ThumbCacheControlData;
  TThumbCacheControlData  = ThumbCacheControlData;

const
  TCCOP_GETSIZE = 1;  // get total cache size
  TCCOP_EMPTY   = 2;  // empty cache (all, specific folder or specific file(s))
  TCCOP_COMPACT = 3;  // compact cache (not implemented)

  TCCF_REGENERATE         = (1 shl 0);  // regenerate thumbs for any currently displayed affected files
  TCCF_NUKELEGACYTHUMBS   = (1 shl 1);  // delete any legacy thumbnails found
  TCCF_REGENERATEONLY     = (1 shl 2);  // do not delete anything from the thumbnail cache; just ask all open thumbnail windows to refresh their thumbnails. Useful if your thumbnails are never cached (DVPFIF_NoCache) and you wish to pass NULL for pszPath and pszFileNamePattern.
  TCCF_DELETEFOLDERTHUMBS = (1 shl 3);  // delete all folder thumbnails.

type
  // GetSetWallpaperFile data structure
  PGetSetWallpaperFileData = ^TGetSetWallpaperFileData;
  GetSetWallpaperFileData = record
    cbSize   : UINT;                                 // set to size of structure before calling function
    chPath   : array[0..MAX_PATH - 1] of WideChar;   // will be filled with the full path of the desired wallpaper file
    uiFmt    : UINT;                                 // desired output format
    uiQuality: UINT;                                 // desired output quality
  end;
  LPGETSETWALLPAPERFILEDATA = ^GetSetWallpaperFileData;
  TGetSetWallpaperFileData  = GetSetWallpaperFileData;

const
  GSWFFMT_BMP = 0;
  GSWFFMT_JPG = 1;


  // Styles for SetWallpaperImage
  SETWALLSTYLE_CENTER  = 1;
  SETWALLSTYLE_TILE    = 2;
  SETWALLSTYLE_STRETCH = 3;
  SETWALLSTYLE_FIT     = 4;
  SETWALLSTYLE_FILL    = 5;

type
  // Dialog resize helper
  {.$IFNDEF OPUSDLGRESIZER}
  PDlgResizerControl = ^TDlgResizerControl;
  DlgResizerControl = record
    dwFlags: DWORD;
    idCtl  : UINT_PTR;
  end;
  LPDLGRESIZERCONTROL = ^DlgResizerControl;
  TDlgResizerControl  = DlgResizerControl;
  {.$ENDIF}

const
  DlgResizerF_Right      = (1 shl 2);   // Position relative to right side
  DlgResizerF_Width      = (1 shl 3);   // Width relative to width
  DlgResizerF_Bottom     = (1 shl 4);   // Position relative to bottom side
  DlgResizerF_Height     = (1 shl 5);   // Height relative to height
  DlgResizerF_Window     = (1 shl 7);   // Window rather than control ID
  DlgResizerF_DiffParent = (1 shl 9);   // Control has a different parent window
  DlgResizerF_NewParent  = (1 shl 10);  // Specify a new parent window for subsequent items
  DlgResizerF_Previous   = (1 shl 16);  // Previous resizer to link to


  // Glyph sets
  OPUSGLYPHSET_NC       = 0;
  OPUSGLYPHSET_TREELOCK = 1;
  OPUSGLYPHSET_FDB      = 2;
  OPUSGLYPHSET_TOOLBAR  = 3;
  OPUSGLYPHSET_MENU     = 4;
  OPUSGLYPHSET_CHECKS   = 5;
  OPUSGLYPHSET_FLATLIST = 6;
  OPUSGLYPHSET_ARROWS   = 7;
  OPUSGLYPHSET_TINY     = 8;

  // Non-client glyphs
  OPUSGLYPH_NC_BACK         = 0;
  OPUSGLYPH_NC_FWD          = 1;
  OPUSGLYPH_NC_UP           = 2;
  OPUSGLYPH_NC_VERT         = 3;
  OPUSGLYPH_NC_HORZ         = 4;
  OPUSGLYPH_NC_ZOOM         = 5;
  OPUSGLYPH_NC_PININ        = 6;
  OPUSGLYPH_NC_PINOUT       = 7;
  OPUSGLYPH_NC_PINRIGHTIN   = 8;
  OPUSGLYPH_NC_ROTATELEFT   = 9;
  OPUSGLYPH_NC_ROTATERIGHT  = 10;
  OPUSGLYPH_NC_ZOOMIN       = 11;
  OPUSGLYPH_NC_ZOOMOUT      = 12;
  OPUSGLYPH_NC_ZOOMORIGINAL = 13;
  OPUSGLYPH_NC_ZOOMFIT      = 14;
  OPUSGLYPH_NC_CLOSE        = 15;
  OPUSGLYPH_NC_SHRINKDOWN   = 16;
  OPUSGLYPH_NC_SHRINKUP     = 17;
  OPUSGLYPH_NC_SHRINKRIGHT  = 18;
  OPUSGLYPH_NC_SHRINKLEFT   = 19;
  OPUSGLYPH_NC_CHECKMARK    = 20;
  OPUSGLYPH_NC_ZOOMGROW     = 21;

  // Tree lock glyphs
  OPUSGLYPH_TREELOCK_CLOSED = 0;
  OPUSGLYPH_TREELOCK_OPEN   = 1;
  OPUSGLYPH_TREE_LOCATE     = 2;

  // File display border glyphs
  OPUSGLYPH_FDB_BACK      = 0;
  OPUSGLYPH_FDB_FWD       = 1;
  OPUSGLYPH_FDB_UP        = 2;
  OPUSGLYPH_FDB_VERT      = 3;
  OPUSGLYPH_FDB_HORZ      = 4;
  OPUSGLYPH_FDB_COPYLEFT  = 5;
  OPUSGLYPH_FDB_COPYRIGHT = 6;
  OPUSGLYPH_FDB_COPYUP    = 7;
  OPUSGLYPH_FDB_COPYDOWN  = 8;
  OPUSGLYPH_FDB_SWAPHORZ  = 9;
  OPUSGLYPH_FDB_SWAPVERT  = 10;
  OPUSGLYPH_FDB_CLOSE     = 11;

  // Toolbar glyphs
  OPUSGLYPH_TOOLBAR_LEFT     = 0;
  OPUSGLYPH_TOOLBAR_RIGHT    = 1;
  OPUSGLYPH_TOOLBAR_MENU     = 2;
  OPUSGLYPH_TOOLBAR_DOWN     = 3;
  OPUSGLYPH_TOOLBAR_UP       = 4;
  OPUSGLYPH_TOOLBAR_MORE     = 5;
  OPUSGLYPH_TOOLBAR_POPOUT   = 6;
  OPUSGLYPH_TOOLBAR_MORELEFT = 7;

  // Menu glyphs
  OPUSGLYPH_MENU_BULLET = 0;
  OPUSGLYPH_MENU_CHECK  = 1;

  // Check glyphs
  OPUSGLYPH_CHECK_CHECK = 0;
  OPUSGLYPH_CHECK_RIGHT = 1;
  OPUSGLYPH_CHECK_LEFT  = 2;
  OPUSGLYPH_CHECK_DOWN  = 3;
  OPUSGLYPH_CHECK_UP    = 4;
  OPUSGLYPH_CHECK_CROSS = 5;

  // Flat list glyphs
  OPUSGLYPH_FLATLIST_CLOSED = 0;
  OPUSGLYPH_FLATLIST_OPEN   = 1;
  OPUSGLYPH_FLATLIST_CHECK  = 2;

  // Arrow glyphs
  OPUSGLYPH_ARROW_DOWN    = 0;
  OPUSGLYPH_ARROW_UP      = 1;
  OPUSGLYPH_ARROW_RIGHT   = 2;
  OPUSGLYPH_ARROW_LEFT    = 3;
  OPUSGLYPH_ARROW_SPANNER = 4;

  // Tiny glyphs
  OPUSGLYPH_TINY_CLOSE_NORMAL = 0;
  OPUSGLYPH_TINY_CLOSE_HOT    = 1;
  OPUSGLYPH_TINY_CLOSE_PUSHED = 2;

  // Glyph-drawing flags
  OPUSGLYPHDRAW_3D      = $01;
  OPUSGLYPHDRAW_DISABLE = $02;
  OPUSGLYPHDRAW_3DSOLID = $05;
  OPUSGLYPHDRAW_BLEND   = $08;



  // Hash functions
  HashType_MD5       = 0;
  HashType_SHA       = 1;

  HashOutput_Binary  = 0;
  HashOutput_ASCII   = 1;
  HashOutput_Unicode = 2;

  // LoadImage function
  DOLIF_FromFileA  = 1 shl 0;
  DOLIF_FromFileW  = 1 shl 1;
  DOLIF_FromStream = 1 shl 2;
  DOLIF_FromData   = 1 shl 3;
  DOLIF_NoPlugins  = 1 shl 4;

type
  DOLoadImageFlags = (
    DOLIFFromFileA  = 1,
    DOLIFFromFileW  = 2,
    DOLIFFromStream = 4,
    DOLIFFromData   = 8,
    DOLIFNoPlugins  = 16);
    
  PDOLoadImageData = ^TDOLoadImageData;
  _DOLoadImageData = record
    cbSize          : UINT;
    union           : record
      case Integer of
        0: (pszFileA: LPSTR);
        1: (pszFileW: LPWSTR);
        2: (pStm    : Pointer);
        3: (pData   : LPVOID);
      end;
    dwFlags         : DOLoadImageFlags;
    dwDataSize      : SIZE_T;
    hWnd            : HWND;
    hAbortEvent     : THandle;
    bmh             : BITMAPINFOHEADER;
    hBmpImage       : HBITMAP;
    pBits           : LPVOID;
  end;
  LPDOLOADIMAGEDATA = ^_DOLoadImageData;
  TDOLoadImageData  = _DOLoadImageData;
  
const
  // Pattern matching
  PatternMatchF_FileName          = (1 shl 0);  // Enable extensions such as "grp:" (filetype-group matching).
  PatternMatchF_CaseSensitive     = (1 shl 1);
  PatternMatchF_DefaultExtensions = (1 shl 2);  // Enable extensions such as allowing users to type ".jpg .gif" to search for "*.(jpg|gif)"
  PatternMatchF_DOSOnly           = (1 shl 3);  // MS-DOS wildcards only.
  PatternMatchF_RegularExpression = (1 shl 4);

  // GetAndFilterDialogTemplate, GetLangDlgEx, CreateLangDlgEx, LangDlgBoxEx
  GAFDT_WANT_SEGOE                    = (1 shl 1);  // Want the dialog to be converted to Segoe font if possible. Requires original dialog resource to use MS Shell Dlg or MS Shell Dlg 2 fonts.

  // DOpusColorPicker flags
  DOCOLPICKF_TRANSPARENT    = (1 shl 0);  // Enable the Transparent "color".
  DOCOLPICKF_TRANSISDEFAULT = (1 shl 1);  // Lable the Transparent color as "Use Default".
  DOCOLPICKF_CLOSEONF4      = (1 shl 2);  // The color picker should close if F4 is pushed (e.g. if opened in response to F4 on a drop-down button).

  // NumToStrBytesizeW flags
  BTSF_PADDECIMALZERO = (1 shl 0);
  BTSF_FORCEBYTES     = (1 shl 1);
  BTSF_FORCETB        = (1 shl 2);
  BTSF_FORCEGB        = (1 shl 3);
  BTSF_FORCEMB        = (1 shl 4);
  BTSF_FORCEKB        = (1 shl 5);
  BTSF_ROUNDUP        = (1 shl 6);

  // FilterFunctionFileEx results
  DFFFE_SKIP         = 0;  // The item did not match the filter and should be skipped. (If a directory, do not recurse into it; skip it and its children.)
  DFFFE_MATCH        = 1;  // The item matched the filter and should be handled. (If a directory, recurse into it; when deleting, delete if empty after recursion.)
  DFFFE_RECURSE_ONLY = 2;  // The directory itself did not match the filter but you should still recurse into it and check its children.

type
  //typedef struct DOpusVFSBatchDataA VFSBATCHDATAA; // forward-declare struct from "DOpus.Plugins.VFS.pas"
  PVFSBatchDataA = ^TVFSBatchDataA;
  VFSBATCHDATAA  = DOpusVFSBatchDataA;
  TVFSBatchDataA = DOpusVFSBatchDataA;
  // forward-declare struct from "vfs plugins.h"

  //typedef struct DOpusVFSBatchDataW VFSBATCHDATAW; // forward-declare struct from "DOpus.Plugins.VFS.pas"
  PVFSBatchDataW = ^TVFSBatchDataW;
  VFSBATCHDATAW  = DOpusVFSBatchDataW;
  TVFSBatchDataW = DOpusVFSBatchDataW;
  // forward-declare struct from "vfs plugins.h"
  {$IFDEF UNICODE}
    VFSBATCHDATA = VFSBATCHDATAW;
  {$ELSE}
    VFSBATCHDATA = VFSBATCHDATAA;
  {$ENDIF}

const
  // Flags for GetFunctionWindowEx and GuessFunctionWindowEx
  GFWE_ALLOWANYLISTER        = (1 shl 0);  // Consider any lister as a candidate. (Implies GFWE_ALLOWFOREGROUNDLISTER.)
  GFWE_ALLOWFOREGROUNDLISTER = (1 shl 1);  // Consider the foreground lister as a candidate.
  GFWE_ALLOWDESKTOP          = (1 shl 2);  // If all else fails, return the Windows desktop instead of NULL.

  // GetPluginElevator special HWND arguments.
  GPE_HWND_NOELEVATE    = HWND(-1);
  GPE_HWND_ELEVATENOASK = HWND(-2);
  
type
// Inline progress
  PDOpusInlineProgress = ^TDOpusInlineProgress;
  DOpusInlineProgress = record
    uiType     : UINT;
    pszText    : PWideChar;
    dwRange    : DWORD;                 // 0 for marquee mode
    dwShowDelay: DWORD;
    hAbortEvent: THandle;
  end;
  LPDOPUSINLINEPROGRESS = ^DOpusInlineProgress;
  TDOpusInlineProgress  = DOpusInlineProgress;

const
  // inline progress types
  INLINEPROGRESS_READDIR  = 0;
  INLINEPROGRESS_FLATVIEW = 1;
  INLINEPROGRESS_CUSTOM   = 2;
  INLINEPROGRESS_FTP      = 3;

  INLINEPROGRESS_INVALID  = -1;

type
  // struct for CreateBusyIndicator
  PDOpusBusyIndicator = ^TDOpusBusyIndicator;
  DOpusBusyIndicator = record
    cbSize        : UINT;
    fGlobal       : BOOL;                  // not impl
    pszDescription: PWideChar;
    hAbortEvent   : THandle;
    fVisible      : BOOL;
    hwndOwner     : HWND;
  end;
  VFSBUSYINDICATOR    = DOpusBusyIndicator;
  LPVFSBUSYINDICATOR  = ^DOpusBusyIndicator;
  TDOpusBusyIndicator = DOpusBusyIndicator;

//??
  //struct IDOpusFileOperation;
  IDOpusFileOperation = record end;

// Opus 12
type
  TDildImageType = (
    DILD_PNG = 0,
    DILD_JPG = 1,
    DILD_BMP = 2);

  HIMAGELIST = THandle;
  
type
  PDPIImageListData = ^_DPIImageListData;
  _DPIImageListData = record
    size                : SIZE_T;
    dild_ImageList      : HIMAGELIST;   // HIMAGELIST = THandle; in winapi.CommCtrl.pas
    dild_Type           : Integer;      // DILD_PNG = 0, DILD_JPG = 1, DILD_BMP = 2
    dild_Module         : HMODULE;
    dild_ImageCount     : Integer;
    dild_Grow           : Integer;
    dild_ILFlags        : UINT;
    dild_MaskColor      : COLORREF;
    dild_RecolorColor   : COLORREF;
    dild_RecolorForGlyph: BOOL;
  end;
  LPDPIIMAGELISTDATA = ^_DPIImageListData;
  TDPIImageListData  = _DPIImageListData;

  PDPIResourceID = ^DPIResourceID;
  DPIResourceID = record
    dri_OriginalScaleFactor: Integer;  // DPI % of the original image.
    dri_ResourceId: Integer;
  end;
  LPDPIRESOURCEID = ^DPIResourceID;
  TDPIResourceID  = DPIResourceID;

  // DOpus Helper
  TDOpusPluginHelperBase = class
  strict private
    class function DOAPI_GetProgramDir(pszBuf: LPWSTR; cchBufSize: Integer): BOOL; cdecl;
    class function DOAPI_GetConfigPath(iPathType: Integer; pszBuf: LPWSTR; cchMax: UINT): BOOL; static; cdecl;
    class function Dll: HMODULE; static;
    class function GetPath(iPathType: Integer): string; static;
  class var
    PathBuffer: array [0..MAX_PATH] of WideChar;
  private
    //FDOAPI_: function(): string;
  strict protected
  public
  end;



{$REGION 'Function prototypes'}
{* ****************************************************************************** *
  DOpusChooseFontA                             = function(hWnd: HWND; var lpChoose: TDOpusChooseFontA): BOOL; cdecl;
  DOpusChooseFontW                             = function(hWnd: HWND; var lpChoose: TDOpusChooseFontW): BOOL; cdecl;
  GetConfigPathA                               = function(iPathType: Integer; pszBuf: LPSTR; cchMax: UINT): BOOL; cdecl;
  GetConfigPathW                               = function(iPathType: Integer; pszBuf: LPWSTR; cchMax: UINT): BOOL; cdecl;
  LoadOrSaveConfigA                            = function(iOperation: Integer; var lpCfgData: TDOpusPluginConfigDataA): BOOL; cdecl;
  LoadOrSaveConfigW                            = function(iOperation: Integer; var lpCfgData: TDOpusPluginConfigDataW): BOOL; cdecl;
  GetThumbnailPrefs                            = function(var lpThumbData: TDOpusThumbnailPrefsData): BOOL; cdecl;
  XMLLoadFileA                                 = function(pszFile: LPCSTR): THandle; cdecl;
  XMLLoadFileW                                 = function(pszFile: LPCWSTR): THandle; cdecl;
  XMLLoadData                                  = function(pData: LPCVOID; dwSize: DWORD): THandle; cdecl;
  XMLSaveFileA                                 = function(hXML: THandle; pszFile: LPCSTR): BOOL; cdecl;
  XMLSaveFileW                                 = function(hXML: THandle; pszFile: LPCWSTR): BOOL; cdecl;
  XMLSaveData                                  = function(hXML: THandle; pszOutFreeViaCTMA: PLPWSTR): BOOL; cdecl;
  XMLCreateFile                                = function: THandle; cdecl;
  XMLFreeFile                                  = procedure(hXML: THandle); cdecl;
  XMLAddChildNodeA                             = function(hXML: THandle; pszName: LPCSTR): THandle; cdecl;
  XMLAddChildNodeW                             = function(hXML: THandle; pszName: LPCWSTR): THandle; cdecl;
  XMLFindChildNodeA                            = function(hXML: THandle; pszName: LPCSTR): THandle; cdecl;
  XMLFindChildNodeW                            = function(hXML: THandle; pszName: LPCWSTR): THandle; cdecl;
  XMLEnumChildNodesA                           = function(hXML: THandle; pszName: LPCSTR; hPrev: THandle): THandle; cdecl;
  XMLEnumChildNodesW                           = function(hXML: THandle; pszName: LPCWSTR; hPrev: THandle): THandle; cdecl;
  XMLFirstChildNode                            = function(hXML: THandle): THandle; cdecl;
  XMLNextNode                                  = function(hXML: THandle): THandle; cdecl;
  XMLDeleteChild                               = function(hXML: THandle; hChild: THandle): BOOL; cdecl;
  XMLDeleteAllChildNodes                       = function(hXML: THandle): BOOL; cdecl;
  XMLGetNodeNameA                              = function(hXML: THandle; pszName: LPSTR; var pcchMax: Integer): BOOL; cdecl;
  XMLGetNodeNameW                              = function(hXML: THandle; pszName: LPWSTR; var pcchMax: Integer): BOOL; cdecl;
  XMLSetNodeNameA                              = function(hXML: THandle; pszName: LPCSTR): BOOL; cdecl;
  XMLSetNodeNameW                              = function(hXML: THandle; pszName: LPCWSTR): BOOL; cdecl;
  XMLGetNodeValueA                             = function(hXML: THandle; pszValue: LPSTR; var pcchMax: Integer): BOOL; cdecl;
  XMLGetNodeValueW                             = function(hXML: THandle; pszValue: LPWSTR; var pcchMax: Integer): BOOL; cdecl;
  XMLSetNodeValueA                             = function(hXML: THandle; pszValue: LPCSTR): BOOL; cdecl;
  XMLSetNodeValueW                             = function(hXML: THandle; pszValue: LPCWSTR): BOOL; cdecl;
  XMLGetNodeBoolValue                          = function(hXML: THandle; pfValue: PBOOL): BOOL; cdecl;
  XMLSetNodeBoolValue                          = function(hXML: THandle; fValue: BOOL): BOOL; cdecl;
  XMLGetNodeIntValue                           = function(hXML: THandle; var piValue: Integer): BOOL; cdecl;
  XMLSetNodeIntValue                           = function(hXML: THandle; iValue: Integer): BOOL; cdecl;
  XMLGetNodeDWORDValue                         = function(hXML: THandle; var pdwValue: DWORD): BOOL; cdecl;
  XMLSetNodeDWORDValue                         = function(hXML: THandle; dwValue: DWORD): BOOL; cdecl;
  XMLGetNodeDWORDLONGValue                     = function(hXML: THandle; pdwlValue: PULONGLONG): BOOL; cdecl;
  XMLSetNodeDWORDLONGValue                     = function(hXML: THandle; dwlValue: DWORDLONG): BOOL; cdecl;
  XMLGetNodeLOGFONTValueA                      = function(hXML: THandle; var plfValue: LOGFONTA): BOOL; cdecl;
  XMLGetNodeLOGFONTValueExA                    = function(hXML: THandle; lDefaultLFHeight: LONG; var plfValue: LOGFONTA): BOOL; cdecl;
  XMLGetNodeLOGFONTValueW                      = function(hXML: THandle; var plfValue: LOGFONTW): BOOL; cdecl;
  XMLGetNodeLOGFONTValueExW                    = function(hXML: THandle; lDefaultLFHeight: LONG; var plfValue: LOGFONTW): BOOL; cdecl;
  XMLSetNodeLOGFONTValueA                      = function(hXML: THandle; const plfValue: PLOGFONTA): BOOL; cdecl;
  XMLSetNodeLOGFONTValueW                      = function(hXML: THandle; const plfValue: PLOGFONTW): BOOL; cdecl;
  XMLGetNodeBinaryValue                        = function(hXML: THandle; pValue: LPVOID; var pdwSize: DWORD): BOOL; cdecl;
  XMLSetNodeBinaryValue                        = function(hXML: THandle; pValue: LPVOID; pdwSize: DWORD): BOOL; cdecl;
  XMLGetNodeAttributeA                         = function(hXML: THandle; pszAttrName: LPCSTR; pszAttrValue: LPSTR; var pcchMax: Integer): BOOL; cdecl;
  XMLGetNodeAttributeW                         = function(hXML: THandle; pszAttrName: LPCWSTR; pszAttrValue: LPWSTR; var pcchMax: Integer): BOOL; cdecl;
  XMLSetNodeAttributeA                         = function(hXML: THandle; pszAttrName: LPCSTR; pszAttrValue: LPCSTR): BOOL; cdecl;
  XMLSetNodeAttributeW                         = function(hXML: THandle; pszAttrName: LPCWSTR; pszAttrValue: LPCWSTR): BOOL; cdecl;
  XMLGetNodeBoolAttributeA                     = function(hXML: THandle; pszAttrName: LPCSTR; var pfAttrValue: BOOL): BOOL; cdecl;
  XMLGetNodeBoolAttributeW                     = function(hXML: THandle; pszAttrName: LPCWSTR; var pfAttrValue: BOOL): BOOL; cdecl;
  XMLSetNodeBoolAttributeA                     = function(hXML: THandle; pszAttrName: LPCSTR; fAttrValue: BOOL): BOOL; cdecl;
  XMLSetNodeBoolAttributeW                     = function(hXML: THandle; pszAttrName: LPCWSTR; fAttrValue: BOOL): BOOL; cdecl;
  XMLGetNodeIntAttributeA                      = function(hXML: THandle; pszAttrName: LPCSTR; var piAttrValue: Integer): BOOL; cdecl;
  XMLGetNodeIntAttributeW                      = function(hXML: THandle; pszAttrName: LPCWSTR; var piAttrValue: Integer): BOOL; cdecl;
  XMLSetNodeIntAttributeA                      = function(hXML: THandle; pszAttrName: LPCSTR; iAttrValue: Integer): BOOL; cdecl;
  XMLSetNodeIntAttributeW                      = function(hXML: THandle; pszAttrName: LPCWSTR; iAttrValue: Integer): BOOL; cdecl;
  XMLGetNodeDWORDAttributeA                    = function(hXML: THandle; pszAttrName: LPCSTR; var pdwAttrValue: DWORD): BOOL; cdecl;
  XMLGetNodeDWORDAttributeW                    = function(hXML: THandle; pszAttrName: LPCWSTR; var pdwAttrValue: DWORD): BOOL; cdecl;
  XMLSetNodeDWORDAttributeA                    = function(hXML: THandle; pszAttrName: LPCSTR; dwAttrValue: DWORD): BOOL; cdecl;
  XMLSetNodeDWORDAttributeW                    = function(hXML: THandle; pszAttrName: LPCWSTR; dwAttrValue: DWORD): BOOL; cdecl;
  XMLGetNodeDWORDLONGAttributeA                = function(hXML: THandle; pszAttrName: LPCSTR; var pdwlAttrValue: UInt64): BOOL; cdecl;
  XMLGetNodeDWORDLONGAttributeW                = function(hXML: THandle; pszAttrName: LPCWSTR; var pdwlAttrValue: UInt64): BOOL; cdecl;
  XMLSetNodeDWORDLONGAttributeA                = function(hXML: THandle; pszAttrName: LPCSTR; dwlAttrValue: DWORDLONG): BOOL; cdecl;
  XMLSetNodeDWORDLONGAttributeW                = function(hXML: THandle; pszAttrName: LPCWSTR; dwlAttrValue: DWORDLONG): BOOL; cdecl;
  XMLDeleteNodeAttributeA                      = function(hXML: THandle; pszAttrName: LPCSTR): BOOL; cdecl;
  XMLDeleteNodeAttributeW                      = function(hXML: THandle; pszAttrName: LPCWSTR): BOOL; cdecl;
  XMLDeleteAllNodeAttributes                   = function(hXML: THandle): BOOL; cdecl;
  ShowRequestDlgA                              = function(var lpDlgData: TShowRequestDlgDataA): Integer; cdecl;
  ShowRequestDlgW                              = function(var lpDlgData: TShowRequestDlgDataW): Integer; cdecl;
  ShowFunctionNewNameDlgA                      = function(lpBatchOpData: LPCVFSBATCHOPDATA; lpszOldName: LPSTR; cchOldNameMax: Integer; lpszNewName: LPSTR; cchNewNameMax: Integer; fMove: BOOL): Integer; cdecl;
  ShowFunctionNewNameDlgW                      = function(lpBatchOpData: LPCVFSBATCHOPDATA; lpszOldName: LPWSTR; cchOldNameMax: Integer; lpszNewName: LPWSTR; cchNewNameMax: Integer; fMove: BOOL): Integer; cdecl;
  GetWildNewNameA                              = function(lpszOldPattern: LPCSTR; lpszNewPattern: LPCSTR; lpszFileName: LPCSTR; lpszNewName: LPSTR; cchNewNameMax: Integer): BOOL; cdecl;
  GetWildNewNameW                              = function(lpszOldPattern: LPCWSTR; lpszNewPattern: LPCWSTR; lpszFileName: LPCWSTR; lpszNewName: LPWSTR; cchNewNameMax: Integer): BOOL; cdecl;
  ShowErrorDlgW                                = function(lpVFSData: LPVFSFUNCDATA; hWndParent: HWND; uiType: UINT; iErrorCode: Integer; uiAction: UINT; lpszName: LPCWSTR; lpszErrMsg: LPCWSTR): Integer; cdecl;
  ShowErrorDlgA                                = function(lpVFSData: LPVFSFUNCDATA; hWndParent: HWND; uiType: UINT; iErrorCode: Integer; uiAction: UINT; lpszName: LPCSTR; lpszErrMsg: LPCSTR): Integer; cdecl;
  ShowFunctionErrorDlgA                        = function(lpBatchOpData: LPCVFSBATCHOPDATA; uiType: UINT; iErrorCode: Integer; uiAction: UINT; lpszName: LPCSTR; lpszErrMsg: LPCSTR): Integer; cdecl;
  ShowFunctionErrorDlgW                        = function(lpBatchOpData: LPCVFSBATCHOPDATA; uiType: UINT; iErrorCode: Integer; uiAction: UINT; lpszName: LPCWSTR; lpszErrMsg: LPCWSTR): Integer; cdecl;
  ShowFunctionReplaceDlgA                      = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszSource: LPCSTR; pwfdSource: WIN32_FIND_DATAA; pszDest: LPCSTR; pwfdDest: WIN32_FIND_DATAA; pszNewName: LPSTR; cchNewNameMax: Integer; dwFlags: DWORD): Integer; cdecl;
  ShowFunctionReplaceDlgW                      = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszSource: LPCWSTR; pwfdSource: WIN32_FIND_DATAW; pszDest: LPCWSTR; pwfdDest: WIN32_FIND_DATAW; pszNewName: LPWSTR; cchNewNameMax: Integer; dwFlags: DWORD): Integer; cdecl;
  ShowFunctionInitialDeleteDlgA                = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszFileName: LPCSTR): Integer; cdecl;
  ShowFunctionInitialDeleteDlgW                = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszFileName: LPCWSTR): Integer; cdecl;
  ShowFunctionDeleteDlgA                       = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszFileName: LPCSTR; fFolder: BOOL; dwFileCount: DWORD; dwFileSizeHigh: DWORD; dwFileSizeLow: DWORD): Integer; cdecl;
  ShowFunctionDeleteDlgW                       = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszFileName: LPCWSTR; fFolder: BOOL; dwFileCount: DWORD; dwFileSizeHigh: DWORD; dwFileSizeLow: DWORD): Integer; cdecl;
  FilterFunctionFileA                          = function(lpBatchOpData: LPCVFSBATCHOPDATA; lpszFile: LPCSTR; lpWFD: WIN32_FIND_DATAA; fSubFolderFilter: BOOL): BOOL; cdecl;
  FilterFunctionFileW                          = function(lpBatchOpData: LPCVFSBATCHOPDATA; lpszFile: LPCWSTR; lpWFD: WIN32_FIND_DATAW; fSubFolderFilter: BOOL): BOOL; cdecl;
  FilterFunctionFileExA                        = function(lpBatchData: PVFSBATCHDATAA; lpszFile: PCHAR; lpWFD: WIN32_FIND_DATAA): UINT; cdecl;
  FilterFunctionFileExW                        = function(lpBatchData: PVFSBATCHDATAW; lpszFile: PWCHAR; lpWFD: WIN32_FIND_DATAW): UINT; cdecl;
  AddFunctionFileChangeA                       = procedure(lpBatchOpData: LPCVFSBATCHOPDATA; fIsDest: BOOL; iType: Integer; lpszFile: LPCSTR); cdecl;
  AddFunctionFileChangeW                       = procedure(lpBatchOpData: LPCVFSBATCHOPDATA; fIsDest: BOOL; iType: Integer; lpszFile: LPCWSTR); cdecl;
  UpdateFunctionProgressBar                    = procedure(lpBatchOpData: LPCVFSBATCHOPDATA; uiAction: UINT; dwData: DWORD_PTR); cdecl;
  IsUSBInstall                                 = function: BOOL; cdecl;
  IsOpusLight                                  = function: BOOL; cdecl;
  DrawPictureFrameInDIB                        = function(var pBMI: TBitmapInfo; pBits: LPVOID; prc: PRect; iFrameSize: Integer; iShadowSize: Integer): BOOL; cdecl;
  GetFunctionWindow                            = function(lpVFSData: LPVFSFUNCDATA): HWND; cdecl;
  GetFunctionWindowEx                          = function(lpVFSData: LPVFSFUNCDATA; dwFlags: DWORD): HWND; cdecl;
  CalcCRC32                                    = function(dwCRCIn: DWORD; pData: PByte; dwSize: DWORD): DWORD; cdecl;
  GetProgramDirA                               = function(pszBuf: LPSTR; cchBufSize: Integer): BOOL; cdecl;
  GetProgramDirW                               = function(pszBuf: LPWSTR; cchBufSize: Integer): BOOL; cdecl;
  OpusRegOpenKeyW                              = function(hKey: OPUSREGKEY; lpSubKey: LPCWSTR; samDesired: REGSAM; phkResult: OPUSREGKEY): LONG; cdecl;
  OpusRegCreateKeyW                            = function(hKey: OPUSREGKEY; lpSubKey: LPCWSTR; samDesired: REGSAM; phkResult: OPUSREGKEY): LONG; cdecl;
  OpusRegQueryValueW                           = function(phKey: OPUSREGKEY; lpValueName: LPCWSTR; var lpType: DWORD; lpData: LPBYTE; var lpcbData: DWORD): LONG; cdecl;
  OpusRegCloseKey                              = function(phKey: OPUSREGKEY): LONG; cdecl;
  OpusRegDeleteKeyW                            = function(phKey: OPUSREGKEY; lpSubKey: LPCWSTR): LONG; cdecl;
  OpusRegDeleteValueW                          = function(phKey: OPUSREGKEY; lpValueName: LPCWSTR): LONG; cdecl;
  OpusRegSetValueW                             = function(phKey: OPUSREGKEY; lpValueName: LPCWSTR; dwType: DWORD; lpData: LPBYTE; cbData: DWORD): LONG; cdecl;
  OpusRegCheckElevation                        = function(phKey: OPUSREGKEY; hWnd: HWND): LONG; cdecl;
  CreateButtonIcons                            = function: HIMAGELIST; cdecl;
  ThumbnailCacheControl                        = function(var pData: TThumbCacheControlData): BOOL; cdecl;
  CreateDialogResizer                          = function(hWnd: HWND; iNumCtls: Integer; pCtls: LPDLGRESIZERCONTROL): THandle; cdecl;
  AddDialogResizerCtl                          = function(hResizer: THandle; hWnd: HWND; dwFlags: DWORD; idCtl: UINT_PTR): BOOL; cdecl;
  HandleDialogResizerMsg                       = function(hResizer: THandle; hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): BOOL; cdecl;
  FreeDialogResizer                            = procedure(hResizer: THandle); cdecl;
  GetGlyphSize                                 = function(iSet: Integer; psz: PSize): DWORD; cdecl;
  DrawGlyph                                    = procedure(iSet: Integer; iGlyph: Integer; hDC: HDC; prc: PRect; dwFlags: DWORD; crSolid: COLORREF); cdecl;
  GetString                                    = function(uiMsgId: UINT; pszStrBuf: PLPWSTR; cchBufSize: SIZE_T): SIZE_T; cdecl;
  GetAndFilterDialogTemplate                   = function(hInstance: HINST; lpszName: LPCWSTR; var lpdwSize: WORD; dwFlags: DWORD; pfFreeTemplate: PBOOL): PDlgTemplate; cdecl;
  GetLangDlg                                   = function(lpszID: LPWSTR; var lpdwSize: DWORD): PDlgTemplate; cdecl;
  GetLangDlgEx                                 = function(lpszID: LPWSTR; var lpdwSize: DWORD; dwFlags: DWORD; pfFreeTemplate: PBOOL): PDlgTemplate; cdecl;
  CreateLangDlg                                = function(hInstance: HINST; lpszID: LPWSTR; hWndParent: HWND; pfnDlgProc: TFNDlgProc; dwParam: DWORD_PTR): HWND; cdecl;
  CreateLangDlgEx                              = function(hInstance: HINST; lpszID: LPWSTR; hWndParent: HWND; pfnDlgProc: TFNDlgProc; dwParam: DWORD_PTR; dwFlags: DWORD): HWND; cdecl;
  LangDlgBox                                   = function(hInstance: HINST; lpszID: LPWSTR; hWndParent: HWND; pfnDlgProc: TFNDlgProc; dwParam: DWORD_PTR): INT_PTR; cdecl;
  LangDlgBoxEx                                 = function(hInstance: HINST; lpszID: LPWSTR; hWndParent: HWND; pfnDlgProc: TFNDlgProc; dwParam: DWORD_PTR; dwFlags: DWORD): INT_PTR; cdecl;
  SetOpusWindowIcon                            = procedure(hWnd: HWND; lpszIcon: LPWSTR); cdecl;
  HashInit                                     = function(HashType: UINT): THandle; cdecl;
  HashChunk                                    = procedure(hHash: THandle; pbData: PByte; cbData: UINT); cdecl;
  HashEnd                                      = function(hHash: THandle; HashType: UINT; pcbSize: PUINT): LPVOID; cdecl;
  HashFree                                     = procedure(hHash: THandle); cdecl;
  DOLoadImage                                  = function(var pData: TDOLoadImageData): BOOL; cdecl;
  AllocPatternMatch                            = function(pszPattern: LPCWSTR; dwPatFlags: DWORD; pfIsWild: PBOOL): THandle; cdecl;
  DoPatternMatch                               = function(hPattern: THandle; pszStr: LPCWSTR): BOOL; cdecl;
  FreePatternMatch                             = procedure(hPattern: THandle); cdecl;
  DOpusColorPicker                             = function(hWndButton: HWND; iID: Integer; crColor: COLORREF; dwFlags: DWORD; hwndNotify: HWND; uiNotifyMsg: UINT): COLORREF; cdecl;
  NumToStrBytesizeW                            = procedure(dwlBytes: DWORDLONG; lpszBuffer: LPWSTR; cchBufSize: Integer; dwFlags: DWORD; lpReserved: Pointer); cdecl;
  NumToStrIntW                                 = procedure(iNum: Integer; lpszBuffer: LPWSTR; cchBufSize: Integer; iBase: Integer); cdecl;
  NumToStrTimeSecsW                            = procedure(dwSeconds: DWORD; lpszBuffer: LPWSTR; cchBufSize: Integer; fWords: BOOL); cdecl;
  NumToStrDWordW                               = procedure(dwValue: DWORD; lpszBuffer: LPWSTR; cchBufSize: Integer; fAsPlainNumber: BOOL); cdecl;
  NumToStrDWordLongW                           = procedure(dwlValue: DWORDLONG; lpszBuffer: LPWSTR; cchBufSize: Integer; fBytes: BOOL; fPadBytes: BOOL; fAsPlainNumber: BOOL); cdecl;
  NumToStrDoubleW                              = procedure(dbVal: Double; lpszBuffer: LPWSTR; cchBufSize: Integer; iDecPlaces: Integer; fPlusMinus: BOOL); cdecl;
  CheckGlobalFilter                            = function(pwfd: WIN32_FIND_DATA; hOptionalFilterHandle: THandle): BOOL; cdecl;
  GetInlineProgressType                        = function(lpVFSData: LPVFSFUNCDATA; puiType: PUINT): BOOL; cdecl;
  ShowInlineProgress                           = function(lpVFSData: LPVFSFUNCDATA; var ppip: TDOpusInlineProgress): BOOL; cdecl;
  HideInlineProgress                           = function(lpVFSData: LPVFSFUNCDATA; uiType: UINT): BOOL; cdecl;
  SetInlineProgressText                        = function(lpVFSData: LPVFSFUNCDATA; uiType: UINT; pszText: LPCWSTR): BOOL; cdecl;
  SetInlineProgressValues                      = function(lpVFSData: LPVFSFUNCDATA; uiType: UINT; dwPos: DWORD; dwRange: DWORD): BOOL; cdecl;
  SetInlineProgressMarquee                     = function(lpVFSData: LPVFSFUNCDATA; uiType: UINT): BOOL; cdecl;
  GetSetWallpaperFile                          = function(var lpData: TGetSetWallpaperFileData): BOOL; cdecl;
  SetWallpaperImage                            = function(hBmpImage: HBITMAP; uiStyle: UINT): BOOL; cdecl;
  MapWallpaperStyleNameToId                    = function(pszName: LPCWSTR): Integer; cdecl;
  BumpFileNameW                                = function(lpszName: LPCWSTR; lpszBuffer: LPWSTR; cchBufSize: Integer; fOldFileAndFirstCall: BOOL): BOOL; cdecl;
  BumpFileNameA                                = function(lpszName: LPCSTR; lpszBuffer: LPSTR; cchBufSize: Integer; fOldFileAndFirstCall: BOOL): BOOL; cdecl;
  QueryPasswordPromptSuppression               = function: BOOL; cdecl;
  GetFunctionWildcardNameArgs                  = function(lpBatchOpData: LPCVFSBATCHOPDATA; pszCurrentFile: LPCWSTR; pszSourceWild: LPWSTR; cchSourceMax: UINT; pszDestWild: LPWSTR; cchDestMax: UINT): BOOL; cdecl;
  CreateBusyIndicator                          = function(lpVFSData: LPVFSFUNCDATA; var lpBusyData: TDOpusBusyIndicator): THandle; cdecl;
  ShowBusyIndicator                            = function(hBusyIndicator: THandle): BOOL; cdecl;
  HideBusyIndicator                            = function(hBusyIndicator: THandle): BOOL; cdecl;
  UpdateBusyIndicator                          = function(hBusyIndicator: THandle; pszDescription: LPCWSTR; iPercentComplete: Integer): BOOL; cdecl;
  RemoveBusyIndicator                          = function(hBusyIndicator: THandle): BOOL; cdecl;
  IsListerThread                               = function: BOOL; cdecl;
  GetPluginElevator                            = function(ppFileOp: IDOpusFileOperation; lpVFSData: LPVFSFUNCDATA; hWnd: HWND; pbTreatAsCancel: PBOOL): HRESULT; cdecl;
  GetArchiveCreationData                       = function(lpVFSData: LPVFSFUNCDATA): LPVOID; cdecl;
  ShowWarningIfProblemCausedByWindowBlinds     = function(hWndParentMustBeValid: HWND; fShowWarning: BOOL): BOOL; cdecl;
  OpusCoFreeUnusedLibraries                    = procedure; cdecl;
  DpiAwareAddIconsToImageList                  = function(var pData: TDPIImageListData; iResourceOptionCount: Integer; var pResourceOptions: TDPIResourceID): HIMAGELIST; cdecl;
  DpiScale                                     = function(x: Integer; iOriginalScaleFactor: Integer): Integer; cdecl;
  DpiDivide                                    = function(x: Integer; iOriginalScaleFactor: Integer): Integer; cdecl;
  IsHighDpi                                    = function: BOOL; cdecl;
  GetDIBitsWrapper                             = function(hdc: HDC; hbm: HBITMAP; start: UINT; cLines: UINT; lpvBits: LPVOID; lpbmi: PBitmapInfo; usage: UINT): Integer; cdecl;
  SetDIBitsWrapper                             = function(hdc: HDC; hbm: HBITMAP; start: UINT; cLines: UINT; lpBits: Pointer; lpbmi: PBitmapInfo; ColorUse: UINT): Integer; cdecl;
  SetDIBitsToDeviceWrapper                     = function(hdc: HDC; xDest: Integer; yDest: Integer; w: DWORD; h: DWORD; xSrc: Integer; ySrc: Integer; StartScan: UINT; cLines: UINT; const lpvBits: Pointer; const lpbmi: PBitmapInfo; ColorUse: UINT): Integer; cdecl;
  CreateDIBitmapWrapper                        = function(hdc: HDC; pbmih: PBitmapInfoHeader; flInit: DWORD; pjBits: Pointer; pbmi: PBitmapInfo; iUsage: UINT): HBITMAP; cdecl;
  StretchDIBitsWrapper                         = function(hdc: HDC; xDest: Integer; yDest: Integer; DestWidth: Integer; DestHeight: Integer; xSrc: Integer; ySrc: Integer; SrcWidth: Integer; SrcHeight: Integer; const lpBits: Pointer; const lpbmi: PBitmapInfo; iUsage: UINT; rop: DWORD): Integer; cdecl;
  PluginFixVistaCombo                          = procedure(hWnd: HWND; iCtlId: Integer; fTrapWheel: BOOL); cdecl;
  PluginFixAllVistaCombos                      = procedure(hWndParent: HWND; fTrapWheel: BOOL; fNudgeLikeThemedButtons: BOOL); cdecl;
  PluginFixVistaComboHandleMeasureAndDraw      = procedure(pfRes: PINT_PTR; hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM); cdecl;
  * ****************************************************************************** *}

{$IFDEF UNICODE}
  const
  FUNCNAME_DOPUSCHOOSEFONT              = 'DOpusChooseFontW';
  FUNCNAME_GETCONFIGPATH                = 'GetConfigPathW';
  FUNCNAME_LOADORSAVECONFIG             = 'LoadOrSaveConfigW';
  FUNCNAME_XMLLOADFILE                  = 'XMLLoadFileW';
  FUNCNAME_XMLSAVEFILE                  = 'XMLSaveFileW';
  FUNCNAME_XMLADDCHILDNODE              = 'XMLAddChildNodeW';
  FUNCNAME_XMLFINDCHILDNODE             = 'XMLFindChildNodeW';
  FUNCNAME_XMLENUMCHILDNODES            = 'XMLEnumChildNodesW';
  FUNCNAME_XMLGETNODENAME               = 'XMLGetNodeNameW';
  FUNCNAME_XMLSETNODENAME               = 'XMLSetNodeNameW';
  FUNCNAME_XMLGETNODEVALUE              = 'XMLGetNodeValueW';
  FUNCNAME_XMLSETNODEVALUE              = 'XMLSetNodeValueW';
  FUNCNAME_XMLGETNODELOGFONTVALUE       = 'XMLGetNodeLOGFONTValueW';
  FUNCNAME_XMLGETNODELOGFONTVALUEEX     = 'XMLGetNodeLOGFONTValueExW';
  FUNCNAME_XMLSETNODELOGFONTVALUE       = 'XMLSetNodeLOGFONTValueW';
  FUNCNAME_XMLGETNODEATTRIBUTE          = 'XMLGetNodeAttributeW';
  FUNCNAME_XMLSETNODEATTRIBUTE          = 'XMLSetNodeAttributeW';
  FUNCNAME_XMLGETNODEBOOLATTRIBUTE      = 'XMLGetNodeBoolAttributeW';
  FUNCNAME_XMLSETNODEBOOLATTRIBUTE      = 'XMLSetNodeBoolAttributeW';
  FUNCNAME_XMLGETNODEINTATTRIBUTE       = 'XMLGetNodeIntAttributeW';
  FUNCNAME_XMLSETNODEINTATTRIBUTE       = 'XMLSetNodeIntAttributeW';
  FUNCNAME_XMLGETNODEDWORDATTRIBUTE     = 'XMLGetNodeDWORDAttributeW';
  FUNCNAME_XMLSETNODEDWORDATTRIBUTE     = 'XMLSetNodeDWORDAttributeW';
  FUNCNAME_XMLGETNODEDWORDLONGATTRIBUTE = 'XMLGetNodeDWORDLONGAttributeW';
  FUNCNAME_XMLSETNODEDWORDLONGATTRIBUTE = 'XMLSetNodeDWORDLONGAttributeW';
  FUNCNAME_XMLDELETENODEATTRIBUTE       = 'XMLDeleteNodeAttributeW';
  FUNCNAME_SHOWREQUESTDLG               = 'ShowRequestDlgW';
  FUNCNAME_SHOWFUNCTIONNEWNAMEDLG       = 'ShowFunctionNewNameDlgW';
  FUNCNAME_GETWILDNEWNAME               = 'GetWildNewNameW';
  FUNCNAME_SHOWERRORDLG                 = 'ShowErrorDlgW';
  FUNCNAME_SHOWFUNCTIONERRORDLG         = 'ShowFunctionErrorDlgW';
  FUNCNAME_SHOWFUNCTIONREPLACEDLG       = 'ShowFunctionReplaceDlgW';
  FUNCNAME_SHOWFUNCTIONINITIALDELETEDLG = 'ShowFunctionInitialDeleteDlgW';
  FUNCNAME_SHOWFUNCTIONDELETEDLG        = 'ShowFunctionDeleteDlgW';
  FUNCNAME_FILTERFUNCTIONFILE           = 'FilterFunctionFileW';
  FUNCNAME_FILTERFUNCTIONFILEEX         = 'FilterFunctionFileExW';
  FUNCNAME_ADDFUNCTIONFILECHANGE        = 'AddFunctionFileChangeW';
  FUNCNAME_GETPROGRAMDIR                = 'GetProgramDirW';
  FUNCNAME_BUMPFILENAME                 = 'BumpFileNameW';
{$ELSE}
  FUNCNAME_DOPUSCHOOSEFONT              = 'DOpusChooseFontA';
  FUNCNAME_GETCONFIGPATH                = 'GetConfigPathA';
  FUNCNAME_LOADORSAVECONFIG             = 'LoadOrSaveConfigA';
  FUNCNAME_XMLLOADFILE                  = 'XMLLoadFileA';
  FUNCNAME_XMLSAVEFILE                  = 'XMLSaveFileA';
  FUNCNAME_XMLADDCHILDNODE              = 'XMLAddChildNodeA';
  FUNCNAME_XMLFINDCHILDNODE             = 'XMLFindChildNodeA';
  FUNCNAME_XMLENUMCHILDNODES            = 'XMLEnumChildNodesA';
  FUNCNAME_XMLGETNODENAME               = 'XMLGetNodeNameA';
  FUNCNAME_XMLSETNODENAME               = 'XMLSetNodeNameA';
  FUNCNAME_XMLGETNODEVALUE              = 'XMLGetNodeValueA';
  FUNCNAME_XMLSETNODEVALUE              = 'XMLSetNodeValueA';
  FUNCNAME_XMLGETNODELOGFONTVALUE       = 'XMLGetNodeLOGFONTValueA';
  FUNCNAME_XMLGETNODELOGFONTVALUEEX     = 'XMLGetNodeLOGFONTValueExA';
  FUNCNAME_XMLSETNODELOGFONTVALUE       = 'XMLSetNodeLOGFONTValueA';
  FUNCNAME_XMLGETNODEATTRIBUTE          = 'XMLGetNodeAttributeA';
  FUNCNAME_XMLSETNODEATTRIBUTE          = 'XMLSetNodeAttributeA';
  FUNCNAME_XMLGETNODEBOOLATTRIBUTE      = 'XMLGetNodeBoolAttributeA';
  FUNCNAME_XMLSETNODEBOOLATTRIBUTE      = 'XMLSetNodeBoolAttributeA';
  FUNCNAME_XMLGETNODEINTATTRIBUTE       = 'XMLGetNodeIntAttributeA';
  FUNCNAME_XMLSETNODEINTATTRIBUTE       = 'XMLSetNodeIntAttributeA';
  FUNCNAME_XMLGETNODEDWORDATTRIBUTE     = 'XMLGetNodeDWORDAttributeA';
  FUNCNAME_XMLSETNODEDWORDATTRIBUTE     = 'XMLSetNodeDWORDAttributeA';
  FUNCNAME_XMLGETNODEDWORDLONGATTRIBUTE = 'XMLGetNodeDWORDLONGAttributeA';
  FUNCNAME_XMLSETNODEDWORDLONGATTRIBUTE = 'XMLSetNodeDWORDLONGAttributeA';
  FUNCNAME_XMLDELETENODEATTRIBUTE       = 'XMLDeleteNodeAttributeA';
  FUNCNAME_SHOWREQUESTDLG               = 'ShowRequestDlgA';
  FUNCNAME_SHOWFUNCTIONNEWNAMEDLG       = 'ShowFunctionNewNameDlgA';
  FUNCNAME_GETWILDNEWNAME               = 'GetWildNewNameA';
  FUNCNAME_SHOWERRORDLG                 = 'ShowErrorDlgA';
  FUNCNAME_SHOWFUNCTIONERRORDLG         = 'ShowFunctionErrorDlgA';
  FUNCNAME_SHOWFUNCTIONREPLACEDLG       = 'ShowFunctionReplaceDlgA';
  FUNCNAME_SHOWFUNCTIONINITIALDELETEDLG = 'ShowFunctionInitialDeleteDlgA';
  FUNCNAME_SHOWFUNCTIONDELETEDLG        = 'ShowFunctionDeleteDlgA';
  FUNCNAME_FILTERFUNCTIONFILE           = 'FilterFunctionFileA';
  FUNCNAME_FILTERFUNCTIONFILEEX         = 'FilterFunctionFileExA';
  FUNCNAME_ADDFUNCTIONFILECHANGE        = 'AddFunctionFileChangeA';
  FUNCNAME_GETPROGRAMDIR                = 'GetProgramDirA';
  FUNCNAME_BUMPFILENAME                 = 'BumpFileNameA';
{$ENDIF}

  FUNCNAME_GETTHUMBNAILPREFS                        = 'GetThumbnailPrefs';
  FUNCNAME_XMLLOADDATA                              = 'XMLLoadData';
  FUNCNAME_XMLSAVEDATA                              = 'XMLSaveData';
  FUNCNAME_XMLCREATEFILE                            = 'XMLCreateFile';
  FUNCNAME_XMLFREEFILE                              = 'XMLFreeFile';
  FUNCNAME_XMLFIRSTCHILDNODE                        = 'XMLFirstChildNode';
  FUNCNAME_XMLNEXTNODE                              = 'XMLNextNode';
  FUNCNAME_XMLGETNODEBOOLVALUE                      = 'XMLGetNodeBoolValue';
  FUNCNAME_XMLSETNODEBOOLVALUE                      = 'XMLSetNodeBoolValue';
  FUNCNAME_XMLGETNODEINTVALUE                       = 'XMLGetNodeIntValue';
  FUNCNAME_XMLSETNODEINTVALUE                       = 'XMLSetNodeIntValue';
  FUNCNAME_XMLGETNODEDWORDVALUE                     = 'XMLGetNodeDWORDValue';
  FUNCNAME_XMLSETNODEDWORDVALUE                     = 'XMLSetNodeDWORDValue';
  FUNCNAME_XMLGETNODEDWORDLONGVALUE                 = 'XMLGetNodeDWORDLONGValue';
  FUNCNAME_XMLSETNODEDWORDLONGVALUE                 = 'XMLSetNodeDWORDLONGValue';
  FUNCNAME_XMLGETNODEBINARYVALUE                    = 'XMLGetNodeBinaryValue';
  FUNCNAME_XMLSETNODEBINARYVALUE                    = 'XMLSetNodeBinaryValue';
  FUNCNAME_XMLDELETECHILD                           = 'XMLDeleteChild';
  FUNCNAME_XMLDELETEALLCHILDNODES                   = 'XMLDeleteAllChildNodes';
  FUNCNAME_XMLDELETEALLNODEATTRIBUTES               = 'XMLDeleteAllNodeAttributes';
  FUNCNAME_UPDATEFUNCTIONPROGRESSBAR                = 'UpdateFunctionProgressBar';
  FUNCNAME_ISUSBINSTALL                             = 'IsUSBInstall';
  FUNCNAME_ISOPUSLIGHT                              = 'IsOpusLight';
  FUNCNAME_DRAWPICTUREFRAMEINDIB                    = 'DrawPictureFrameInDIB';
  FUNCNAME_GETFUNCTIONWINDOW                        = 'GetFunctionWindow';
  FUNCNAME_GETFUNCTIONWINDOWEX                      = 'GetFunctionWindowEx';
  FUNCNAME_CALCCRC32                                = 'CalcCRC32';
  FUNCNAME_OPUSREGOPENKEYW                          = 'OpusRegOpenKeyW';
  FUNCNAME_OPUSREGCREATEKEYW                        = 'OpusRegCreateKeyW';
  FUNCNAME_OPUSREGQUERYVALUEW                       = 'OpusRegQueryValueW';
  FUNCNAME_OPUSREGCLOSEKEY                          = 'OpusRegCloseKey';
  FUNCNAME_OPUSREGDELETEKEYW                        = 'OpusRegDeleteKeyW';
  FUNCNAME_OPUSREGDELETEVALUEW                      = 'OpusRegDeleteValueW';
  FUNCNAME_OPUSREGSETVALUEW                         = 'OpusRegSetValueW';
  FUNCNAME_OPUSREGCHECKELEVATION                    = 'OpusRegCheckElevation';
//  FUNCNAME_DISABLEWOW64REDIRECTION                  = 'DisableWow64Redirection';
//  FUNCNAME_REVERTWOW64REDIRECTION                   = 'RevertWow64Redirection';
  FUNCNAME_CREATEBUTTONICONS                        = 'CreateButtonIcons';
  FUNCNAME_THUMBNAILCACHECONTROL                    = 'ThumbnailCacheControl';
  FUNCNAME_CREATEDIALOGRESIZER                      = 'CreateDialogResizer';
  FUNCNAME_ADDDIALOGRESIZERCTL                      = 'AddDialogResizerCtl';
  FUNCNAME_HANDLEDIALOGRESIZERMSG                   = 'HandleDialogResizerMsg';
  FUNCNAME_FREEDIALOGRESIZER                        = 'FreeDialogResizer';
  FUNCNAME_GETGLYPHSIZE                             = 'GetGlyphSize';
  FUNCNAME_DRAWGLYPH                                = 'DrawGlyph';
  FUNCNAME_GETSTRING                                = 'GetString';
  FUNCNAME_GETANDFILTERDIALOGTEMPLATE               = 'GetAndFilterDialogTemplate';
  FUNCNAME_GETLANGDLG                               = 'GetLangDlg';
  FUNCNAME_GETLANGDLGEX                             = 'GetLangDlgEx';
  FUNCNAME_CREATELANGDLG                            = 'CreateLangDlg';
  FUNCNAME_CREATELANGDLGEX                          = 'CreateLangDlgEx';
  FUNCNAME_LANGDLGBOX                               = 'LangDlgBox';
  FUNCNAME_LANGDLGBOXEX                             = 'LangDlgBoxEx';
  FUNCNAME_SETOPUSWINDOWICON                        = 'SetOpusWindowIcon';
  FUNCNAME_HASHINIT                                 = 'HashInit';
  FUNCNAME_HASHCHUNK                                = 'HashChunk';
  FUNCNAME_HASHEND                                  = 'HashEnd';
  FUNCNAME_HASHFREE                                 = 'HashFree';
  FUNCNAME_DOLOADIMAGE                              = 'DOLoadImage';
  FUNCNAME_ALLOCPATTERNMATCH                        = 'AllocPatternMatch';
  FUNCNAME_DOPATTERNMATCH                           = 'DoPatternMatch';
  FUNCNAME_FREEPATTERNMATCH                         = 'FreePatternMatch';
  FUNCNAME_DOPUSCOLORPICKER                         = 'DOpusColorPicker';
  FUNCNAME_NUMTOSTRBYTESIZEW                        = 'NumToStrBytesizeW';
  FUNCNAME_NUMTOSTRINTW                             = 'NumToStrIntW';
  FUNCNAME_NUMTOSTRTIMESECSW                        = 'NumToStrTimeSecsW';
  FUNCNAME_NUMTOSTRDWORDW                           = 'NumToStrDWordW';
  FUNCNAME_NUMTOSTRDWORDLONGW                       = 'NumToStrDWordLongW';
  FUNCNAME_NUMTOSTRDOUBLEW                          = 'NumToStrDoubleW';
  FUNCNAME_CHECKGLOBALFILTER                        = 'CheckGlobalFilter';
  FUNCNAME_GETINLINEPROGRESSTYPE                    = 'GetInlineProgressType';
  FUNCNAME_SHOWINLINEPROGRESS                       = 'ShowInlineProgress';
  FUNCNAME_HIDEINLINEPROGRESS                       = 'HideInlineProgress';
  FUNCNAME_SETINLINEPROGRESSTEXT                    = 'SetInlineProgressText';
  FUNCNAME_SETINLINEPROGRESSVALUES                  = 'SetInlineProgressValues';
  FUNCNAME_SETINLINEPROGRESSMARQUEE                 = 'SetInlineProgressMarquee';
  FUNCNAME_GETSETWALLPAPERFILE                      = 'GetSetWallpaperFile';
  FUNCNAME_SETWALLPAPERIMAGE                        = 'SetWallpaperImage';
  FUNCNAME_MAPWALLPAPERSTYLENAMETOID                = 'MapWallpaperStyleNameToId';
  FUNCNAME_QUERYPASSWORDPROMPTSUPPRESSION           = 'QueryPasswordPromptSuppression';
  FUNCNAME_GETFUNCTIONWILDCARDNAMEARGS              = 'GetFunctionWildcardNameArgs';
  FUNCNAME_CREATEBUSYINDICATOR                      = 'CreateBusyIndicator';
  FUNCNAME_SHOWBUSYINDICATOR                        = 'ShowBusyIndicator';
  FUNCNAME_HIDEBUSYINDICATOR                        = 'HideBusyIndicator';
  FUNCNAME_UPDATEBUSYINDICATOR                      = 'UpdateBusyIndicator';
  FUNCNAME_REMOVEBUSYINDICATOR                      = 'RemoveBusyIndicator';
  FUNCNAME_ISLISTERTHREAD                           = 'IsListerThread';
  FUNCNAME_GETPLUGINELEVATOR                        = 'GetPluginElevator';
  FUNCNAME_GETARCHIVECREATIONDATA                   = 'GetArchiveCreationData';
  FUNCNAME_SHOWWARNINGIFPROBLEMCAUSEDBYWINDOWBLINDS = 'ShowWarningIfProblemCausedByWindowBlinds';
  FUNCNAME_OPUSCOFREEUNUSEDLIBRARIES                = 'OpusCoFreeUnusedLibraries';
  FUNCNAME_DPIAWAREADDICONSTOIMAGELIST              = 'DpiAwareAddIconsToImageList';
  FUNCNAME_DPISCALE                                 = 'DpiScale';
  FUNCNAME_DPIDIVIDE                                = 'DpiDivide';
  FUNCNAME_ISHIGHDPI                                = 'IsHighDpi';
  FUNCNAME_GETDIBITSWRAPPER                         = 'GetDIBitsWrapper';
  FUNCNAME_SETDIBITSWRAPPER                         = 'SetDIBitsWrapper';
  FUNCNAME_SETDIBITSTODEVICEWRAPPER                 = 'SetDIBitsToDeviceWrapper';
  FUNCNAME_CREATEDIBITMAPWRAPPER                    = 'CreateDIBitmapWrapper';
  FUNCNAME_STRETCHDIBITSWRAPPER                     = 'StretchDIBitsWrapper';
  FUNCNAME_FIXVISTACOMBO                            = 'PluginFixVistaCombo';
  FUNCNAME_FIXALLVISTACOMBOS                        = 'PluginFixAllVistaCombos';
  FUNCNAME_FIXVISTACOMBOHANDLEMEASUREANDDRAW        = 'PluginFixVistaComboHandleMeasureAndDraw';
{$ENDREGION}

type
  PDOAPIFuncRec = ^TDOAPIFuncRec;
  TDOAPIFuncRec = record
    Name: string;
    Func: Pointer;
  end;
  
implementation

class function TDOpusPluginHelperBase.Dll: HMODULE;
begin
  Result := GetModuleHandle('dopus.exe');
end;

class function TDOpusPluginHelperBase.DOAPI_GetConfigPath(iPathType: Integer; pszBuf: LPWSTR; cchMax: UINT): BOOL; external 'dopus.exe' name 'GetConfigPathW';
class function TDOpusPluginHelperBase.DOAPI_GetProgramDir(pszBuf: LPWSTR; cchBufSize: Integer): BOOL; cdecl; external 'dopus.exe' name 'GetProgramDirW';

class function TDOpusPluginHelperBase.GetPath(iPathType: Integer): string;
begin
  FillChar(PathBuffer, 0, MAX_PATH);
  case iPathType of
    0, 1: DOAPI_GetConfigPath(iPathType, @PathBuffer, MAX_PATH);
    2   : DOAPI_GetProgramDir(@PathBuffer, MAX_PATH)
  end;
  Result := WideCharToString(PathBuffer);  
end;


end.

