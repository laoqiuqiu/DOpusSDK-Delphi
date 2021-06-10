{/*
   Directory Opus 12 Viewer Plugins Header File
*/}
unit DOPlugin.Types;

interface

uses
  DOPlugin.Consts,
  Winapi.Windows,
  Winapi.ActiveX;

type

{$REGION 'Viewer types'}

  PViewerPluginInfoW = ^TViewerPluginInfoW;
  DOpusViewerPluginInfoW = record
    cbSize               : UINT;         // Structure size
    dwFlags              : DWORD;        // Flags
    dwVersionHigh        : DWORD;        // Version (high)
    dwVersionLow         : DWORD;        // Version (low)
    lpszHandleExts       : PWideChar;    // File extensions the plugin handles, eg ".xxx;.yyy;.zzz"
    lpszName             : PWideChar;    // Plugin primary file format name, eg "JPEG"
    lpszDescription      : PWideChar;    // Plugin description string, eg "Directory Opus JPEG Viewer"
    lpszCopyright        : PWideChar;    // Copyright string, eg "(c) 2001 GP Software"
    lpszURL              : PWideChar;    // Reference URL, eg "http://www.gpsoft.com.au"
    cchHandleExtsMax     : UINT;         // Max. length of buffer
    cchNameMax           : UINT;         // Max. length of buffer
    cchDescriptionMax    : UINT;         // Max. length of buffer
    cchCopyrightMax      : UINT;         // Max. length of buffer
    cchURLMax            : UINT;         // Max. length of buffer
    dwlMinFileSize       : DWORDLONG;    // Minimum size of file that we handle
    dwlMaxFileSize       : DWORDLONG;    // Maximum size of file that we handle
    dwlMinPreviewFileSize: DWORDLONG;    // Minimum size of file that we handle in preview mode
    dwlMaxPreviewFileSize: DWORDLONG;    // Maximum size of file that we handle in preview mode
    uiMajorFileType      : UINT;         // Primary type of file this plugin handles
    idPlugin             : TGUID;        // Unique identifier for this plugin
    dwOpusVerMajor       : DWORD;        // Opus major version
    dwOpusVerMinor       : DWORD;        // Opus minor version
    dwInitFlags          : DWORD;        // Initialisation flags
    hIconSmall           : HICON;        // Small icon (Opus will call DestroyIcon on this)
    hIconLarge           : HICON;        // Large icon (Opus will call DestroyIcon on this)
  end;
  VIEWERPLUGININFOW   = DOpusViewerPluginInfoW;
  LPVIEWERPLUGININFOW = ^DOpusViewerPluginInfoW;
  TViewerPluginInfoW  = DOpusViewerPluginInfoW;

  PViewerPluginInfoA = ^TViewerPluginInfoA;
  DOpusViewerPluginInfoA = record
    cbSize               : UINT;
    dwFlags              : DWORD;
    dwVersionHigh        : DWORD;
    dwVersionLow         : DWORD;
    lpszHandleExts       : PAnsiChar;
    lpszName             : PAnsiChar;
    lpszDescription      : PAnsiChar;
    lpszCopyright        : PAnsiChar;
    lpszURL              : PAnsiChar;
    cchHandleExtsMax     : UINT;
    cchNameMax           : UINT;
    cchDescriptionMax    : UINT;
    cchCopyrightMax      : UINT;
    cchURLMax            : UINT;
    dwlMinFileSize       : DWORDLONG;
    dwlMaxFileSize       : DWORDLONG;
    dwlMinPreviewFileSize: DWORDLONG;
    dwlMaxPreviewFileSize: DWORDLONG;
    uiMajorFileType      : UINT;
    idPlugin             : TGUID;
    dwOpusVerMajor       : DWORD;
    dwOpusVerMinor       : DWORD;
    dwInitFlags          : DWORD;
    hIconSmall           : HICON;
    hIconLarge           : HICON;
  end;
  VIEWERPLUGININFOA   = DOpusViewerPluginInfoA;
  LPVIEWERPLUGININFOA = ^DOpusViewerPluginInfoA;
  TViewerPluginInfoA  = DOpusViewerPluginInfoA;

  {$IFdef UNICODE}
  TViewerPluginInfo  = TViewerPluginInfoW;
  PViewerPluginInfo  = PViewerPluginInfoW;
  VIEWERPLUGININFO   = VIEWERPLUGININFOW;
  LPVIEWERPLUGININFO = LPVIEWERPLUGININFOW;
  {$ELSE}
  TViewerPluginInfo  = TViewerPluginInfoA
  PViewerPluginInfo  = PViewerPluginInfoA;
  VIEWERPLUGININFO   = VIEWERPLUGININFOA;
  LPVIEWERPLUGININFO = LPVIEWERPLUGININFOA;
  {$ENDIF}

  DWORD_Array = array[0..7] of DWORD;
  PViewerPluginFileInfoW = ^TViewerPluginFileInfoW;
  DOpusViewerPluginFileInfoW = record
    cbSize            : UINT;
    dwFlags           : DWORD;
    wMajorType        : WORD;
    wMinorType        : WORD;
    szImageSize       : SIZE;
    iNumBits          : Integer;
    lpszInfo          : PWideChar;
    cchInfoMax        : UINT;
    dwPrivateData     : DWORD_Array; // array[0..7] of DWORD;
    szResolution      : SIZE;
    iTypeHint         : Integer;
    crTransparentColor: COLORREF;
    wThumbnailQuality : WORD;
    dwlFileSize       : DWORDLONG;
    iColorSpace       : Integer;
  end;
  VIEWERPLUGINFILEINFOW   = DOpusViewerPluginFileInfoW;
  LPVIEWERPLUGINFILEINFOW = ^DOpusViewerPluginFileInfoW;
  TViewerPluginFileInfoW  = DOpusViewerPluginFileInfoW;

  PViewerPluginFileInfoA = ^TViewerPluginFileInfoA;
  DOpusViewerPluginFileInfoA = record
    cbSize            : UINT;
    dwFlags           : DWORD;
    wMajorType        : WORD;
    wMinorType        : WORD;
    szImageSize       : SIZE;
    iNumBits          : Integer;
    lpszInfo          : PAnsiChar;
    cchInfoMax        : UINT;
    dwPrivateData     : DWORD_Array; //array[0..7] of DWORD;
    szResolution      : SIZE;
    iTypeHint         : Integer;
    crTransparentColor: COLORREF;
    wThumbnailQuality : WORD;
    dwlFileSize       : DWORDLONG;
    iColorSpace       : Integer;
  end;
  VIEWERPLUGINFILEINFOA   = DOpusViewerPluginFileInfoA;
  LPVIEWERPLUGINFILEINFOA = ^DOpusViewerPluginFileInfoA;
  TViewerPluginFileInfoA  = DOpusViewerPluginFileInfoA;

  {$IFDEF UNICODE}
  TViewerPluginFileInfo        = TViewerPluginFileInfoW;
  PViewerPluginFileInfo        = PViewerPluginFileInfoW;
  VIEWERPLUGINFILEINFO         = VIEWERPLUGINFILEINFOW;
  LPVIEWERPLUGINFILEINFO       = LPVIEWERPLUGINFILEINFOW;
  {$ELSE}
  TViewerPluginFileInfo        = VIEWERPLUGINFILEINFOA;
  PViewerPluginFileInfo        = PViewerPluginFileInfoA;
  VIEWERPLUGINFILEINFO         = VIEWERPLUGINFILEINFOA;
  LPVIEWERPLUGINFILEINFO       = LPVIEWERPLUGINFILEINFOA;
  {$ENDIF}

{$IF NOT DECLARED(LPSTREAM)}
  PIStream = ^IStream;
  LPSTREAM = PIStream;
{$ENDIF}

  // Notification structure for DVPN_SIZECHANGE
  PDVPNMSizeChange = ^TDVPNMSizeChange;
  tagDVPNMSIZECHANGE = record
    hdr   : NMHDR;
    szSize: SIZE;
  end;
  DVPNMSIZECHANGE   = tagDVPNMSIZECHANGE;
  LPDVPNMSIZECHANGE = ^tagDVPNMSIZECHANGE;
  TDVPNMSizeChange  = tagDVPNMSIZECHANGE;

  // Notification structure for DVPN_CLICK
  PDVPNMClick = ^TDVPNMClick;
  tagDVPNMCLICK = record
    hdr  : NMHDR;
    pt   : Pointer;
    fMenu: BOOL;
  end;
  DVPNMCLICK   = tagDVPNMCLICK;
  LPDVPNMCLICK = ^tagDVPNMCLICK;
  TDVPNMClick  = tagDVPNMCLICK;

  // Notification structure for DVPN_RESETZOOM
  PDVPNMResetZoom = ^TDVPNMResetZoom;
  tagDVPNMRESETZOOM = record
    hdr  : NMHDR;
    iZoom: Integer;
  end;
  DVPNMRESETZOOM   = tagDVPNMRESETZOOM;
  LPDVPNMRESETZOOM = ^tagDVPNMRESETZOOM;
  TDVPNMResetZoom  = tagDVPNMRESETZOOM;

  // Notification structure for DVPN_FOCUSCHANGE
  PDVPNMFocusChange = ^TDVPNMFocusChange;
  tagDVPNMFOCUSCHANGE = record
    hdr      : NMHDR;
    fGotFocus: BOOL;
  end;
  DVPNMFOCUSCHANGE   = tagDVPNMFOCUSCHANGE;
  LPDVPNMFOCUSCHANGE = ^tagDVPNMFOCUSCHANGE;
  TDVPNMFocusChange  = tagDVPNMFOCUSCHANGE;

  // Notification structure for DVPN_CAPABILITIES
  PDVPNMCapabilities = ^TDVPNMCapabilities;
  tagDVPNMCAPABILITIES = record
    hdr           : NMHDR;
    dwCapabilities: DWORD;
  end;
  DVPNMCAPABILITIES   = tagDVPNMCAPABILITIES;
  LPDVPNMCAPABILITIES = ^tagDVPNMCAPABILITIES;
  TDVPNMCapabilities  = tagDVPNMCAPABILITIES;

  // Notification structure for DVPN_STATUSTEXT
  PDVPNMStatusText = ^TDVPNMStatusText;
  tagDVPNMSTATUSTEXT = record
    hdr           : NMHDR;
    lpszStatusText: PChar;
    fUnicode      : BOOL;
  end;
  DVPNMSTATUSTEXT   = tagDVPNMSTATUSTEXT;
  LPDVPNMSTATUSTEXT = ^tagDVPNMSTATUSTEXT;
  TDVPNMStatusText  = tagDVPNMSTATUSTEXT;

  // Notification structure for DVPN_LOADNEWFILE
  PDVPNMLoadNewFile = ^TDVPNMLoadNewFile;
  tagDVPNMLOADNEWFILE = record
    hdr         : NMHDR;
    lpszFilename: PChar;
    fUnicode    : BOOL;
    lpStream    : LPSTREAM;
  end;
  DVPNMLOADNEWFILE   = tagDVPNMLOADNEWFILE;
  LPDVPNMLOADNEWFILE = ^tagDVPNMLOADNEWFILE;
  TDVPNMLoadNewFile  = tagDVPNMLOADNEWFILE;

  // Notification structure for DVPN_SETCURSOR
  PDVPNMSetCursor = ^TDVPNMSetCursor;
  tagDVPNMSETCURSOR = record
    hdr       : NMHDR;
    pt        : Pointer;
    fMenu     : BOOL;
    fCanScroll: BOOL;
    iCursor   : Integer;
  end;
  DVPNMSETCURSOR   = tagDVPNMSETCURSOR;
  LPDVPNMSETCURSOR = ^tagDVPNMSETCURSOR;
  TDVPNMSetCursor  = tagDVPNMSETCURSOR;

  // Notification structure for DVPN_GETGAMMA
  PDVPNMGamma = ^TDVPNMGamma;
  tagDVPNMGAMMA = record
    hdr    : NMHDR;
    fEnable: BOOL;
    dbGamma: Double;
  end;
  DVPNMGAMMA   = tagDVPNMGAMMA;
  LPDVPNMGAMMA = ^tagDVPNMGAMMA;
  TDVPNMGamma  = tagDVPNMGAMMA;

  // Notification structure for DVPN_BUTTONOPTS
  PDVPNMButtonOpts = ^TDVPNMButtonOpts;
  tagDVPNMBUTTONOPTS = record
    hdr    : NMHDR;
    iLeft  : Integer;
    iRight : Integer;
    iMiddle: Integer;
  end;
  DVPNMBUTTONOPTS   = tagDVPNMBUTTONOPTS;
  LPDVPNMBUTTONOPTS = ^tagDVPNMBUTTONOPTS;
  TDVPNMButtonOpts  = tagDVPNMBUTTONOPTS;


  // Notification structure for DVPN_GETCURSORS
  PDVPNMGetCursors = ^TDVPNMGetCursors;
  tagDVPNMGETCURSORS = record
    hdr           : NMHDR;
    hCurHandOpen  : HCURSOR;
    hCurHandClosed: HCURSOR;
    hCurCrosshair : HCURSOR;
  end;
  DVPNMGETCURSORS   = tagDVPNMGETCURSORS;
  LPDVPNMGETCURSORS = ^tagDVPNMGETCURSORS;
  TDVPNMGetCursors  = tagDVPNMGETCURSORS;


  // Notification structure for DVPN_MOUSEWHEEL and DVPN_MOUSEHORIZWHEEL
  PDVPNMMouseWheel = ^TDVPNMMouseWheel;
  tagDVPNMMOUSEWHEEL = record
    hdr   : NMHDR;
    wParam: WPARAM;
    lParam: LPARAM;
  end;
  DVPNMMOUSEWHEEL   = tagDVPNMMOUSEWHEEL;
  LPDVPNMMOUSEWHEEL = ^tagDVPNMMOUSEWHEEL;
  TDVPNMMouseWheel  = tagDVPNMMOUSEWHEEL;



  // Notification structure for DVPN_HEXSTATE
  PDVNMHexState = ^TDVNMHexState;
  tagDVPNMHEXSTATE = record
    hdr   : NMHDR;
    fState: BOOL;
  end;
  DVNMHEXSTATE    = tagDVPNMHEXSTATE;
  LPDVPNMHEXSTATE = ^tagDVPNMHEXSTATE;
  TDVNMHexState   = tagDVPNMHEXSTATE;

  // Notification structure for DVPN_TRANSLATEACCEL
  PDVPNMTranslateAccel = ^TDVPNMTranslateAccel;
  tagDVPNMTRANSLATEACCEL = record
    hdr     : NMHDR;
    &message: UINT;
    wParam  : WPARAM;
    lParam  : LPARAM;
  end;
  DVPNMTRANSLATEACCEL   = tagDVPNMTRANSLATEACCEL;
  LPDVPNMTRANSLATEACCEL = ^tagDVPNMTRANSLATEACCEL;
  TDVPNMTranslateAccel  = tagDVPNMTRANSLATEACCEL;

  // Notification structure for DVPN_LISTERBUSY
  PDVPNMListerBusy = ^TDVPNMListerBusy;
  tagDVPNMLISTERBUSY = record
    hdr  : NMHDR;
    fBusy: BOOL;
  end;
  DVPNMLISTERBUSY   = tagDVPNMLISTERBUSY;
  LPDVPNMLISTERBUSY = ^tagDVPNMLISTERBUSY;
  TDVPNMListerBusy  = tagDVPNMLISTERBUSY;

  // Notification structure for DVPN_CALCULATERECT
  PDVPNMCalculateRect = ^TDVPNMCalculateRect;
  tagDVPNMCALCULATERECT = record
    hdr      : NMHDR;
    rc       : TRect;              // Output rectangle. Also an input for some operations.
    operation: UINT;               // One of the VPCALCRECT_ values.
    flags    : DWORD;              // Reserved. Pass zero.
    rc2      : TRect;              // May be used by some operations.
    rc3      : TRect;              // May be used by some operations.
  end;
  DVPNMCALCULATERECT   = tagDVPNMCALCULATERECT;
  LPDVPNMCALCULATERECT = ^tagDVPNMCALCULATERECT;
  TDVPNMCalculateRect  = tagDVPNMCALCULATERECT;

  // Notification structure for DVPN_SETRESELECT
  PDVPNMSetReselect = ^TDVPNMSetReselect;
  tagDVPNMSETRESELECT = record
    hdr        : NMHDR;
    rcSelection: TRect;
  end;
  DVPNMSETRESELECT   = tagDVPNMSETRESELECT;
  LPDVPNMSETRESELECT = ^tagDVPNMSETRESELECT;
  TDVPNMSetReselect  = tagDVPNMSETRESELECT;

  // Notification structure for DVPN_SELCHANGED
  PDVPNMSelChanged = ^TDVPNMSelChanged;
  tagDVPNMSELCHANGED = record
    hdr        : NMHDR;
    rcSelection: TRect;
  end;
  DVPNMSELCHANGED   = tagDVPNMSELCHANGED;
  LPDVPNMSELCHANGED = ^tagDVPNMSELCHANGED;
  TDVPNMSelChanged  = tagDVPNMSELCHANGED;

  // Structure used to add items to the context menu
  PDVPContextMenuItemA = ^TDVPContextMenuItemA;
  DVPContextMenuItemA = record
    lpszLabel: PAnsiChar;
    dwFlags  : DWORD;
    uID      : UINT;
  end;
  LPDVPCONTEXTMENUITEMA = ^DVPContextMenuItemA;
  TDVPContextMenuItemA  = DVPContextMenuItemA;

  PDVPContextMenuItemW = ^TDVPContextMenuItemW;
  DVPContextMenuItemW = record
    lpszLabel: PWideChar;
    dwFlags  : DWORD;
    uID      : UINT;
  end;
  LPDVPCONTEXTMENUITEMW = ^DVPContextMenuItemW;
  TDVPContextMenuItemW  = DVPContextMenuItemW;

  {$IFDEF UNICODE}
  TDVPContextMenuItem  = TDVPContextMenuItemW;
  DVPCONTEXTMENUITEM   = DVPCONTEXTMENUITEMW;
  LPDVPCONTEXTMENUITEM = LPDVPCONTEXTMENUITEMW;
  {$ELSE}
  TDVPContextMenuItem  = TDVPContextMenuItemA;
  DVPCONTEXTMENUITEM   = DVPCONTEXTMENUITEMA;
  LPDVPCONTEXTMENUITEM = LPDVPCONTEXTMENUITEMA;
  {$ENDIF}

  PDVPContextMenus  = ^TDVPContextMenus;
  TDVPContextMenus  = array of TDVPContextMenuItem;
  LPDVPContextMenus = PDVPContextMenus;

  // DVP_USBSafe not supported in Opus 10
  //{$IF VIEWERPLUGINVERSION < 5}
  // Structure passed to DVP_USBSafe function
  {$IFNDEF DEF_OPUSUSBSAFEDATA}
  {$DEFINE DEF_OPUSUSBSAFEDATA}
  POpusUSBSafeData = ^TOpusUSBSafeData;
  OpusUSBSafeData = record
    cbSize         : UINT;
    pszOtherExports: PWideChar;
    cchOtherExports: UINT;
  end;
  //  OPUSUSBSAFEDATA   = OpusUSBSafeData;
  LPOPUSUSBSAFEDATA = ^OpusUSBSafeData;
  TOpusUSBSafeData  = OpusUSBSafeData;
  {$ENDIF}
  //{$ENDIF}

  PDVPLoadTextDataA = ^TDVPLoadTextDataA;
  DVPLoadTextDataA = record
    cbSize            : UINT;
    dwFlags           : DWORD;
    hWndParent        : HWND;
    lpszFile          : PAnsiChar;
    lpInStream        : LPSTREAM;
    dwStreamFlags     : DWORD;
    lpOutStream       : LPSTREAM;
    iOutTextType      : Integer;
    tchPreferredViewer: array[0..39] of AnsiChar;
    hAbortEvent       : THandle;
  end;
  LPDVPLOADTEXTDATAA = ^DVPLoadTextDataA;
  TDVPLoadTextDataA  = DVPLoadTextDataA;

  PDVPLoadTextDataW = ^TDVPLoadTextDataW;
  DVPLoadTextDataW = record
    cbSize            : UINT;
    dwFlags           : DWORD;
    hWndParent        : HWND;
    lpszFile          : PWideChar;
    lpInStream        : LPSTREAM;
    dwStreamFlags     : DWORD;
    lpOutStream       : LPSTREAM;
    iOutTextType      : Integer;
    tchPreferredViewer: array[0..39] of WideChar;
    hAbortEvent       : THandle;
  end;
  LPDVPLOADTEXTDATAW = ^DVPLoadTextDataW;
  TDVPLoadTextDataW  = DVPLoadTextDataW;

  {$IFDEF UNICODE}
  DVPLOADTEXTDATA   = DVPLOADTEXTDATAW;
  LPDVPLOADTEXTDATA = LPDVPLOADTEXTDATAW;
  TDVPLoadTextData  = TDVPLoadTextDataW;
  {$ELSE}
  DVPLOADTEXTDATA   = DVPLOADTEXTDATAA;
  LPDVPLOADTEXTDATA = LPDVPLOADTEXTDATAA;
  TDVPLoadTextData  = TDVPLoadTextDataW;
  {$ENDIF}

  // File Info stuff
  PDVPFileInfoHeader = ^TDVPFileInfoHeader;
  DVPFileInfoHeader = record
    cbSize     : UINT;
    uiMajorType: UINT;
    dwFlags    : DWORD;
  end;
  LPDVPFILEINFOHEADER = ^DVPFileInfoHeader;
  TDVPFileInfoHeader  = DVPFileInfoHeader;

  PDVPFileInfoMusicA = ^TDVPFileInfoMusicA;
  DVPFileInfoMusicA = record
    hdr              : DVPFILEINFOHEADER;
    lpszAlbum        : PAnsiChar;
    cchAlbumMax      : UINT;
    lpszArtist       : PAnsiChar;
    cchArtistMax     : UINT;
    lpszTitle        : PAnsiChar;
    cchTitleMax      : UINT;
    lpszGenre        : PAnsiChar;
    cchGenreMax      : UINT;
    lpszComment      : PAnsiChar;
    cchCommentMax    : UINT;
    lpszFormat       : PAnsiChar;
    cchFormatMax     : UINT;
    lpszEncoder      : PAnsiChar;
    cchEncoderMax    : UINT;
    dwBitRate        : DWORD;
    dwSampleRate     : DWORD;
    dwDuration       : DWORD;
    iTrackNum        : Integer;
    iYear            : Integer;
    iNumChannels     : Integer;
    dwMusicFlags     : DWORD;
    lpszCodec        : PAnsiChar;
    cchCodecMax      : UINT;
    dwBPM            : DWORD;
    bRating          : Byte;
    iTrackTotal      : Integer;
    iTrackNumPad     : Integer;
    iTrackTotalPad   : Integer;
    iDiscNum         : Integer;
    iDiscTotal       : Integer;
    iDiscNumPad      : Integer;
    iDiscTotalPad    : Integer;
    lpszAlbumArtist  : PAnsiChar;
    cchAlbumArtistMax: UINT;
    lpszCopyright    : PAnsiChar;
    cchCopyrightMax  : UINT;
    dwFOURCC         : DWORD;
  end;
  LPDVPFILEINFOMUSICA = ^DVPFileInfoMusicA;
  TDvpfileinfomusica  = DVPFileInfoMusicA;

  PDVPFileInfoMusicW = ^TDVPFileInfoMusicW;
  DVPFileInfoMusicW = record
    hdr              : DVPFILEINFOHEADER;
    lpszAlbum        : PWideChar;
    cchAlbumMax      : UINT;
    lpszArtist       : PWideChar;
    cchArtistMax     : UINT;
    lpszTitle        : PWideChar;
    cchTitleMax      : UINT;
    lpszGenre        : PWideChar;
    cchGenreMax      : UINT;
    lpszComment      : PWideChar;
    cchCommentMax    : UINT;
    lpszFormat       : PWideChar;
    cchFormatMax     : UINT;
    lpszEncoder      : PWideChar;
    cchEncoderMax    : UINT;
    dwBitRate        : DWORD;
    dwSampleRate     : DWORD;
    dwDuration       : DWORD;
    iTrackNum        : Integer;
    iYear            : Integer;
    iNumChannels     : Integer;
    dwMusicFlags     : DWORD;
    lpszCodec        : PWideChar;
    cchCodecMax      : UINT;
    dwBPM            : DWORD;
    bRating          : Byte;
    iTrackTotal      : Integer;
    iTrackNumPad     : Integer;
    iTrackTotalPad   : Integer;
    iDiscNum         : Integer;
    iDiscTotal       : Integer;
    iDiscNumPad      : Integer;
    iDiscTotalPad    : Integer;
    lpszAlbumArtist  : PWideChar;
    cchAlbumArtistMax: UINT;
    lpszCopyright    : PWideChar;
    cchCopyrightMax  : UINT;
    dwFOURCC         : DWORD;
    lpszInitialKey   : PWideChar;
    cchInitialKeyMax : UINT;
    iSampleSize      : Integer;
  end;
  LPDVPFILEINFOMUSICW = ^DVPFileInfoMusicW;
  TDVPFileInfoMusicW  = DVPFileInfoMusicW;

  {$IFDEF UNICODE}
  DVPFILEINFOMUSIC   = DVPFileInfoMusicW;
  LPDVPFILEINFOMUSIC = LPDVPFILEINFOMUSICW;
  TDVPFileInfoMusic  = DVPFileInfoMusicW;
  {$ELSE}
  DVPFILEINFOMUSIC   = DVPFileInfoMusicA;
  LPDVPFILEINFOMUSIC = LPDVPFILEINFOMUSICA;
  TDVPFileInfoMusic  = DVPFileInfoMusicA;
  {$ENDIF}

  PDVPFileInfoMovieA = ^TDVPFileInfoMovieA;
  DVPFileInfoMovieA = record
    hdr               : DVPFILEINFOHEADER;
    szVideoSize       : SIZE;
    iNumBits          : Integer;
    dwDuration        : DWORD;
    dwFrames          : DWORD;
    flFrameRate       : Double;
    dwDataRate        : DWORD;
    ptAspectRatio     : Pointer;
    dwAudioBitRate    : DWORD;
    dwAudioSampleRate : DWORD;
    iNumChannels      : Integer;
    lpszVideoCodec    : PAnsiChar;
    cchVideoCodecMax  : UINT;
    lpszAudioCodec    : PAnsiChar;
    cchAudioCodecMax  : UINT;
    bRating           : Byte;
    lpszTitle         : PAnsiChar;
    cchTitleMax       : UINT;
    lpszSubtitle      : PAnsiChar;
    cchSubtitleMax    : UINT;
    lpszArtist        : PAnsiChar;
    cchArtistMax      : UINT;
    lpszYear          : PAnsiChar;
    cchYearMax        : UINT;
    lpszGenre         : PAnsiChar;
    cchGenreMax       : UINT;
    lpszDirector      : PAnsiChar;
    cchDirectorMax    : UINT;
    lpszProducer      : PAnsiChar;
    cchProducerMax    : UINT;
    lpszWriter        : PAnsiChar;
    cchWriterMax      : UINT;
    lpszPublisher     : PAnsiChar;
    cchPublisherMax   : UINT;
    lpszContentGroup  : PAnsiChar;
    cchContentGroupMax: UINT;
    lpszEncodedBy     : PAnsiChar;
    cchEncodedByMax   : UINT;
    lpszAuthorURL     : PAnsiChar;
    cchAuthorURLMax   : UINT;
    lpszCopyright     : PAnsiChar;
    cchCopyrightMax   : UINT;
    lpszComposers     : PAnsiChar;
    cchComposersMax   : UINT;
    lpszConductor     : PAnsiChar;
    cchConductorMax   : UINT;
    lpszMood          : PAnsiChar;
    cchMoodMax        : UINT;
    lpszPartOfSet     : PAnsiChar;
    cchPartOfSetMax   : UINT;
    lpszBPM           : PAnsiChar;
    cchBPMMax         : UINT;
    lpszKeywords      : PAnsiChar;
    cchKeywordsMax    : UINT;
    lpszComment       : PAnsiChar;
    cchCommentMax     : UINT;
    dwFOURCCVideo     : DWORD;
    dwFOURCCAudio     : DWORD;
    lpszInitialKey    : PAnsiChar;
    cchInitialKeyMax  : UINT;
  end;
  LPDVPFILEINFOMOVIEA = ^DVPFileInfoMovieA;
  TDVPFileInfoMovieA  = DVPFileInfoMovieA;

  PDVPFileInfoMovieW = ^TDVPFileInfoMovieW;
  DVPFileInfoMovieW = record
    hdr               : DVPFILEINFOHEADER;
    szVideoSize       : SIZE;
    iNumBits          : Integer;
    dwDuration        : DWORD;
    dwFrames          : DWORD;
    flFrameRate       : Double;
    dwDataRate        : DWORD;
    ptAspectRatio     : Pointer;
    dwAudioBitRate    : DWORD;
    dwAudioSampleRate : DWORD;
    iNumChannels      : Integer;
    lpszVideoCodec    : PWideChar;
    cchVideoCodecMax  : UINT;
    lpszAudioCodec    : PWideChar;
    cchAudioCodecMax  : UINT;
    bRating           : Byte;
    lpszTitle         : PWideChar;
    cchTitleMax       : UINT;
    lpszSubtitle      : PWideChar;
    cchSubtitleMax    : UINT;
    lpszArtist        : PWideChar;
    cchArtistMax      : UINT;
    lpszYear          : PWideChar;
    cchYearMax        : UINT;
    lpszGenre         : PWideChar;
    cchGenreMax       : UINT;
    lpszDirector      : PWideChar;
    cchDirectorMax    : UINT;
    lpszProducer      : PWideChar;
    cchProducerMax    : UINT;
    lpszWriter        : PWideChar;
    cchWriterMax      : UINT;
    lpszPublisher     : PWideChar;
    cchPublisherMax   : UINT;
    lpszContentGroup  : PWideChar;
    cchContentGroupMax: UINT;
    lpszEncodedBy     : PWideChar;
    cchEncodedByMax   : UINT;
    lpszAuthorURL     : PWideChar;
    cchAuthorURLMax   : UINT;
    lpszCopyright     : PWideChar;
    cchCopyrightMax   : UINT;
    lpszComposers     : PWideChar;
    cchComposersMax   : UINT;
    lpszConductor     : PWideChar;
    cchConductorMax   : UINT;
    lpszMood          : PWideChar;
    cchMoodMax        : UINT;
    lpszPartOfSet     : PWideChar;
    cchPartOfSetMax   : UINT;
    lpszBPM           : PWideChar;
    cchBPMMax         : UINT;
    lpszKeywords      : PWideChar;
    cchKeywordsMax    : UINT;
    lpszComment       : PWideChar;
    cchCommentMax     : UINT;
    dwFOURCCVideo     : DWORD;
    dwFOURCCAudio     : DWORD;
    lpszInitialKey    : PWideChar;
    cchInitialKeyMax  : UINT;
  end;
  LPDVPFILEINFOMOVIEW = ^DVPFileInfoMovieW;
  TDVPFileInfoMovieW  = DVPFileInfoMovieW;

  {$IFDEF UNICODE}
  DVPFileInfoMovie   = DVPFileInfoMovieW;
  TDVPFileInfoMovie  = DVPFileInfoMovieW;
  LPDVPFILEINFOMOVIE = LPDVPFILEINFOMOVIEW;
  {$ELSE}
  DVPFileInfoMovie   = DVPFileInfoMovieW;
  TDVPFileInfoMovie  = DVPFileInfoMovieW;
  LPDVPFILEINFOMOVIE = LPDVPFILEINFOMOVIEW;
  {$ENDIF}


  // Data structure passed to DVP_InitEx
  PDVPInitExData = ^TDVPInitExData;
  DVPInitExData = record
    cbSize            : UINT;
    hwndDOpusMsgWindow: HWND;
    dwOpusVerMajor    : DWORD;
    dwOpusVerMinor    : DWORD;
    pszLanguageName   : PWideChar;
  end;
  LPDVPINITEXDATA = ^DVPInitExData;
  TDVPInitExData  = DVPInitExData;

  PDVPSetMetaData = ^TDVPSetMetaData;
  DVPSetMetaData = record
    osm_pNext  : PDVPSetMetaData;
    osm_pszAttr: PWideChar;
    osm_type   : Integer;
    osm_cbSize : DWORD;
    osm_pData  : DWORD_PTR;
    osm_status : Integer;
  end;
  LPDVPSETMETADATA = ^DVPSetMetaData;
  TDVPSetMetaData  = DVPSetMetaData;

  PNVCCreateParams = ^TNVCCreateParams;
  NVC_CreateParams = record
		lpRc:    PRect;
		dwFlags: DWORD;
	end;

  TNVCCreateParams = NVC_CreateParams;
  
{$REGION 'Viewer Function prototypes'}
//function DVP_DVPINIT(): BOOL; cdecl;
//function DVP_DVPINITEX(pInitExData: LPDVPINITEXDATA): BOOL; cdecl;
//function DVP_DVPUSBSAFE(pUSBSafeData: LPOPUSUSBSAFEDATA): BOOL; cdecl;
//procedure DVP_DVPUNINIT(); cdecl;
//function DVP_DVPIDENTIFYA(lpVPInfo: LPVIEWERPLUGININFOA): BOOL; cdecl;
//function DVP_DVPIDENTIFYW(lpVPInfo: LPVIEWERPLUGININFOW): BOOL; cdecl;
//function DVP_DVPIDENTIFYFILEA(hWnd: HWND; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; hAbortEvent: THandle): BOOL; cdecl;
//function DVP_DVPIDENTIFYFILEW(hWnd: HWND; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; hAbortEvent: THandle): BOOL; cdecl;
//function DVP_DVPIDENTIFYFILESTREAMA(hWnd: HWND; lpStream: LPSTREAM; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; dwStreamFlags: DWORD): BOOL; cdecl;
//function DVP_DVPIDENTIFYFILESTREAMW(hWnd: HWND; lpStream: LPSTREAM; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; dwStreamFlags: DWORD): BOOL; cdecl;
//function DVP_DVPIDENTIFYFILEBYTESA(hWnd: HWND; lpszName: PAnsiChar; lpData: PByte; uiDataSize: UINT; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; dwStreamFlags: DWORD): BOOL; cdecl;
//function DVP_DVPIDENTIFYFILEBYTESW(hWnd: HWND; lpszName: PWideChar; lpData: PByte; uiDataSize: UINT; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; dwStreamFlags: DWORD): BOOL; cdecl;
//function DVP_DVPLOADBITMAPA(hWnd: HWND; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; lpszDesiredSize: LPSIZE; hAbortEvent: THandle): HBITMAP; cdecl;
//function DVP_DVPLOADBITMAPW(hWnd: HWND; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; lpszDesiredSize: LPSIZE; hAbortEvent: THandle): HBITMAP; cdecl;
//function DVP_DVPLOADBITMAPSTREAMA(hWnd: HWND; lpStream: LPSTREAM; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; lpszDesiredSize: LPSIZE; dwStreamFlags: DWORD): HBITMAP; cdecl;
//function DVP_DVPLOADBITMAPSTREAMW(hWnd: HWND; lpStream: LPSTREAM; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; lpszDesiredSize: LPSIZE; dwStreamFlags: DWORD): HBITMAP; cdecl;
//function DVP_DVPLOADTEXTA(lpLoadTextData: LPDVPLOADTEXTDATAA): BOOL; cdecl;
//function DVP_DVPLOADTEXTW(lpLoadTextData: LPDVPLOADTEXTDATAW): BOOL; cdecl;
//function DVP_DVPSHOWPROPERTIESA(hWndParent: HWND; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA): HWND; cdecl;
//function DVP_DVPSHOWPROPERTIESW(hWndParent: HWND; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW): HWND; cdecl;
//function DVP_DVPSHOWPROPERTIESSTREAMA(hWndParent: HWND; lpStream: LPSTREAM; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; dwStreamFlags: DWORD): HWND; cdecl;
//function DVP_DVPSHOWPROPERTIESSTREAMW(hWndParent: HWND; lpStream: LPSTREAM; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; dwStreamFlags: DWORD): HWND; cdecl;
//function DVP_DVPCREATEVIEWER(hWndParent: HWND; lpRc: LPRECT; dwFlags: DWORD): HWND; cdecl;
//function DVP_DVPCONFIGURE(hWndParent: HWND; hWndNotify: HWND; dwNotifyData: DWORD): HWND; cdecl;
//function DVP_DVPCONFIGUREPRETRANSLATEMESSAGEW(hWndDlg: HWND; lpMsg: LPMSG): BOOL; cdecl;
//function DVP_DVPCONFIGUREISDIALOGMESSAGEW(hWndDlg: HWND; lpMsg: LPMSG): BOOL; cdecl;
//function DVP_DVPABOUT(hWndParent: HWND): HWND; cdecl;
//function DVP_DVPGETFILEINFOFILEA(hWnd: HWND; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; lpFIH: LPDVPFILEINFOHEADER; hAbortEvent: THandle): BOOL; cdecl;
//function DVP_DVPGETFILEINFOFILEW(hWnd: HWND; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; lpFIH: LPDVPFILEINFOHEADER; hAbortEvent: THandle): BOOL; cdecl;
//function DVP_DVPGETFILEINFOFILESTREAMA(hWnd: HWND; lpStream: LPSTREAM; lpszName: PAnsiChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOA; lpFIH: LPDVPFILEINFOHEADER; dwStreamFlags: DWORD): BOOL; cdecl;
//function DVP_DVPGETFILEINFOFILESTREAMW(hWnd: HWND; lpStream: LPSTREAM; lpszName: PWideChar; lpVPFileInfo: LPVIEWERPLUGINFILEINFOW; lpFIH: LPDVPFILEINFOHEADER; dwStreamFlags: DWORD): BOOL; cdecl;
//function DVP_DVPSETMETADATA(lpszName: PWideChar; pData: LPDVPSETMETADATA): LONG; cdecl;
//function DVP_DVPVIEWERCACHELOADW(szPathOrName: PWideChar; lpStream: LPSTREAM; hAbortEvent: THandle; var pCacheSizeBytes: size_t): HANDLE; cdecl;
//procedure DVP_DVPVIEWERCACHEFREE(h: THandle); cdecl;

//{$IFDEF UNICODE}
//  PFNDVPIDENTIFY                      = PFNDVPIDENTIFYW; 
//  PFNDVPIDENTIFYFILE                  = PFNDVPIDENTIFYFILEW; 
//  PFNDVPIDENTIFYFILESTREAM            = PFNDVPIDENTIFYFILESTREAMW; 
//  PFNDVPIDENTIFYFILEBYTES             = PFNDVPIDENTIFYFILEBYTESW; 
//  PFNDVPLOADBITMAP                    = PFNDVPLOADBITMAPW; 
//  PFNDVPLOADBITMAPSTREAM              = PFNDVPLOADBITMAPSTREAMW; 
//  PFNDVPLOADTEXT                      = PFNDVPLOADTEXTW; 
//  PFNDVPSHOWPROPERTIES                = PFNDVPSHOWPROPERTIESW; 
//  PFNDVPSHOWPROPERTIESSTREAM          = PFNDVPSHOWPROPERTIESSTREAMW; 
//  PFNDVPGETFILEINFOFILE               = PFNDVPGETFILEINFOFILEW; 
//  PFNDVPGETFILEINFOFILESTREAM         = PFNDVPGETFILEINFOFILESTREAMW; 
//  PFNDVPVIEWERCACHELOAD               = PFNDVPVIEWERCACHELOADW; 
//{$ELSE}
//  PFNDVPIDENTIFY                      = PFNDVPIDENTIFYA; 
//  PFNDVPIDENTIFYFILE                  = PFNDVPIDENTIFYFILEA; 
//  PFNDVPIDENTIFYFILESTREAM            = PFNDVPIDENTIFYFILESTREAMA; 
//  PFNDVPIDENTIFYFILEBYTES             = PFNDVPIDENTIFYFILEBYTESA; 
//  PFNDVPLOADBITMAP                    = PFNDVPLOADBITMAPA; 
//  PFNDVPLOADBITMAPSTREAM              = PFNDVPLOADBITMAPSTREAMA; 
//  PFNDVPLOADTEXT                      = PFNDVPLOADTEXTA; 
//  PFNDVPSHOWPROPERTIES                = PFNDVPSHOWPROPERTIESA; 
//  PFNDVPSHOWPROPERTIESSTREAM          = PFNDVPSHOWPROPERTIESSTREAMA; 
//  PFNDVPGETFILEINFOFILE               = PFNDVPGETFILEINFOFILEA; 
//  PFNDVPGETFILEINFOFILESTREAM         = PFNDVPGETFILEINFOFILESTREAMA; 
//  //PFNDVPVIEWERCACHELOAD             = PFNDVPVIEWERCACHELOADA - - No ANSI version .; 
//{$ENDIF}
//
//
//{$IFDEF UNICODE}
//  DVP_Identify                        = DVP_IdentifyW; 
//  DVP_IdentifyFile                    = DVP_IdentifyFileW; 
//  DVP_IdentifyFileStream              = DVP_IdentifyFileStreamW; 
//  DVP_IdentifyFileBytes               = DVP_IdentifyFileBytesW; 
//  DVP_LoadBitmap                      = DVP_LoadBitmapW; 
//  DVP_LoadBitmapStream                = DVP_LoadBitmapStreamW; 
//  DVP_LoadText                        = DVP_LoadTextW; 
//  DVP_ShowProperties                  = DVP_ShowPropertiesW; 
//  DVP_ShowPropertiesStream            = DVP_ShowPropertiesStreamW; 
//  DVP_GetFileInfoFile                 = DVP_GetFileInfoFileW; 
//  DVP_GetFileInfoFileStream           = DVP_GetFileInfoFileStreamW; 
//{$ELSE}
//  DVP_Identify                        = DVP_IdentifyA; 
//  DVP_IdentifyFile                    = DVP_IdentifyFileA; 
//  DVP_IdentifyFileStream              = DVP_IdentifyFileStreamA; 
//  DVP_IdentifyFileBytes               = DVP_IdentifyFileBytesA; 
//  DVP_LoadBitmap                      = DVP_LoadBitmapA; 
//  DVP_LoadBitmapStream                = DVP_LoadBitmapStreamA; 
//  DVP_LoadText                        = DVP_LoadTextA; 
//  DVP_ShowProperties                  = DVP_ShowPropertiesA; 
//  DVP_ShowPropertiesStream            = DVP_ShowPropertiesStreamA; 
//  DVP_GetFileInfoFile                 = DVP_GetFileInfoFileA; 
//  DVP_GetFileInfoFileStream           = DVP_GetFileInfoFileStreamA; 
//{$ENDIF}
{$ENDREGION 'Viewer Function prototypes'}

{$ENDREGION 'Viewer types'}

{**************************************************************************************************}

{$REGION 'VFS Types'}
  // Plugin information (VFS_Identify)
  PVFSPluginInfoW = ^VFSPluginInfoW;
  DOpusVFSPluginInfoW = record
    cbSize            : UINT;                // Structure size
    idPlugin          : TGUID;               // Unique identifier for this plugin
    dwVersionHigh     : DWORD;               // Version (high)
    dwVersionLow      : DWORD;               // Version (low)
    dwFlags           : DWORD;               // Flags
    dwCapabilities    : DWORD;               // Plugin capabilities
    lpszHandlePrefix  : PWideChar;           // File path prefix the plugin handles, eg "http://"
    lpszHandleExts    : PWideChar;           // File extensions the plugin handles, eg ".xxx;.yyy;.zzz"
    lpszName          : PWideChar;           // Plugin name
    lpszDescription   : PWideChar;           // Plugin description string, eg "Directory Opus RAR Handler"
    lpszCopyright     : PWideChar;           // Copyright string, eg "(c) 2001 GP Software"
    lpszURL           : PWideChar;           // Reference URL, eg "http://www.gpsoft.com.au"
    cchHandlePrefixMax: UINT;                // Max. length of buffer
    cchHandleExtsMax  : UINT;                // Max. length of buffer
    cchNameMax        : UINT;                // Max. length of buffer
    cchDescriptionMax : UINT;                // Max. length of buffer
    cchCopyrightMax   : UINT;                // Max. length of buffer
    cchURLMax         : UINT;                // Max. length of buffer
    dwOpusVerMajor    : DWORD;               // Opus major version
    dwOpusVerMinor    : DWORD;               // Opus minor version
    dwInitFlags       : DWORD;               // Initialisation flags
    hIconSmall        : HICON;               // Small icon (Opus will call DestroyIcon on this)
    hIconLarge        : HICON;               // Large icon (Opus will call DestroyIcon on this)
  end;
  VFSPluginInfoW   = DOpusVFSPluginInfoW;
  LPVFSPLUGININFOW = ^DOpusVFSPluginInfoW;
  TVFSPluginInfoW  = DOpusVFSPluginInfoW;

  PVFSPluginInfoA = ^TVFSPluginInfoA;
  DOpusVFSPluginInfoA = record
    cbSize            : UINT;
    idPlugin          : TGUID;
    dwVersionHigh     : DWORD;
    dwVersionLow      : DWORD;
    dwFlags           : DWORD;
    dwCapabilities    : DWORD;
    lpszHandlePrefix  : PAnsiChar;
    lpszHandleExts    : PAnsiChar;
    lpszName          : PAnsiChar;
    lpszDescription   : PAnsiChar;
    lpszCopyright     : PAnsiChar;
    lpszURL           : PAnsiChar;
    cchHandlePrefixMax: UINT;
    cchHandleExtsMax  : UINT;
    cchNameMax        : UINT;
    cchDescriptionMax : UINT;
    cchCopyrightMax   : UINT;
    cchURLMax         : UINT;
    dwOpusVerMajor    : DWORD;
    dwOpusVerMinor    : DWORD;
    dwInitFlags       : DWORD;
    hIconSmall        : HICON;
    hIconLarge        : HICON;
  end;
  VFSPLUGININFOA   = DOpusVFSPluginInfoA;
  LPVFSPLUGININFOA = ^DOpusVFSPluginInfoA;
  TVFSPluginInfoA  = DOpusVFSPluginInfoA;

{$IFDEF UNICODE}
  VFSPLUGININFO   = VFSPluginInfoW;
  LPVFSPLUGININFO = LPVFSPLUGININFOW;
{$ELSE}
  VFSPLUGININFO   = VFSPLUGININFOA;
  LPVFSPLUGININFO = LPVFSPLUGININFOA;
{$ENDIF}

  // Data structure passed to several functions
  PLPVFSFuncData = ^TLPVFSFuncData;
  LPVFSFUNCDATA  = Pointer;
  TLPVFSFuncData = Pointer;

  // Values for vfsReadOp in DOpusVFSReadDirDataA
  PVFSReadType = ^TVFSReadType;
  VFSReadType  = (
    VFSREAD_CHANGEDIR,               // Change directory only, don't read directory
    VFSREAD_NORMAL,                  // Read directory as normal
    VFSREAD_REFRESH,                 // Refresh current directory
    VFSREAD_PARENT,                  // Go to parent
    VFSREAD_ROOT,                    // Go to root
    VFSREAD_BACK,                    // Go back
    VFSREAD_FORWARD,                 // Go forward
    VFSREAD_PRINTDIR,                // Print Directory function
    VFSREAD_FREEDIR,                 // Free any cached directory information
    VFSREAD_FREEDIRCLOSE             // Free any cached directory information, lister is closing
    );
  TVFSReadType = VFSReadType;

  // File data returned by VFS_ReadDirectory function (MUST be allocated using HeapAlloc() with supplied memory heap)
  PVFSFileDataHeader = ^TVFSFileDataHeader;
  DOpusVFSFileDataHeader = record
    cbSize        : UINT;               // Size of this structure
    lpNext        : PVFSFileDataHeader; // Optional pointer to next file data structure
    iNumItems     : Integer;            // Number of items in this structure
    cbFileDataSize: UINT;               // Size of each item data structure
  end;
  VFSFILEDATAHEADER   = DOpusVFSFileDataHeader;
  LPVFSFILEDATAHEADER = ^DOpusVFSFileDataHeader;
  TVFSFileDataHeader  = DOpusVFSFileDataHeader;

  PVFSFileDataColumnA = ^TVFSFileDataColumnA;
  DOpusVFSFileDataColumnA = record
    iColumnId: Integer;   // Column ID number
    lpszValue: PAnsiChar; // String for column (allocate using HeapAlloc())
  end;
  VFSFILEDATACOLUMNA   = DOpusVFSFileDataColumnA;
  LPVFSFILEDATACOLUMNA = ^DOpusVFSFileDataColumnA;
  TVFSFileDataColumnA  = DOpusVFSFileDataColumnA;

  PVFSFileDataColumnW = ^TVFSFileDataColumnW;
  DOpusVFSFileDataColumnW = record
    iColumnId: Integer;
    lpszValue: PWideChar;
  end;
  VFSFILEDATACOLUMNW   = DOpusVFSFileDataColumnW;
  LPVFSFILEDATACOLUMNW = ^DOpusVFSFileDataColumnW;
  TVFSFileDataColumnW  = DOpusVFSFileDataColumnW;

  {$IFDEF UNICODE}
  VFSFILEDATACOLUMN   = VFSFILEDATACOLUMNW;
  LPVFSFILEDATACOLUMN = LPVFSFILEDATACOLUMNW;
  {$ELSE}
  VFSFILEDATACOLUMN   = VFSFILEDATACOLUMNA;
  LPVFSFILEDATACOLUMN = LPVFSFILEDATACOLUMNA;
  {$ENDIF}

  // Array of DOpusVFSFileData follows DOpusVFSFileDataHeader in memory
  PVFSFileDataA = ^TVFSFileDataA;
  DOpusVFSFileDataA = record
    wfdData        : WIN32_FIND_DATAA;             // Basic file data
    dwFlags        : DWORD;                        // Custom flags
    lpszComment    : PAnsiChar;                    // File comment (allocate using HeapAlloc())
    iNumColumns    : Integer;                      // Number of custom column values supplied
    lpvfsColumnData: LPVFSFILEDATACOLUMNA;         // Custom column values array (allocate using HeapAlloc())
  end;
  VFSFILEDATAA   = DOpusVFSFileDataA;
  LPVFSFILEDATAA = ^DOpusVFSFileDataA;
  TVFSFileDataA  = DOpusVFSFileDataA;

  PVFSFileDataW = ^TVFSFileDataW;
  DOpusVFSFileDataW = record
    wfdData        : WIN32_FIND_DATAW;
    dwFlags        : DWORD;
    lpszComment    : PWideChar;
    iNumColumns    : Integer;
    lpvfsColumnData: LPVFSFILEDATACOLUMNW;
  end;
  VFSFILEDATAW   = DOpusVFSFileDataW;
  LPVFSFILEDATAW = ^DOpusVFSFileDataW;
  TVFSFileDataW  = DOpusVFSFileDataW;

  {$IFDEF UNICODE}
  VFSFILEDATA   = VFSFILEDATAW;
  LPVFSFILEDATA = LPVFSFILEDATAW;
  {$ELSE}
  VFSFILEDATA   = VFSFILEDATAA;
  LPVFSFILEDATA = LPVFSFILEDATAA;
  {$ENDIF}

  // Data structure for VFS_ReadDirectory function
  PVFSReadDirDataA = ^TVFSReadDirDataA;
  DOpusVFSReadDirDataA = record
    cbSize     : UINT;                    // Structure size
    hwndParent : HWND;                    // Parent window (for displaying error dialogs, etc)
    lpszPath   : PAnsiChar;               // Path
    vfsReadOp  : VFSReadType;             // Read operation
    hAbortEvent: THandle;                 // Abort event (for read-dir only)
    hMemHeap   : THandle;                 // Memory heap to allocate file data on (use HeapAlloc())
    lpFileData : LPVFSFILEDATAHEADER;     // File data pointer
  end;
  VFSREADDIRDATAA   = DOpusVFSReadDirDataA;
  LPVFSREADDIRDATAA = ^DOpusVFSReadDirDataA;
  TVFSReadDirDataA  = DOpusVFSReadDirDataA;

  PVFSReadDirDataW = ^TVFSReadDirDataW;
  DOpusVFSReadDirDataW = record
    cbSize     : UINT;
    hwndParent : HWND;
    lpszPath   : PWideChar;
    vfsReadOp  : VFSReadType;
    hAbortEvent: THandle;
    hMemHeap   : THandle;
    lpFileData : LPVFSFILEDATAHEADER;
  end;
  VFSREADDIRDATAW   = DOpusVFSReadDirDataW;
  LPVFSREADDIRDATAW = ^DOpusVFSReadDirDataW;
  TVFSReadDirDataW  = DOpusVFSReadDirDataW;

  {$IFDEF UNICODE}
  VFSREADDIRDATA   = VFSREADDIRDATAW;
  LPVFSREADDIRDATA = LPVFSREADDIRDATAW;
  {$ELSE}
  VFSREADDIRDATA   = VFSREADDIRDATAA;
  LPVFSREADDIRDATA = LPVFSREADDIRDATAA;
  {$ENDIF}

  // Properties
  PVFSProperty = ^TVFSProperty;
  VFSProperty = (
    VFSPROP_ISEXTRACTABLE,
    VFSPROP_USEFULLRENAME,
    VFSPROP_SHOWFULLPROGRESSBAR,
    VFSPROP_CANDELETETOTRASH,
    VFSPROP_CANDELETESECURE,
    VFSPROP_COPYBUFFERSIZE,
    VFSPROP_DRAGEFFECTS,
    VFSPROP_SHOWTHUMBNAILS,
    VFSPROP_SHOWFILEINFO,
    VFSPROP_ALLOWTOOLTIPGETSIZES,
    VFSPROP_CANSHOWSUBFOLDERS,
    VFSPROP_FUNCAVAILABILITY,
    VFSPROP_SUPPORTFILEHASH,
    VFSPROP_GETFOLDERICON,
    VFSPROP_SUPPORTPATHCOMPLETION,
    VFSPROP_BATCHOPERATION,
    VFSPROP_GETVALIDACTIONS,
    VFSPROP_SHOWPICTURESDIRECTLY
    );
  TVFSProperty = VFSProperty;

  // VFS_GetCustomColumns data
  PVFSCustomColumnA = ^TVFSCustomColumnA;
  DOpusVFSCustomColumnA = record
    cbSize   : UINT;
    lpNext   : PVFSCustomColumnA;
    lpszLabel: PAnsiChar;
    lpszKey  : PAnsiChar;
    dwFlags  : DWORD;
    iID      : Integer;
  end;
  VFSCUSTOMCOLUMNA   = DOpusVFSCustomColumnA;
  LPVFSCUSTOMCOLUMNA = ^DOpusVFSCustomColumnA;
  TVFSCustomColumnA  = DOpusVFSCustomColumnA;

  PVFSCustomColumnW = ^TVFSCustomColumnW;
  DOpusVFSCustomColumnW = record
    cbSize   : UINT;
    lpNext   : PVFSCustomColumnW;
    lpszLabel: PWideChar;
    lpszKey  : PWideChar;
    dwFlags  : DWORD;
    iID      : Integer;
  end;

  VFSCUSTOMCOLUMNW   = DOpusVFSCustomColumnW;
  LPVFSCUSTOMCOLUMNW = ^DOpusVFSCustomColumnW;
  TVFSCustomColumnW  = DOpusVFSCustomColumnW;

  {$IFDEF UNICODE}
  VFSCUSTOMCOLUMN   = VFSCUSTOMCOLUMNW;
  LPVFSCUSTOMCOLUMN = LPVFSCUSTOMCOLUMNW;
  {$ELSE}
  VFSCUSTOMCOLUMN   = VFSCUSTOMCOLUMNA;
  LPVFSCUSTOMCOLUMN = LPVFSCUSTOMCOLUMNA;
  {$ENDIF}

  // VFS_ContextVerb data
  PVFSContextVerbDataA = ^TVFSContextVerbDataA;
  DOpusVFSContextVerbDataA = record
    cbSize       : UINT;      // Structure size
    hwndParent   : HWND;      // Parent window
    lpszVerb     : PAnsiChar; // Verb, null=double-click
    lpszPath     : PAnsiChar; // Path
    lpszNewPath  : PAnsiChar; // New path for VFSCVRES_CHANGE result
    cchNewPathMax: Integer;   // Maximum size of new path
    uMsg         : UINT;      // Double-click message
    fwKeys       : WPARAM;    // Qualifier keys
    dwFlags      : DWORD;     // Flags
    iRotateAngle : Integer;   // Thumbnail rotation angle (if any)
  end;
  VFSCONTEXTVERBDATAA   = DOpusVFSContextVerbDataA;
  LPVFSCONTEXTVERBDATAA = ^DOpusVFSContextVerbDataA;
  TVFSContextVerbDataA  = DOpusVFSContextVerbDataA;

  PVFSContextVerbDataW = ^TVFSContextVerbDataW;
  DOpusVFSContextVerbDataW = record
    cbSize       : UINT;
    hwndParent   : HWND;
    lpszVerb     : PWideChar;
    lpszPath     : PWideChar;
    lpszNewPath  : PWideChar;
    cchNewPathMax: Integer;
    uMsg         : UINT;
    fwKeys       : WPARAM;
    dwFlags      : DWORD;
    iRotateAngle : Integer;
  end;
  VFSCONTEXTVERBDATAW   = DOpusVFSContextVerbDataW;
  LPVFSCONTEXTVERBDATAW = ^DOpusVFSContextVerbDataW;
  TVFSContextVerbDataW  = DOpusVFSContextVerbDataW;

{$IFDEF UNICODE}
  VFSCONTEXTVERBDATA   = VFSCONTEXTVERBDATAW;
  LPVFSCONTEXTVERBDATA = LPVFSCONTEXTVERBDATAW;
{$ELSE}
  VFSCONTEXTVERBDATA   = VFSCONTEXTVERBDATAA;
  LPVFSCONTEXTVERBDATA = LPVFSCONTEXTVERBDATAA;
{$ENDIF}

  // VFS_GetContextMenu data
  PVFSContextMenuItemA = ^TVFSContextMenuItemA;
  DOpusVFSContextMenuItemA = record
    cbSize     : UINT;
    dwFlags    : DWORD;
    lpszLabel  : PAnsiChar;
    lpszCommand: PAnsiChar;
  end;
  VFSCONTEXTMENUITEMA   = DOpusVFSContextMenuItemA;
  LPVFSCONTEXTMENUITEMA = ^DOpusVFSContextMenuItemA;
  TVFSContextMenuItemA  = DOpusVFSContextMenuItemA;

  PVFSContextMenuItemW = ^TVFSContextMenuItemW;
  DOpusVFSContextMenuItemW = record
    cbSize: UINT;
    dwFlags: DWORD;
    lpszLabel: PWideChar;
    lpszCommand: PWideChar;
  end;
  VFSCONTEXTMENUITEMW   = DOpusVFSContextMenuItemW;
  LPVFSCONTEXTMENUITEMW = ^DOpusVFSContextMenuItemW;
  TVFSContextMenuItemW  = DOpusVFSContextMenuItemW;

  {$IFDEF UNICODE}
  VFSCONTEXTMENUITEM   = VFSCONTEXTMENUITEMW;
  LPVFSCONTEXTMENUITEM = LPVFSCONTEXTMENUITEMW;
  {$ELSE}
  VFSCONTEXTMENUITEM   = VFSCONTEXTMENUITEMA;
  LPVFSCONTEXTMENUITEM = LPVFSCONTEXTMENUITEMA;
  {$ENDIF}

  PVFSContextMenuDataA = ^TVFSContextMenuDataA;
  DOpusVFSContextMenuDataA = record
    cbSize             : UINT;
    fAllowContextMenu  : BOOL;
    fDefaultContextMenu: BOOL;
    fCustomItemsBelow  : BOOL;
    lpCustomItems      : LPVFSCONTEXTMENUITEMA;
    iNumCustomItems    : Integer;
    fFreeCustomItems   : BOOL;
  end;
  VFSCONTEXTMENUDATAA   = DOpusVFSContextMenuDataA;
  LPVFSCONTEXTMENUDATAA = ^DOpusVFSContextMenuDataA;
  TVFSContextMenuDataA  = DOpusVFSContextMenuDataA;

  PVFSContextMenuDataW = ^TVFSContextMenuDataW;
  DOpusVFSContextMenuDataW = record
    cbSize             : UINT;
    fAllowContextMenu  : BOOL;
    fDefaultContextMenu: BOOL;
    fCustomItemsBelow  : BOOL;
    lpCustomItems      : LPVFSCONTEXTMENUITEMW;
    iNumCustomItems    : Integer;
    fFreeCustomItems   : BOOL;
  end;
  VFSCONTEXTMENUDATAW   = DOpusVFSContextMenuDataW;
  LPVFSCONTEXTMENUDATAW = ^DOpusVFSContextMenuDataW;
  TVFSContextMenuDataW  = DOpusVFSContextMenuDataW;

{$IFDEF UNICODE}
  VFSCONTEXTMENUDATA   = VFSCONTEXTMENUDATAW;
  LPVFSCONTEXTMENUDATA = LPVFSCONTEXTMENUDATAW;
{$ELSE}
  VFSCONTEXTMENUDATA   = VFSCONTEXTMENUDATAA;
  LPVFSCONTEXTMENUDATA = LPVFSCONTEXTMENUDATAA;
{$ENDIF}

  // VFS_ExtractFiles data
  PVFSExtractFilesDataA = ^TVFSExtractFilesDataA;
  DOpusVFSExtractFilesDataA = record
    cbSize      : UINT;            // Structure size
    hwndParent  : HWND;            // Parent window (for dialogs, etc)
    lpszDestPath: PAnsiChar;       // Destination path for extraction
    lpszFiles   : PAnsiChar;       // Files to extract, double-null terminated list
    dwFlags     : DWORD;           // Flags
  end;
  VFSEXTRACTFILESDATAA   = DOpusVFSExtractFilesDataA;
  LPVFSEXTRACTFILESDATAA = ^DOpusVFSExtractFilesDataA;
  TVFSExtractFilesDataA  = DOpusVFSExtractFilesDataA;

  PVFSExtractFilesDataW = ^TVFSExtractFilesDataW;
  DOpusVFSExtractFilesDataW = record
    cbSize      : UINT;
    hwndParent  : HWND;
    lpszDestPath: PWideChar;
    lpszFiles   : PWideChar;
    dwFlags     : DWORD;
  end;
  VFSEXTRACTFILESDATAW   = DOpusVFSExtractFilesDataW;
  LPVFSEXTRACTFILESDATAW = ^DOpusVFSExtractFilesDataW;
  TVFSExtractFilesDataW  = DOpusVFSExtractFilesDataW;

{$IFDEF UNICODE}
  VFSEXTRACTFILESDATA   = VFSEXTRACTFILESDATAW;
  LPVFSEXTRACTFILESDATA = LPVFSEXTRACTFILESDATAW;
{$ELSE}
  VFSEXTRACTFILESDATA   = VFSEXTRACTFILESDATAA;
  LPVFSEXTRACTFILESDATA = LPVFSEXTRACTFILESDATAA;
{$ENDIF}

// VFS_BatchOperation data
  PVFSBatchDataA = ^TVFSBatchDataA;
  DOpusVFSBatchDataA = record
    cbSize     : UINT;           // Structure size
    hwndParent : HWND;           // Parent window
    hAbortEvent: THandle;        // Abort event
    uiOperation: UINT;           // Operation code
    iNumFiles  : Integer;        // Number of files involved
    pszFiles   : PAnsiChar;      // Double-null terminated list file paths
    piResults  : PInteger;       // Array to return individual file results (0 = success or error code)
    pszDestPath: PAnsiChar;      // Destination path
    dwFlags    : DWORD;          // Flags
    lpFuncData : Pointer;        // Used in several calls to exported Opus functions
  end;
  VFSBATCHDATAA   = DOpusVFSBatchDataA;
  LPVFSBATCHDATAA = ^DOpusVFSBatchDataA;
  TVFSBatchDataA  = DOpusVFSBatchDataA;

  PVFSBatchDataW = ^TVFSBatchDataW;
  DOpusVFSBatchDataW = record
    cbSize     : UINT;         // Structure size
    hwndParent : HWND;         // Parent window
    hAbortEvent: THandle;      // Abort event
    uiOperation: UINT;         // Operation code
    iNumFiles  : Integer;      // Number of files involved
    pszFiles   : PWideChar;    // Double-null terminated list file paths
    piResults  : PInteger;     // Array to return individual file results (0 = success or error code)
    pszDestPath: PChar;        // Destination path
    dwFlags    : DWORD;        // Flags
    lpFuncData : Pointer;      // Used in several calls to exported Opus functions
  end;
  VFSBATCHDATAW   = DOpusVFSBatchDataW;
  LPVFSBATCHDATAW = ^DOpusVFSBatchDataW;
  TVFSBatchDataW  = DOpusVFSBatchDataW;

  {$IFDEF UNICODE}
  VFSBATCHDATA   = VFSBATCHDATAW;
  LPVFSBATCHDATA = LPVFSBATCHDATAW;
  {$ELSE}
  VFSBATCHDATA   = VFSBATCHDATAA;
  LPVFSBATCHDATA = LPVFSBATCHDATAA;
  {$ENDIF}

  // Data structure passed to VFS_Init
  PVFSInitData = ^TVFSInitData;
  VFSInitData = record
    cbSize            : UINT;               // Size of this structure
    hwndDOpusMsgWindow: HWND;               // Plugin manager message window
    dwOpusVerMajor    : DWORD;              // Opus major version
    dwOpusVerMinor    : DWORD;              // Opus minor version
    pszLanguageName   : PWideChar;          // Current language in use
  end;
  LPVFSINITDATA = ^VFSInitData;
  TVFSInitData  = VFSInitData;


  // Structure passed to VFS_USBSafe function
//  {$IFNDEF DEF_OPUSUSBSAFEDATA}
//  {$DEFINE DEF_OPUSUSBSAFEDATA}
//  POpusUSBSafeData = ^TOpusUSBSafeData;
//  OpusUSBSafeData = record
//    cbSize         : UINT;               // Size of this structure
//    pszOtherExports: PWideChar;          // Fill with double-null terminated list of additional files to export
//    cchOtherExports: UINT;               // Size of provided buffer
//  end;
//  LPOPUSUSBSAFEDATA = ^OpusUSBSafeData;
//  TOpusUSBSafeData  = OpusUSBSafeData;
//  {$ENDIF}

//  VFS Function prototypes
//  function VFS_VFSCREATE(pGUID: LPGUID; hwndMsgWindow: HWND): HANDLE; cdecl;
//  function VFS_VFSCLONE(hVFSData: THandle): HANDLE; cdecl;
//  procedure VFS_VFSDESTROY(hVFSData: THandle); cdecl;
//  function VFS_VFSGETCAPABILITIES(hVFSData: THandle): DWORD; cdecl;
//  function VFS_VFSGETLASTERROR(hVFSData: THandle): Longint; cdecl;
//  function VFS_VFSREADFILE(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hFile: THandle; lpData: Pointer; dwSize: DWORD; var lpdwReadSize: DWORD): BOOL; cdecl;
//  function VFS_VFSWRITEFILE(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hFile: THandle; lpData: Pointer; dwSize: DWORD; fFlush: BOOL; var lpdwWriteSize: DWORD): BOOL; cdecl;
//  function VFS_VFSSEEKFILE(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hFile: THandle; iPos: __int64; dwMethod: DWORD; dwFlags: DWORD; var piNewPos: UInt64): BOOL; cdecl;
//  procedure VFS_VFSCLOSEFILE(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hFile: THandle); cdecl;
//  procedure VFS_VFSFINDCLOSE(hVFSData: THandle; hFind: THandle); cdecl;
//  function VFS_VFSCONFIGURE(hWndParent: HWND; hWndNotify: HWND; dwNotifyData: DWORD): HWND; cdecl;
//  function VFS_VFSABOUT(hWndParent: HWND): HWND; cdecl;
//  function VFS_VFSIDENTIFYA(lpVFSInfo: LPVFSPLUGININFOA): BOOL; cdecl;
//  function VFS_VFSIDENTIFYW(lpVFSInfo: LPVFSPLUGININFOW): BOOL; cdecl;
//  function VFS_VFSGETCUSTOMCOLUMNSA(hVFSData: THandle): LPVFSCUSTOMCOLUMNA; cdecl;
//  function VFS_VFSGETCUSTOMCOLUMNSW(hVFSData: THandle): LPVFSCUSTOMCOLUMNW; cdecl;
//  function VFS_VFSQUERYPATHA(lpszPath: PAnsiChar; fPrefix: BOOL; pGUID: LPGUID): BOOL; cdecl;
//  function VFS_VFSQUERYPATHW(lpszPath: PWideChar; fPrefix: BOOL; pGUID: LPGUID): BOOL; cdecl;
//  function VFS_VFSGETPREFIXLISTA(lpszPrefix: PAnsiChar; cbPrefixMax: Integer): BOOL; cdecl;
//  function VFS_VFSGETPREFIXLISTW(lpszPrefix: PWideChar; cbPrefixMax: Integer): BOOL; cdecl;
//  function VFS_VFSREADDIRECTORYA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpReadDirData: LPVFSREADDIRDATAA): Integer; cdecl;
//  function VFS_VFSREADDIRECTORYW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpReadDirData: LPVFSREADDIRDATAW): Integer; cdecl;
//  function VFS_VFSGETPATHDISPLAYNAMEA(hVFSData: THandle; lpszPath: PAnsiChar; lpszDisplayName: PAnsiChar; cbDisplayNameMax: Integer): BOOL; cdecl;
//  function VFS_VFSGETPATHDISPLAYNAMEW(hVFSData: THandle; lpszPath: PWideChar; lpszDisplayName: PWideChar; cbDisplayNameMax: Integer): BOOL; cdecl;
//  function VFS_VFSGETPATHPARENTROOTA(hVFSData: THandle; lpszPath: PAnsiChar; fRoot: BOOL; lpszNewPath: PAnsiChar; cbNewPathMax: Integer): BOOL; cdecl;
//  function VFS_VFSGETPATHPARENTROOTW(hVFSData: THandle; lpszPath: PWideChar; fRoot: BOOL; lpszNewPath: PWideChar; cbNewPathMax: Integer): BOOL; cdecl;
//  function VFS_VFSGETFILEINFORMATIONA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; hHeap: THandle; dwFlags: DWORD): LPVFSFILEDATAHEADER; cdecl;
//  function VFS_VFSGETFILEINFORMATIONW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; hHeap: THandle; dwFlags: DWORD): LPVFSFILEDATAHEADER; cdecl;
//  function VFS_VFSGETFILEDESCRIPTIONA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFile: PAnsiChar; lpszDescription: PAnsiChar; cchDescriptionMax: Integer): Integer; cdecl;
//  function VFS_VFSGETFILEDESCRIPTIONW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFile: PWideChar; lpszDescription: PWideChar; cchDescriptionMax: Integer): Integer; cdecl;
//  function VFS_VFSGETFILEICONA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFile: PAnsiChar; lpiSysIconIndex: LPINT; var phLargeIcon: HICON; var phSmallIcon: HICON; lpfDestroyIcons: LPBOOL; lspzCacheName: PAnsiChar; cchCacheNameMax: Integer; lpiCacheIndex: LPINT): BOOL; cdecl;
//  function VFS_VFSGETFILEICONW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFile: PWideChar; lpiSysIconIndex: LPINT; var phLargeIcon: HICON; var phSmallIcon: HICON; lpfDestroyIcons: LPBOOL; lspzCacheName: PWideChar; cchCacheNameMax: Integer; lpiCacheIndex: LPINT): BOOL; cdecl;
//  function VFS_VFSCREATEFILEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFile: PAnsiChar; dwMode: DWORD; dwFlagsAndAttr: DWORD; dwFlags: DWORD; lpFT: LPFILETIME): HANDLE; cdecl;
//  function VFS_VFSCREATEFILEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFile: PWideChar; dwMode: DWORD; dwFlagsAndAttr: DWORD; dwFlags: DWORD; lpFT: LPFILETIME): HANDLE; cdecl;
//  function VFS_VFSMOVEFILEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszOldPath: PAnsiChar; lpszNewName: PAnsiChar): BOOL; cdecl;
//  function VFS_VFSMOVEFILEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszOldPath: PWideChar; lpszNewName: PWideChar): BOOL; cdecl;
//  function VFS_VFSDELETEFILEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; dwFlags: DWORD; iSecurePasses: Integer): BOOL; cdecl;
//  function VFS_VFSDELETEFILEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; dwFlags: DWORD; iSecurePasses: Integer): BOOL; cdecl;
//  function VFS_VFSSETFILETIMEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; hFile: THandle; lpCreateTime: LPFILETIME; lpAccessTime: LPFILETIME; lpModifyTime: LPFILETIME): BOOL; cdecl;
//  function VFS_VFSSETFILETIMEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; hFile: THandle; lpCreateTime: LPFILETIME; lpAccessTime: LPFILETIME; lpModifyTime: LPFILETIME): BOOL; cdecl;
//  function VFS_VFSSETFILEATTRA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; dwAttr: DWORD; fForDelete: BOOL): BOOL; cdecl;
//  function VFS_VFSSETFILEATTRW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; dwAttr: DWORD; fForDelete: BOOL): BOOL; cdecl;
//  function VFS_VFSGETFILEATTRA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; var ldpwAttr: DWORD): BOOL; cdecl;
//  function VFS_VFSGETFILEATTRW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; var ldpwAttr: DWORD): BOOL; cdecl;
//  function VFS_VFSSETFILECOMMENTA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; lpszComment: PAnsiChar): BOOL; cdecl;
//  function VFS_VFSSETFILECOMMENTW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; lpszComment: PWideChar): BOOL; cdecl;
//  function VFS_VFSGETFILECOMMENTA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; lpszComment: PAnsiChar; cchCommentMax: Integer): BOOL; cdecl;
//  function VFS_VFSGETFILECOMMENTW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; lpszComment: PWideChar; cchCommentMax: Integer): BOOL; cdecl;
//  function VFS_VFSCREATEDIRECTORYA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; dwFlags: DWORD): BOOL; cdecl;
//  function VFS_VFSCREATEDIRECTORYW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; dwFlags: DWORD): BOOL; cdecl;
//  function VFS_VFSREMOVEDIRECTORYA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; dwFlags: DWORD): BOOL; cdecl;
//  function VFS_VFSREMOVEDIRECTORYW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; dwFlags: DWORD): BOOL; cdecl;
//  function VFS_VFSGETFILESIZEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; hFile: THandle; var piFileSize: UInt64): BOOL; cdecl;
//  function VFS_VFSGETFILESIZEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; hFile: THandle; var piFileSize: UInt64): BOOL; cdecl;
//  function VFS_VFSFINDFIRSTFILEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; lpwfdData: LPWIN32_FIND_DATAA; hAbortEvent: THandle): HANDLE; cdecl;
//  function VFS_VFSFINDFIRSTFILEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; lpwfdData: LPWIN32_FIND_DATAW; hAbortEvent: THandle): HANDLE; cdecl;
//  function VFS_VFSFINDNEXTFILEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hFind: THandle; lpwfdData: LPWIN32_FIND_DATAA): BOOL; cdecl;
//  function VFS_VFSFINDNEXTFILEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hFind: THandle; lpwfdData: LPWIN32_FIND_DATAW): BOOL; cdecl;
//  function VFS_VFSPROPGETA(hVFSData: THandle; propId: vfsProperty; lpPropData: Pointer; lpData1: Pointer; lpData2: Pointer; lpData3: Pointer): BOOL; cdecl;
//  function VFS_VFSPROPGETW(hVFSData: THandle; propId: vfsProperty; lpPropData: Pointer; lpData1: Pointer; lpData2: Pointer; lpData3: Pointer): BOOL; cdecl;
//  function VFS_VFSCONTEXTVERBA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpVerbData: LPVFSCONTEXTVERBDATAA): Integer; cdecl;
//  function VFS_VFSCONTEXTVERBW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpVerbData: LPVFSCONTEXTVERBDATAW): Integer; cdecl;
//  function VFS_VFSEXTRACTFILESA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpExtractData: LPVFSEXTRACTFILESDATAA): BOOL; cdecl;
//  function VFS_VFSEXTRACTFILESW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpExtractData: LPVFSEXTRACTFILESDATAW): BOOL; cdecl;
//  function VFS_VFSPROPERTIESA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hwndParent: HWND; lpszFiles: PAnsiChar): HWND; cdecl;
//  function VFS_VFSPROPERTIESW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; hwndParent: HWND; lpszFiles: PWideChar): HWND; cdecl;
//  function VFS_VFSGETFREEDISKSPACEA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; var piFreeBytesAvailable: UInt64; var piTotalBytes: UInt64; var piTotalFreeBytes: UInt64): BOOL; cdecl;
//  function VFS_VFSGETFREEDISKSPACEW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; var piFreeBytesAvailable: UInt64; var piTotalBytes: UInt64; var piTotalFreeBytes: UInt64): BOOL; cdecl;
//  function VFS_VFSGETCONTEXTMENUA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFiles: PAnsiChar; lpMenuData: LPVFSCONTEXTMENUDATAA): BOOL; cdecl;
//  function VFS_VFSGETCONTEXTMENUW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFiles: PWideChar; lpMenuData: LPVFSCONTEXTMENUDATAW): BOOL; cdecl;
//  function VFS_VFSGETDROPMENUA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFiles: PAnsiChar; lpMenuData: LPVFSCONTEXTMENUDATAA; dwEffects: DWORD): BOOL; cdecl;
//  function VFS_VFSGETDROPMENUW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszFiles: PWideChar; lpMenuData: LPVFSCONTEXTMENUDATAW; dwEffects: DWORD): BOOL; cdecl;
//  function VFS_VFSBATCHOPERATIONA(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PAnsiChar; lpBatchData: LPVFSBATCHDATAA): UINT; cdecl;
//  function VFS_VFSBATCHOPERATIONW(hVFSData: THandle; lpFuncData: LPVFSFUNCDATA; lpszPath: PWideChar; lpBatchData: LPVFSBATCHDATAW): UINT; cdecl;
//  function VFS_VFSUSBSAFE(pUSBSafeData: LPOPUSUSBSAFEDATA): BOOL; cdecl;
//  function VFS_VFSINIT(pInitData: LPVFSINITDATA): BOOL; cdecl;
//  procedure VFS_VFSUNINIT(); cdecl;
//
////
//{$IFDEF UNICODE}
//  PFNVFSIDENTIFY                      = PFNVFSIDENTIFYW; 
//  PFNVFSGETCUSTOMCOLUMNS              = PFNVFSGETCUSTOMCOLUMNSW; 
//  PFNVFSQUERYPATH                     = PFNVFSQUERYPATHW; 
//  PFNVFSGETPREFIXLIST                 = PFNVFSGETPREFIXLISTW; 
//  PFNVFSREADDIRECTORY                 = PFNVFSREADDIRECTORYW; 
//  PFNVFSGETPATHDISPLAYNAME            = PFNVFSGETPATHDISPLAYNAMEW; 
//  PFNVFSGETPATHPARENTROOT             = PFNVFSGETPATHPARENTROOTW; 
//  PFNVFSGETFILEINFORMATION            = PFNVFSGETFILEINFORMATIONW; 
//  PFNVFSGETFILEDESCRIPTION            = PFNVFSGETFILEDESCRIPTIONW; 
//  PFNVFSGETFILEICON                   = PFNVFSGETFILEICONW; 
//  PFNVFSCREATEFILE                    = PFNVFSCREATEFILEW; 
//  PFNVFSMOVEFILE                      = PFNVFSMOVEFILEW; 
//  PFNVFSDELETEFILE                    = PFNVFSDELETEFILEW; 
//  PFNVFSSETFILETIME                   = PFNVFSSETFILETIMEW; 
//  PFNVFSSETFILEATTR                   = PFNVFSSETFILEATTRW; 
//  PFNVFSGETFILEATTR                   = PFNVFSGETFILEATTRW; 
//  PFNVFSSETFILECOMMENT                = PFNVFSSETFILECOMMENTW; 
//  PFNVFSGETFILECOMMENT                = PFNVFSGETFILECOMMENTW; 
//  PFNVFSCREATEDIRECTORY               = PFNVFSCREATEDIRECTORYW; 
//  PFNVFSREMOVEDIRECTORY               = PFNVFSREMOVEDIRECTORYW; 
//  PFNVFSGETFILESIZE                   = PFNVFSGETFILESIZEW; 
//  PFNVFSFINDFIRSTFILE                 = PFNVFSFINDFIRSTFILEW; 
//  PFNVFSFINDNEXTFILE                  = PFNVFSFINDNEXTFILEW; 
//  PFNVFSPROPGET                       = PFNVFSPROPGETW; 
//  PFNVFSCONTEXTVERB                   = PFNVFSCONTEXTVERBW; 
//  PFNVFSEXTRACTFILES                  = PFNVFSEXTRACTFILESW; 
//  PFNVFSPROPERTIES                    = PFNVFSPROPERTIESW; 
//  PFNVFSGETFREEDISKSPACE              = PFNVFSGETFREEDISKSPACEW; 
//  PFNVFSGETCONTEXTMENU                = PFNVFSGETCONTEXTMENUW; 
//  PFNVFSGETDROPMENU                   = PFNVFSGETDROPMENUW; 
//  PVNVFSBATCHOPERATION                = PVNVFSBATCHOPERATIONW; 
//{$ELSE}
//  PFNVFSIDENTIFY                      = PFNVFSIDENTIFYA; 
//  PFNVFSGETCUSTOMCOLUMNS              = PFNVFSGETCUSTOMCOLUMNSA; 
//  PFNVFSQUERYPATH                     = PFNVFSQUERYPATHA; 
//  PFNVFSGETPREFIXLIST                 = PFNVFSGETPREFIXLISTA; 
//  PFNVFSREADDIRECTORY                 = PFNVFSREADDIRECTORYA; 
//  PFNVFSGETPATHDISPLAYNAME            = PFNVFSGETPATHDISPLAYNAMEA; 
//  PFNVFSGETPATHPARENTROOT             = PFNVFSGETPATHPARENTROOTA; 
//  PFNVFSGETFILEINFORMATION            = PFNVFSGETFILEINFORMATIONA;
//  PFNVFSGETFILEDESCRIPTION            = PFNVFSGETFILEDESCRIPTIONA; 
//  PFNVFSGETFILEICON                   = PFNVFSGETFILEICONA; 
//  PFNVFSCREATEFILE                    = PFNVFSCREATEFILEA; 
//  PFNVFSMOVEFILE                      = PFNVFSMOVEFILEA; 
//  PFNVFSDELETEFILE                    = PFNVFSDELETEFILEA; 
//  PFNVFSSETFILETIME                   = PFNVFSSETFILETIMEA; 
//  PFNVFSSETFILEATTR                   = PFNVFSSETFILEATTRA; 
//  PFNVFSGETFILEATTR                   = PFNVFSGETFILEATTRA; 
//  PFNVFSSETFILECOMMENT                = PFNVFSSETFILECOMMENTA; 
//  PFNVFSGETFILECOMMENT                = PFNVFSGETFILECOMMENTA; 
//  PFNVFSCREATEDIRECTORY               = PFNVFSCREATEDIRECTORYA; 
//  PFNVFSREMOVEDIRECTORY               = PFNVFSREMOVEDIRECTORYA; 
//  PFNVFSGETFILESIZE                   = PFNVFSGETFILESIZEA; 
//  PFNVFSFINDFIRSTFILE                 = PFNVFSFINDFIRSTFILEA; 
//  PFNVFSFINDNEXTFILE                  = PFNVFSFINDNEXTFILEA; 
//  PFNVFSPROPGET                       = PFNVFSPROPGETA; 
//  PFNVFSCONTEXTVERB                   = PFNVFSCONTEXTVERBA; 
//  PFNVFSEXTRACTFILES                  = PFNVFSEXTRACTFILESA; 
//  PFNVFSPROPERTIES                    = PFNVFSPROPERTIESA; 
//  PFNVFSGETFREEDISKSPACE              = PFNVFSGETFREEDISKSPACEA; 
//  PFNVFSGETCONTEXTMENU                = PFNVFSGETCONTEXTMENUA; 
//  PFNVFSGETDROPMENU                   = PFNVFSGETDROPMENUA; 
//  PVNVFSBATCHOPERATION                = PVNVFSBATCHOPERATIONA; 
//{$ENDIF}

{$ENDREGION}

{*************************************************************************************************}

// map a 1 - 99 rating to a 1 - 255 for mp3
function MusicRatingWindowsToMP3(iRating: Integer): Integer; inline;

function MusicRatingMP3ToWindows(iRating: Integer): Integer; inline;

// map a 1 - 99 rating to 1 - 5 stars.
// Ranges are consistent with Windows Explorer (on Windows 7, at least).
// Note that these ranges put the reverse mappings (StarsToRating) in their centres, not on their boundaries.
function MusicRatingToStars(iRating: Integer): Integer; inline;

function MusicStarsToRating(iStars: Integer): Integer; inline;

implementation

// map a 1 - 99 rating to a 1 - 255 for mp3
function IIf(ATest: Boolean; ATrue, AFalse: Integer): Integer; inline;
begin
  if ATest then Result := ATrue else Result := AFalse;
end;
function MusicRatingWindowsToMP3(iRating: Integer): Integer;
begin
  Result := IIf(iRating = 0, 0, IIf(iRating = 1, 1, IIf(iRating <= 25, 64, IIf(iRating <= 50, 128, IIf(iRating <= 75, 192, 255)))));
end;

function MusicRatingMP3ToWindows(iRating: Integer): Integer;
begin
  Result := IIf(iRating = 0, 0, IIf(iRating < 32, 1, IIf(iRating < 96, 25, IIf(iRating < 160, 50, IIf(iRating < 224, 75, 99)))));
end;

//// map a 1 - 99 rating to 1 - 5 stars.
//// Ranges are consistent with Windows Explorer (on Windows 7, at least).
//// Note that these ranges put the reverse mappings (StarsToRating) in their centres, not on their boundaries.
function MusicRatingToStars(iRating: Integer): Integer;
begin
  Result := IIf(iRating <= 0, 0, IIf(iRating <= 12, 1, IIf(iRating <= 37, 2, IIf(iRating <= 62, 3, IIf(iRating <= 87, 4, 5)))));
end;

function MusicStarsToRating(iStars: Integer): Integer;
begin
  case iStars of
    0     : Result := 0;
    1     : Result := 1;
    2..25 : Result := 25;
    26..50: Result := 50;
    51..75: Result := 75;
  else
      Result := 99;
  end;
end;

end.
