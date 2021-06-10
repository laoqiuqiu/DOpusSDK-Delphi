{/*
   Directory Opus 12 Viewer Plugins Header File
*/}
unit DOPlugin.Consts;

interface

const

{$REGION 'Vierer Consts'}
  // Current version - define VIEWERPLUGINVERSION when including this file to use an older version
  // Verison 4 is Opus 9
  // Version 5 is Opus 10
  // Version 6 is Opus 11
  // Version 12000 is Opus 12.0 (first version using this easier to understand numbering format)
  VIEWERPLUGINVERSION = 12000;

  // Viewer plugin info flags
  DVPFIF_CanHandleStreams             = 1 shl 0;   // Plugin can handle IStreams to identify and read files
  DVPFIF_CanHandleBytes               = 1 shl 1;   // Plugin can identify files based on file header
  DVPFIF_CatchAll                     = 1 shl 2;   // 'Catch All' plugin wants to be called last
  DVPFIF_DefaultCatchAll              = 1 shl 3;   // 'Default Catch All' plugin is last unless there's another 'catch all'
  DVPFIF_ExtensionsOnly               = 1 shl 4;   // Plugin only wants to identify files based on file extension
  DVPFIF_ExtensionsOnlyIfSlow         = 1 shl 5;   // Plugin looks only at file extensions if file is 'slow'
  DVPFIF_ExtensionsOnlyIfNoRndSeek    = 1 shl 6;   // Plugin looks only at file extensions if file doesn't support random seeking
  DVPFIF_ExtensionsOnlyForThumbnails  = 1 shl 7;   // Plugin looks only at file extensions if generating thumbnails
  DVPFIF_NoSlowFiles                  = 1 shl 8;   // Plugin doesn't handle 'slow' files
  DVPFIF_NeedRandomSeek               = 1 shl 9;   // Plugin needs random seek capability
  DVPFIF_CanConfigure                 = 1 shl 10;  // Plugin has a configuration interface
  DVPFIF_CanShowAbout                 = 1 shl 11;  // Plugin has an About function
  DVPFIF_NoThumbnails                 = 1 shl 12;  // Plugin doesn't want to be called to generate thumbnails
  DVPFIF_NoProperties                 = 1 shl 13;  // Don't show 'Properties' item on default context menu
  DVPFIF_ZeroBytesOk                  = 1 shl 14;  // Zero byte files are ok (eg text files)
  DVPFIF_OverrideInternal             = 1 shl 15;  // Plugin can override internal Opus image routines
  DVPFIF_InitialDisable               = 1 shl 16;  // Plugin is disabled by default
  DVPFIF_NoFileInformation            = 1 shl 17;  // Is not to be called for file information (eg Description field)
  DVPFIF_ProvideFileInfo              = 1 shl 18;  // Provides information without viewing
  DVPFIF_NoMultithreadThumbnails      = 1 shl 19;  // Don't call simultaneously on multiple threads for thumbnails
  DVPFIF_FolderThumbnails             = 1 shl 20;  // Can provide folder thumbnails
  DVPFIF_TrueThumbnailSize            = 1 shl 21;  // Always provide true thumbnail size
  DVPFIF_UseVersionResource           = 1 shl 22;  // Use the plugin's version resource for version information
  DVPFIF_CanShowHex                   = 1 shl 23;  // The plugin can be used as a hex viewer for any type of file
  DVPFIF_OnlyThumbnails               = 1 shl 24;  // Plugin is only to be called for thumbnails
  DVPFIF_ExtensionsOnlyIfSlowSeek     = 1 shl 25;  // Plugin looks only at file extensions if file has slow seeking (usually combined with DVPFIF_ExtensionsOnlyIfSlow and DVPFIF_ExtensionsOnlyIfNoRndSeek).
  DVPFIF_NoSlowSeek                   = 1 shl 26;  // Plugin doesn't handle files with slow seeking (usually combined with DVPFIF_NoSlowFiles and DVPFIF_NeedRandomSeek)

  // Plugin major types
  DVPMajorType_Image = 0;
  DVPMajorType_Sound = 1;
  DVPMajorType_Text  = 2;
  DVPMajorType_Other = 3;
  DVPMajorType_Movie = 4;

  // Viewer plugin info initialisation flags
  VPINITF_FIRSTTIME            = 1 shl 0;                              // First time this plugin has been initialised
  VPINITF_USB                  = 1 shl 1;                              // Opus is running in USB mode
  VPINITF_NOINIT               = 1 shl 2;                              // DVP_Init/DVP_InitEx *may not* have been called for the plugin. Set when DVP_Identify called to get plugin's name for list of plugins available for USB export.
  VPINITF_NOSUPPORT            = 1 shl 3;                              // The plugin support API is unavailable. (Exception: GetString *may* still be available.) Set when DVP_Identify called to get 32-bit plugin's name for 64-bit Opus. The call comes via a simple proxy process which does not provide the plugin support API. This situation occurs when 64-bit Opus is building the list of available plugins for a 32-bit USB export.
										
  // Viewer plugin file info flags
  DVPFIF_CanReturnBitmap       = 1 shl 0;                              // We can return a bitmap for this file type
  DVPFIF_CanReturnViewer       = 1 shl 1;                              // We can create a viewer for this file type
  DVPFIF_CanReturnThumbnail    = 1 shl 2;                              // We can return a thumbnail for this filetype (in bitmap form)
  DVPFIF_CanShowProperties     = 1 shl 3;                              // We can show a Properties dialog for this file
  DVPFIF_ResolutionInch        = 1 shl 4;                              // Resolution is given in DPI
  DVPFIF_ResolutionCM          = 1 shl 5;                              // Resolution is given in CM
  DVPFIF_WantFileInfo          = 1 shl 6;                              // Set by Opus: Being called for file information
  DVPFIF_ReturnsText           = 1 shl 7;                              // All we return is text
  DVPFIF_HasAlphaChannel       = 1 shl 8;                              // Bitmap returned is 32 bits and has valid alpha channel
  DVPFIF_HasTransparentColor   = 1 shl 9;                              // Use transparent color to generate mask
  DVPFIF_HasTransparentPen     = 1 shl 10;                             // Use transparent pen to generate mask (upper 8 bits of crTransparentColor)
  DVPFIF_CanReturnFileInfo     = 1 shl 11;                             // Provides file information
  DVPFIF_NoThumbnailBorder     = 1 shl 12;                             // Don't display a border for this thumbnail
  DVPFIF_NoShowThumbnailIcon   = 1 shl 13;                             // Don't display filetype icon for this thumbnail
  DVPFIF_ShowThumbnailIcon     = 1 shl 14;                             // Force display of filetype icon for this thumbnail
  DVPFIF_FolderThumbnail       = 1 shl 15;                             // Set by Opus: Being called for a folder thumbnail (the folder itself; currently never set for plugins)
  DVPFIF_RegenerateOnResize    = 1 shl 16;                             // Regenerate instead of scale for dynamic resizing
  DVPFIF_JPEGStream            = 1 shl 17;                             // Plugin has returned a JPEG stream allocated with LocalAlloc(LMEM_FIXED)
  DVPFIF_PNGStream             = 1 shl 18;                             // Plugin has returned a PNG stream allocated with LocalAlloc(LMEM_FIXED);
  DVPFIF_InFolderThumbnail     = 1 shl 19;                             // Set by Opus: Being called for a sub-thumbnail within a folder thumbnail.
  DVPFIF_NoCache               = 1 shl 20;                             // Never cache the thumbnail.
  DVPFIF_Rotate90              = 1 shl 21;                             // Returned image should be rotated 90 degrees.
  DVPFIF_Rotate270             = 1 shl 22;                             // Returned image should be rotated 270 degrees.
  DVPFIF_Rotate180             = DVPFIF_Rotate90 or DVPFIF_Rotate270;  // Returned image should be rotated 180 degrees.
  DVPFIF_NoThumbnailDimensions = 1 shl 23;                             // Don't display width/height/depth information for this thumbnail.
  DVPFIF_ForImageConverter     = 1 shl 24;                             // Set by Opus: Indicates LoadBitmap is being called for the image converter. (Example usage: Enable an ultra-high-quality mode for image conversion that would be too slow for general file viewing.)
  DVPFIF_RotateAutoStream      = 1 shl 25;                             // When returning a JPEG or PNG stream, ask Opus to auto-rotate it using EXIF data in the stream as a post-processing step. (User's EXIF rotation preferences are ignored; always done regardless.)
  DVPFIF_RotateAutoFile        = 1 shl 26;                             // When returning an image, ask Opus to auto-rotate it using EXIF data in the file itself for formats Opus can extract EXIF from. (User's EXIF rotation settings are respected.) NOTE: At time of writing, the thumbnail code respects this flag but other areas, such as the viewer and image converter, may act as if it is always set. If you support a format Opus can extract EXIF from and *don't* want to set this flag for some reason, please get in touch with GPSoftware for assistance.
  DVPFIF_Thumbnail             = 1 shl 27;                             // Set by Opus: Being called for a thumbnail (rather than for the viewer)
  DVPFIF_EnableHexIdent        = 1 shl 28;                             // Set by Opus: Asks the (text.dll) plugin to identify files even if the only way it can view them is in hex mode.
  DVPFIF_RotateFlipHorizontal  = 1 shl 29;                             // Returned image should be flipped horizontally.
  DVPFIF_RotateFlipVertical    = 1 shl 30;                             // Returned image should be flipped veritcally.
  DVPFIF_RotateTranspose       = 1 shl 31;                             // Returned image should be transposed.

  // DVPLUGINMSG_SETROTATION lParm flags.
  DVPROTF_FLIPH = 1 shl 0;  // Flip horizontally. Only set if VPCAPABILITY_INITIALFLIP.
  DVPROTF_FLIPV = 1 shl 1;  // Flip vertically.   Only set if VPCAPABILITY_INITIALFLIP.

  DVP_FITypeHint_None      = 0;
  DVP_FITypeHint_PlainText = 1;
  DVP_FITypeHint_RichText  = 2;
  DVP_FITypeHint_HTML      = 3;

  DVP_ColorSpace_Unknown   = 0;
  DVP_ColorSpace_Grayscale = 1;
  DVP_ColorSpace_RGB       = 2;
  DVP_ColorSpace_YCBCR     = 3;
  DVP_ColorSpace_CMYK      = 4;
  DVP_ColorSpace_YCCK      = 5;

  // Messages sent to a plugin viewer window
{$IF NOT DECLARED(WM_APP)}
  WM_APP = $8000;
{$ENDIF}
  DVPLUGINMSG_BASE                   = WM_APP + $0F00;
  DVPLUGINMSG_LOADA                  = DVPLUGINMSG_BASE + 1;	  // Load picture (lParam = LPSTR lpszName)
  DVPLUGINMSG_LOADW                  = DVPLUGINMSG_BASE + 2;	  // Load picture (lParam = LPWSTR lpszName)
  DVPLUGINMSG_LOADSTREAMA            = DVPLUGINMSG_BASE + 3;	  // Load picture (wParam = LPSTR lspzName, lParam = LPSTREAM lpStream)
  DVPLUGINMSG_LOADSTREAMW            = DVPLUGINMSG_BASE + 4;	  // Load picture (wParam = LPWSTR lspzName, lParam = LPSTREAM lpStream)
  DVPLUGINMSG_GETIMAGEINFOA          = DVPLUGINMSG_BASE + 5;	  // Get info for loaded picture (lParam = LPVIEWERPLUGINFILEINFOA)
  DVPLUGINMSG_GETIMAGEINFOW          = DVPLUGINMSG_BASE + 6;	  // Get info for loaded picture (lParam = LPVIEWERPLUGINFILEINFOW)
  DVPLUGINMSG_GETCAPABILITIES        = DVPLUGINMSG_BASE + 7;	  // Get viewer capabilities
  DVPLUGINMSG_RESIZE                 = DVPLUGINMSG_BASE + 8;	  // Resize window (wParam = DWORD left,top lParam = DWORD width, height )
  DVPLUGINMSG_SETROTATION            = DVPLUGINMSG_BASE + 9;	  // Set initial rotation ( wParam = int rotate_angle ) ( Opus 12 and above: lParam = DWORD flags such as DVPROTF_FLIPH, DVPROTF_FLIPV. Apply the flip after the rotation. VPCAPABILITY_INITIALFLIP also required. )
  DVPLUGINMSG_ROTATE                 = DVPLUGINMSG_BASE + 10;	  // Rotate image ( wParam = int rotate_amount, lParam = TRUE if window autosize is enabled )
  DVPLUGINMSG_SETZOOM                = DVPLUGINMSG_BASE + 11;	  // Set initial zoom ( wParam = int zoom_factor )
  DVPLUGINMSG_ZOOM                   = DVPLUGINMSG_BASE + 12;	  // Zoom image (wParam = int zoom_factor )
  DVPLUGINMSG_GETZOOMFACTOR          = DVPLUGINMSG_BASE + 13;	  // Get current zoom factor
  DVPLUGINMSG_SELECTALL              = DVPLUGINMSG_BASE + 14;	  // Select contents
  DVPLUGINMSG_TESTSELECTION          = DVPLUGINMSG_BASE + 15;	  // Is there a selection?
  DVPLUGINMSG_COPYSELECTION          = DVPLUGINMSG_BASE + 16;	  // Copy selection to clipboard
  DVPLUGINMSG_PRINT                  = DVPLUGINMSG_BASE + 17;	  // Print picture
  DVPLUGINMSG_PROPERTIES             = DVPLUGINMSG_BASE + 18;	  // Show properties dialog ( wParam = HWND hWndParent )
  DVPLUGINMSG_REDRAW                 = DVPLUGINMSG_BASE + 19;	  // Redraw (if wParam = TRUE it means the background colour has changed and is supplied in lParam )
  DVPLUGINMSG_GETPICSIZE             = DVPLUGINMSG_BASE + 20;	  // Return size of current image (wParam = LPINT lpiNumBits (optional), lParam = LPSIZE)
  DVPLUGINMSG_GETAUTOBGCOL           = DVPLUGINMSG_BASE + 21;	  // Return 'automatic' background colour based on image
  DVPLUGINMSG_MOUSEWHEEL             = DVPLUGINMSG_BASE + 22;	  // Mouse wheel message (vertical; like WM_MOUSEWHEEL)
  DVPLUGINMSG_ADDCONTEXTMENUA        = DVPLUGINMSG_BASE + 23;	  // Add items to context menu ( wParam = LPDWORD numItems, result = LPDVPCONTEXTMENUITEMA array)
  DVPLUGINMSG_ADDCONTEXTMENUW        = DVPLUGINMSG_BASE + 24;	  // Add items to context menu ( wParam = LPDWORD numItems, result = LPDVPCONTEXTMENUITEMW array)
  DVPLUGINMSG_SETABORTEVENT          = DVPLUGINMSG_BASE + 25;	  // Provides an event that is set to abort the loading of a file ( lParam = HANDLE )
  DVPLUGINMSG_GETORIGINALPICSIZE     = DVPLUGINMSG_BASE + 26;	  // Return original size of current image (wParam = LPINT lpiNumBits (optional), lParam = LPSIZE)
  DVPLUGINMSG_CLEAR                  = DVPLUGINMSG_BASE + 27;	  // Plugin should clear its display and free the current picture
  DVPLUGINMSG_NOTIFY_LOADPROGRESS    = DVPLUGINMSG_BASE + 28;	  // Posted from plugin back to owner to notify of load progress ( wParam = percent value complete )
  DVPLUGINMSG_ISDLGMESSAGE           = DVPLUGINMSG_BASE + 29;	  // Plugin should return true if ( lParam = LPMSG ) is a message for one of its dialogs and it has handled it
  DVPLUGINMSG_TRANSLATEACCEL         = DVPLUGINMSG_BASE + 30;	  // Plugin should return true if ( lParam = LPMSG ) was handled by its accelerators
  DVPLUGINMSG_REINITIALIZE           = DVPLUGINMSG_BASE + 31;	  // Plugin config has changed and viewer should reinitialize itself if necessary
  DVPLUGINMSG_SHOWHIDESCROLLBARS     = DVPLUGINMSG_BASE + 32;	  // wParam = BOOL indicating whether scrollbars should be shown or hidden
  DVPLUGINMSG_INLOADLOOP             = DVPLUGINMSG_BASE + 33;   // Viewer is currently loading a picture
  DVPLUGINMSG_SETIMAGEFRAME          = DVPLUGINMSG_BASE + 34;	  // wParam = BOOL indicating whether image should be framed
  DVPLUGINMSG_SETDESKWALLPAPERA      = DVPLUGINMSG_BASE + 35;	  // lParam = optional LPSTR parameters ("center"/"tile"/"stretch"/"fit"/"fill") (WALLPAPERMODELIST)
  DVPLUGINMSG_GETZOOMLIMITS          = DVPLUGINMSG_BASE + 36;	  // Return value indicates max/min zoom limits (HIWORD(max), LOWORD(min))
  DVPLUGINMSG_THUMBSCHANGED          = DVPLUGINMSG_BASE + 37;	  // Thumbnails have changed, wParam = DWORD flags
  DVPLUGINMSG_GETBITMAP              = DVPLUGINMSG_BASE + 38;	  // Return an HBITMAP representing your current image (will be freed by Directory Opus)
  DVPLUGINMSG_GAMMACHANGE            = DVPLUGINMSG_BASE + 39;	  // Gamma correction value has changed
  DVPLUGINMSG_APPCOMMAND             = DVPLUGINMSG_BASE + 40;	  // AppCommand message, return TRUE if handled
  DVPLUGINMSG_PREVENTFRAME           = DVPLUGINMSG_BASE + 41;	  // Return TRUE to prevent framing of image
  DVPLUGINMSG_FULLSCREEN             = DVPLUGINMSG_BASE + 42;	  // Full screen mode has been turned on or off (wParam indicates state, return TRUE to disallow change)
  DVPLUGINMSG_SHOWFILEINFO           = DVPLUGINMSG_BASE + 43;	  // Show file information (wParam = BOOL on or off)
  DVPLUGINMSG_ISFILEINFOSHOWN        = DVPLUGINMSG_BASE + 44;	  // Returns TRUE if file information is currently visible
  DVPLUGINMSG_SETDESKWALLPAPERW      = DVPLUGINMSG_BASE + 45;	  // lParam = optional LPWSTR parameters ("center"/"tile"/"stretch"/"fit"/"fill") (WALLPAPERMODELIST)
  DVPLUGINMSG_PREVENTAUTOSIZE        = DVPLUGINMSG_BASE + 46;	  // Return TRUE to prevent auto-sizing of viewer window
  DVPLUGINMSG_SHOWHEX                = DVPLUGINMSG_BASE + 47;	  // if wParam = TRUE, lParam contains desired hex state. Return TRUE if in hex mode
  DVPLUGINMSG_ISALPHAHIDDEN          = DVPLUGINMSG_BASE + 48;	  // lParam = BOOL*, set to TRUE if alpha channel is currently hidden. Return FALSE if no alpha channel
  DVPLUGINMSG_HIDEALPHA              = DVPLUGINMSG_BASE + 49;	  // wParam = TRUE if alpha channel should be hidden
  DVPLUGINMSG_CROPSELECTION          = DVPLUGINMSG_BASE + 50;	  // Crop image to current selection, wParam = TRUE to test (return TRUE/FALSE if cropping available), wParam = FALSE to actually crop (return TRUE/FALSE to indicate success)
  DVPLUGINMSG_RESTORE                = DVPLUGINMSG_BASE + 51;	  // Restore original image, wParam = TRUE to test (return TRUE/FALSE if restore available), wParam = FALSE to actually restore (return TRUE/FALSE to indicate success)
  DVPLUGINMSG_MOUSEHORIZWHEEL        = DVPLUGINMSG_BASE + 52;	  // Mouse wheel message (horizontal; like WM_MOUSEHWHEEL; note the H)
  DVPLUGINMSG_WANTSCREEN             = DVPLUGINMSG_BASE + 53;	  // Return TRUE to request that screensaver & monitor power-down do not happen. (Doesn't block computer sleep; use SetThreadExecutionState for that. Also has no effect if the screensaver is password-protected. Will not be called after computer battery reaches critical level.)
  DVPLUGINMSG_GETIMAGETYPEFORSAVINGW = DVPLUGINMSG_BASE + 54;	  // Not normally used. Allows GIF plugin to override internal GIF viewer without disabling Opus's Save-Overwrite code. (Save-As is unaffected either way. This is just for Ctrl-S to work, basically.) wParam = LPWSTR buffer for plugin to write filetype into (e.g. L"GIF"). lParam = DWORD_PTR maximum character count of buffer. Return FALSE if not implemented or to disable saving; TRUE to enable saving to the given format.
  DVPLUGINMSG_FLIP                   = DVPLUGINMSG_BASE + 55;	  // Flip image (wParam: 1=horizontal; 2 = vertical)
  DVPLUGINMSG_RESELECT               = DVPLUGINMSG_BASE + 56;	  // wParam = RECT*. Re-select the last selection rectangle. Opus will tell you what it thinks that is via wParam, but you can ignore that if it doesn't make sense for your plugin.
  DVPLUGINMSG_TESTRESELECT           = DVPLUGINMSG_BASE + 57;	  // wParam = RECT*. Ask the plugin if the Re-Select menu command should be enabled. Return TRUE to enable. wParam is what Opus considers the last selection rectangle, but plugins can ignore this if more appropriate.
  DVPLUGINMSG_LOADCACHEW             = DVPLUGINMSG_BASE + 58;	  // Load picture (wParam = LPWSTR lspzName, lParam = HANDLE hCacheData) - Plugin must also implement DVP_ViewerCacheLoadW and DVP_ViewerCacheFree. lspzName should only be used for display or verification purposes, not to re-open the file, since it could be a path into an archive or similar, and no stream is provided. If the messsage returns FALSE, Opus will then use the normal DVPLUGINMSG_LOADW or DVPLUGINMSG_LOADSTREAMW routes, so you can store bits of your cache data but then intentionally fail if you need to get the file or stream open again to finish loading.

  {$IFDEF UNICODE}
  DVPLUGINMSG_LOAD                    = DVPLUGINMSG_LOADW;
  DVPLUGINMSG_LOADSTREAM              = DVPLUGINMSG_LOADSTREAMW;
  DVPLUGINMSG_GETIMAGEINFO            = DVPLUGINMSG_GETIMAGEINFOW;
  DVPLUGINMSG_ADDCONTEXTMENU          = DVPLUGINMSG_ADDCONTEXTMENUW;
  DVPLUGINMSG_SETDESKWALLPAPER        = DVPLUGINMSG_SETDESKWALLPAPERW;
  DVPLUGINMSG_LOADCACHE               = DVPLUGINMSG_LOADCACHEW;
  {$ELSE}
  DVPLUGINMSG_LOAD                    = DVPLUGINMSG_LOADA;
  DVPLUGINMSG_LOADSTREAM              = DVPLUGINMSG_LOADSTREAMA;
  DVPLUGINMSG_GETIMAGEINFO            = DVPLUGINMSG_GETIMAGEINFOA;
  DVPLUGINMSG_ADDCONTEXTMENU          = DVPLUGINMSG_ADDCONTEXTMENUA;
  DVPLUGINMSG_SETDESKWALLPAPER        = DVPLUGINMSG_SETDESKWALLPAPERA;
  // No ANSI version of DVPLUGINMSG_LOADCACHEW.
  {$ENDIF}


  // Notification messages sent from a plugin to its parent window
  DVPN_FIRST                  = UInt32(0 - 2000);
  DVPN_LAST                   = UInt32(0 - 2026);

  DVPN_GETBGCOL               = DVPN_FIRST - 00;   // Get background color (return value is a COLORREF);
  DVPN_SIZECHANGE             = DVPN_FIRST - 01;   // Image size has changed (DVPNMSIZECHANGE structure);
  DVPN_CLICK                  = DVPN_FIRST - 02;   // Mouse click (single left button click, DVPNMCLICK structure);
  DVPN_RESETZOOM              = DVPN_FIRST - 03;   // Reset zoom factor (zoom factor has had to be changed, DVPNMRESETZOOM structure);
  DVPN_LBUTTONSCROLL          = DVPN_FIRST - 04;   // Get 'left button scroll' flag (return value is BOOL indicating whether left button should be used for scrolling);
  DVPN_CLEARED                = DVPN_FIRST - 05;   // Picture has been cleared (sent by plugin to tell parent that picture has been cleared from display);
  DVPN_FOCUSCHANGE            = DVPN_FIRST - 06;   // Focus has changed (DVPNMFOCUSCHANGE structure);
  DVPN_CAPABILITIES           = DVPN_FIRST - 07;   // Capabilities flags have changed (DVPNMCAPABILITIES structure);
  DVPN_STATUSTEXT             = DVPN_FIRST - 08;   // Display status text (DVPNMSTATUSTEXT structure);
  DVPN_LOADNEWFILE            = DVPN_FIRST - 09;   // Load a new file (DVPNMLOADNEWFILE structre);
  DVPN_SETCURSOR              = DVPN_FIRST - 10;   // Set cursor (DVPNMSETCURSOR structure);
  DVPN_MCLICK                 = DVPN_FIRST - 11;   // Middle button click, same as DVPN_CLICK
  DVPN_GETGAMMA               = DVPN_FIRST - 12;   // Get gamma correction settings (DVPNMGAMMA structure);
  DVPN_BUTTONOPTS             = DVPN_FIRST - 13;   // Get button options (DVPNMBUTTONOPTS structure);
  DVPN_GETCURSORS             = DVPN_FIRST - 14;   // Get handles to standard Opus cursors (DVPNMGETCURSORS structure);
  DVPN_MOUSEWHEEL             = DVPN_FIRST - 15;   // Mouse vertical wheel message (DVPNMMOUSEWHEEL structure);
  DVPN_HEXSTATE               = DVPN_FIRST - 16;   // Hex state changed (DVPNMHEXSTATE structure);
  DVPN_TRANSLATEACCEL         = DVPN_FIRST - 17;   // Translate accelerators (DVPNMTRANSLATEACCEL structure);
  DVPN_LISTERBUSY             = DVPN_FIRST - 18;   // Make Lister busy or unbusy (DVPNMLISTERBUSY structure);
  DVPN_CALCULATERECT          = DVPN_FIRST - 19;   // Calculate a rectangle relating to the viewer. Returns BOOL success. (DVPNMCALCULATERECT structure);
  DVPN_CLICKQUERY             = DVPN_FIRST - 20;   // Queries what DVPN_CLICK will do if sent. Takes DVPNMCLICK structure and returns one of the BUTTONOPT_ values. While DVPN_BUTTONOPTS returns the settings as per Preferences, DVPN_CLICK is a "live" query and takes account of the shift key and fTop flag.
  DVPN_MCLICKQUERY            = DVPN_FIRST - 21;   // Queries what DVPN_MCLICK will do if sent. Takes DVPNMCLICK structure and returns one of the BUTTONOPT_ values. While DVPN_BUTTONOPTS returns the settings as per Preferences, DVPN_CLICK is a "live" query and takes account of the shift key and fTop flag.
  DVPN_MOUSEHORIZWHEEL        = DVPN_FIRST - 22;   // Mouse horizontal wheel message (DVPNMMOUSEWHEEL structure);
  DVPN_GETROTATION            = DVPN_FIRST - 23;   // Opus 10.0.2.3 and above: Get current rotation. (Return value is INT rotation in degrees.);
  DVPN_BUTTONACTION           = DVPN_FIRST - 24;   // Opus 10.0.4.3 and above: Ask Opus to act as if one of the viewer's toolbar buttons was clicked. Set NMHDR's idFrom to a DVIEWERACTION_* code.
  DVPN_SETRESELECT            = DVPN_FIRST - 25;   // Tell Opus the user just selected a rectangle. It will be stored and used for the next Re-Select command. (DVPNMSETRESELECT structure); .
  DVPN_SELCHANGED             = DVPN_FIRST - 26;   // Selection rectangle may have changed. (DVPNMSELCHANGED structure);


  // Button options for DVPN_BUTTONOPTS, DVPN_CLICKQUERY and DVPN_MCLICKQUERY
  // Some values are only relevant to some of the three notifications.
  BUTTONOPT_NONE               = 0;
  BUTTONOPT_SELECT             = 1;
  BUTTONOPT_ADVANCE            = 2;
  BUTTONOPT_SCROLL             = 3;
  BUTTONOPT_FULLSCREEN         = 4;
  BUTTONOPT_CLOSE              = 5;
  BUTTONOPT_SHOWMENUBAR        = 6;
  BUTTONOPT_SHOWTOOLBAR        = 7;
  BUTTONOPT_HIDEMENUANDTOOLBAR = 8;
  BUTTONOPT_LCOMMAND           = 9;
  BUTTONOPT_MCOMMAND           = 10;

  // Zoom constants for DVPLUGINMSG_ZOOM
  ZOOM_ORIGINAL  = 0;
  ZOOM_FITPAGE   = -1;
  ZOOM_TILED     = -2;
  ZOOM_GROWPAGE  = -3;

  // Cursor constants for DVPN_SETCURSOR
  VPCURSOR_NONE   = 0;
  VPCURSOR_DRAG   = 1;
  VPCURSOR_SELECT = 2;

  // operation values for DVPNMCALCULATERECT
  VPCALCRECT_WINDOW_TO_VIEWER    = 0;  // DVPNMCALCULATERECT.rc is a window rect and will be converted to the viewer rect by subtracting the window borders, toolbar and menu. No adjustments are made for scrollbars.
  VPCALCRECT_VIEWER_TO_WINDOW    = 1;  // DVPNMCALCULATERECT.rc is a viewer rect and will be converted to the window rect by adding the window borders, toolbar and menu. No adjustments are made for scrollbars.
  VPCALCRECT_MAX_VIEWER_AUTOSIZE = 2;  // DVPNMCALCULATERECT.rc will be set to the maximum possible viewer rect which could result from an image size change. This is based on current auto-size preferences, toolbar & menu visibily, full-screen mode and the workspace of the monitor which the viewer is on. The result is not neccessarily the maximum size that the viewer can reach; if autosizing is disabled the user can still manually resize the window.

  // Viewer capability flags returned by DVPLUGINMSG_GETCAPABILITIES
  VPCAPABILITY_RESIZE_FIT             = 1 shl 0;   // Can resize to fit page (reduce images to fit the window, if required)
  VPCAPABILITY_RESIZE_ANY             = 1 shl 1;   // Can resize to any percentage
  VPCAPABILITY_ROTATE_RIGHTANGLE      = 1 shl 2;   // Can rotate in steps of 90 degrees
  VPCAPABILITY_ROTATE_ANY             = 1 shl 3;   // Can rotate to any angle
  VPCAPABILITY_SELECTALL              = 1 shl 4;   // Can 'select all' for clipboard copy
  VPCAPABILITY_COPYALL                = 1 shl 5;   // Can 'copy all' to clipboard
  VPCAPABILITY_COPYSELECTION          = 1 shl 6;   // Can 'copy selection' to clipboard
  VPCAPABILITY_PRINT                  = 1 shl 7;   // Can print
  VPCAPABILITY_WANTFOCUS              = 1 shl 8;   // Viewer wants input focus
  VPCAPABILITY_SHOWPROPERTIES         = 1 shl 9;   // Can show properties dialog
  VPCAPABILITY_WANTMOUSEWHEEL         = 1 shl 10;  // Viewer wants to handle mouse wheel itself
  VPCAPABILITY_ADDCONTEXTMENU         = 1 shl 11;  // Viewer can add context menu items
  VPCAPABILITY_HASDIALOGS             = 1 shl 12;  // Viewer may have dialogs and wants DVPLUGINMSG_ISDLGMESSAGE messages
  VPCAPABILITY_HASACCELERATORS        = 1 shl 13;  // Viewer may have accelerators and wants DVPLUGINMSG_TRANSLATEACCEL messages
  VPCAPABILITY_CANSETWALLPAPER        = 1 shl 14;  // Viewer can set desktop wallpaper
  VPCAPABILITY_CANTRACKFOCUS          = 1 shl 15;  // Viewer can reliably track its focus state
  VPCAPABILITY_SUPPLYBITMAP           = 1 shl 16;  // Viewer can return a bitmap of its current image
  VPCAPABILITY_GAMMA                  = 1 shl 17;  // Viewer supports gamma correction
  VPCAPABILITY_FILEINFO               = 1 shl 18;  // Viewer can display file information
  VPCAPABILITY_RESIZE_TILE            = 1 shl 19;  // Can display a tiled preview
  VPCAPABILITY_HIDEALPHA              = 1 shl 20;  // Can hide (ignore) the alpha channel
  VPCAPABILITY_NOFULLSCREEN           = 1 shl 21;  // Viewer does not support full screen mode
  VPCAPABILITY_CROPSELECTION          = 1 shl 22;  // Viewer can crop to selected area
  VPCAPABILITY_RESIZE_GROW            = 1 shl 23;  // Can resize to fit page (enlarge or reduce images to fit the window)
  VPCAPABILITY_FLIP                   = 1 shl 24;  // Can flip horizontally or vertically
  VPCAPABILITY_RESELECT               = 1 shl 25;  // Can re-select based on previous selection rectangle
  VPCAPABILITY_INITIALFLIP            = 1 shl 26;  // Viewer respects initial flip flags set via DVPLUGINMSG_SETROTATION.

  // Flags for DVPLUGINMSG_THUMBSCHANGED
  DVPTCF_REDRAW                       = 1 shl 0;
  DVPTCF_FLUSHCACHE                   = 1 shl 1;

  // DVPCONTEXTMENUITEM flags
  DVPCMF_CHECKED      = 1 shl 0;  // Item appears checked
  DVPCMF_RADIOCHECK   = 1 shl 1;  // Checkmark uses a radio button
  DVPCMF_DISABLED     = 1 shl 2;  // Item is disabled
  DVPCMF_SEPARATOR    = 1 shl 3;  // Item is a separator
  DVPCMF_BEGINSUBMENU = 1 shl 4;  // Item is a submenu
  DVPCMF_ENDSUBMENU   = 1 shl 5;  // Item is the last in a submenu

  DVIEWERACTION_PREV         = 0;
  DVIEWERACTION_NEXT         = 1;
  DVIEWERACTION_ROTATELEFT   = 2;
  DVIEWERACTION_ROTATERIGHT  = 3;
  DVIEWERACTION_ZOOMIN       = 4;
  DVIEWERACTION_ZOOMOUT      = 5;
  DVIEWERACTION_ORIGINALSIZE = 6;
  DVIEWERACTION_FITTOPAGE    = 7;
  DVIEWERACTION_GROWTOPAGE   = 8;
  DVIEWERACTION_HEX          = 9;
  DVIEWERACTION_SLIDESHOW    = 10;
  DVIEWERACTION_FULLSCREEN   = 11;
  DVIEWERACTION_PRINT        = 12;
  DVIEWERACTION_PREFS        = 13;

  // Exported plugin DLL functions
  DVPFUNCNAME_USBSAFE                       = 'DVP_USBSafe';                       // DVP_USBSafe not supported in Opus 10

  DVPFUNCNAME_INIT                          = 'DVP_Init';
  DVPFUNCNAME_INITEX                        = 'DVP_InitEx';
  DVPFUNCNAME_UNINIT                        = 'DVP_Uninit';
  DVPFUNCNAME_IDENTIFYA                     = 'DVP_IdentifyA';
  DVPFUNCNAME_IDENTIFYW                     = 'DVP_IdentifyW';
  DVPFUNCNAME_IDENTIFYFILEA                 = 'DVP_IdentifyFileA';
  DVPFUNCNAME_IDENTIFYFILEW                 = 'DVP_IdentifyFileW';
  DVPFUNCNAME_IDENTIFYFILESTREAMA           = 'DVP_IdentifyFileStreamA';
  DVPFUNCNAME_IDENTIFYFILESTREAMW           = 'DVP_IdentifyFileStreamW';
  DVPFUNCNAME_IDENTIFYFILEBYTESA            = 'DVP_IdentifyFileBytesA';
  DVPFUNCNAME_IDENTIFYFILEBYTESW            = 'DVP_IdentifyFileBytesW';
  DVPFUNCNAME_LOADBITMAPA                   = 'DVP_LoadBitmapA';
  DVPFUNCNAME_LOADBITMAPW                   = 'DVP_LoadBitmapW';
  DVPFUNCNAME_LOADBITMAPSTREAMA             = 'DVP_LoadBitmapStreamA';
  DVPFUNCNAME_LOADBITMAPSTREAMW             = 'DVP_LoadBitmapStreamW';
  DVPFUNCNAME_LOADTEXTA                     = 'DVP_LoadTextA';
  DVPFUNCNAME_LOADTEXTW                     = 'DVP_LoadTextW';
  DVPFUNCNAME_SHOWPROPERTIESA               = 'DVP_ShowPropertiesA';
  DVPFUNCNAME_SHOWPROPERTIESW               = 'DVP_ShowPropertiesW';
  DVPFUNCNAME_SHOWPROPERTIESSTREAMA         = 'DVP_ShowPropertiesStreamA';
  DVPFUNCNAME_SHOWPROPERTIESSTREAMW         = 'DVP_ShowPropertiesStreamW';
  DVPFUNCNAME_CREATEVIEWER                  = 'DVP_CreateViewer';
  DVPFUNCNAME_CONFIGURE                     = 'DVP_Configure';
  DVPFUNCNAME_CONFIGUREPRETRANSLATEMESSAGEW = 'DVP_ConfigurePreTranslateMessageW';
  DVPFUNCNAME_CONFIGUREISDIALOGMESSAGEW     = 'DVP_ConfigureIsDialogMessageW';
  DVPFUNCNAME_ABOUT                         = 'DVP_About';
  DVPFUNCNAME_GETFILEINFOFILEA              = 'DVP_GetFileInfoFileA';
  DVPFUNCNAME_GETFILEINFOFILEW              = 'DVP_GetFileInfoFileW';
  DVPFUNCNAME_GETFILEINFOFILESTREAMA        = 'DVP_GetFileInfoFileStreamA';
  DVPFUNCNAME_GETFILEINFOFILESTREAMW        = 'DVP_GetFileInfoFileStreamW';
  DVPFUNCNAME_SETMETADATA                   = 'DVP_SetMetaData';
  DVPFUNCNAME_VIEWERCACHELOADW              = 'DVP_ViewerCacheLoadW';
  DVPFUNCNAME_VIEWERCACHEFREE               = 'DVP_ViewerCacheFree';

  {$IFDEF UNICODE}
  DVPFUNCNAME_IDENTIFY                = DVPFUNCNAME_IDENTIFYW;
  DVPFUNCNAME_IDENTIFYFILE            = DVPFUNCNAME_IDENTIFYFILEW;
  DVPFUNCNAME_IDENTIFYFILESTREAM      = DVPFUNCNAME_IDENTIFYFILESTREAMW;
  DVPFUNCNAME_IDENTIFYFILEBYTES       = DVPFUNCNAME_IDENTIFYFILEBYTESW;
  DVPFUNCNAME_LOADBITMAP              = DVPFUNCNAME_LOADBITMAPW;
  DVPFUNCNAME_LOADBITMAPSTREAM        = DVPFUNCNAME_LOADBITMAPSTREAMW;
  DVPFUNCNAME_LOADTEXT                = DVPFUNCNAME_LOADTEXTW;
  DVPFUNCNAME_SHOWPROPERTIES          = DVPFUNCNAME_SHOWPROPERTIESW;
  DVPFUNCNAME_SHOWPROPERTIESSTREAM    = DVPFUNCNAME_SHOWPROPERTIESSTREAMW;
  DVPFUNCNAME_GETFILEINFOFILE         = DVPFUNCNAME_GETFILEINFOFILEW;
  DVPFUNCNAME_GETFILEINFOFILESTREAM   = DVPFUNCNAME_GETFILEINFOFILESTREAMW;
  DVPFUNCNAME_VIEWERCACHELOAD         = DVPFUNCNAME_VIEWERCACHELOADW;
  {$ELSE}
  DVPFUNCNAME_IDENTIFY                = DVPFUNCNAME_IDENTIFYA;
  DVPFUNCNAME_IDENTIFYFILE            = DVPFUNCNAME_IDENTIFYFILEA;
  DVPFUNCNAME_IDENTIFYFILESTREAM      = DVPFUNCNAME_IDENTIFYFILESTREAMA;
  DVPFUNCNAME_IDENTIFYFILEBYTES       = DVPFUNCNAME_IDENTIFYFILEBYTESA;
  DVPFUNCNAME_LOADBITMAP              = DVPFUNCNAME_LOADBITMAPA;
  DVPFUNCNAME_LOADBITMAPSTREAM        = DVPFUNCNAME_LOADBITMAPSTREAMA;
  DVPFUNCNAME_LOADTEXT                = DVPFUNCNAME_LOADTEXTA;
  DVPFUNCNAME_SHOWPROPERTIES          = DVPFUNCNAME_SHOWPROPERTIESA;
  DVPFUNCNAME_SHOWPROPERTIESSTREAM    = DVPFUNCNAME_SHOWPROPERTIESSTREAMA;
  DVPFUNCNAME_GETFILEINFOFILE         = DVPFUNCNAME_GETFILEINFOFILEA;
  DVPFUNCNAME_GETFILEINFOFILESTREAM   = DVPFUNCNAME_GETFILEINFOFILESTREAMA;
  //DVPFUNCNAME_VIEWERCACHELOAD         = DVPFUNCNAME_VIEWERCACHELOADW - - No ANSI verison .;
  {$ENDIF}

  // dwStreamFlags for the Stream functions
  // If DVPSF_SlowSeek is set but DVPSF_Slow and DVPSF_NoRandomSeek are not then you can assume seeks are only slow
  // if they go beyond the data that has been read so far. For example, most archive types require extracting all data
  // up to the point you wish to read and are thus slow at seeking forwards. SOME archive types will cache the data
  // read so far and thus support full random-access seeking with fast seeking in the cached area but slow seeking to,
  // say, the end of the file. SOME archive types do not allow backward seeking at all.)
  // If DVPSF_NoRandomSeek is set then you can assume seeks are slow whether or not DVPSF_SlowSeek is explicitly set.
  DVPSF_Slow         = 1 shl 0;  // Stream refers to 'slow' media (e.g. FTP site)
  DVPSF_NoRandomSeek = 1 shl 1;  // Stream does not support random seek (MAY still allow forward seeks; assume they will be slow whether or not DVPSF_SlowSeek is set)

  DVPSF_SlowSeek     = 1 shl 2;  // Stream is slow at (some) seek operations (see note above) (assume this is set, even if it isn't, if DVPSF_NoRandomSeek is set)

  // dwFlags for the CreateViewer function
  DVPCVF_Border      = 1 shl 1;  // Create viewer window with a border
  DVPCVF_Preview     = 1 shl 2;  // Viewer is being used for the Lister View Pane
  DVPCVF_ReturnTabs  = 1 shl 3;  // Pass tab keypresses (via NM_KEYDOWN message) to parent window

  // Data structure for the DVP_LoadText function
  DVPCVF_FromStream  = 1 shl 0;

  DVPText_Plain = 0;
  DVPText_Rich  = 1;
  DVPText_HTML  = 2;

  // The meaning of the first two flags changed slightly in Opus 9.1.2.0. Should not have affected any existing plugins.
  DVPMusicFlag_DurationInaccurate = 1 shl 0;
  DVPMusicFlag_VBR                = 1 shl 1;
  DVPMusicFlag_JointStereo        = 1 shl 2;
  DVPMusicFlag_Protected          = 1 shl 3;

  // Metadata setting
  MetaStatus_Ok           = 0;
  MetaStatus_NotSupported = 1;
  MetaStatus_BadType      = 2;
  MetaStatus_Failed       = 3;

  MetaType_Remove         = -1;    // remove this attribute
  MetaType_DWORD          = 0;
  MetaType_String         = 1;
  MetaType_StringMultiple = 2;
  MetaType_Binary         = 3;
  MetaType_Bool           = 4;
  MetaType_QWORD          = 5;

  DVMETA_RATING  = 'Opus/Rating';
  DVMETA_TAGS    = 'Opus/Tags';
  DVMETA_COMMENT = 'Opus/Comment';

  // Image frame size used by Opus
//  {$IF VIEWERPLUGINVERSION >= 4}
  OPUSVIEWER_IMAGE_FRAME_SIZE = 14;
//  {$ELSE}
//  OPUSVIEWER_IMAGE_FRAME_SIZE = 8;
//  {$ENDIF}

{$REGION 'Viewer C++ const'}
//const
//  x86
//  VIEWERPLUGININFOW_V1_SIZE      = 108
//  VIEWERPLUGININFOW_V4_SIZE      = 128
//  VIEWERPLUGININFOA_V1_SIZE      = 108
//  VIEWERPLUGININFOA_V4_SIZE      = 128
//
//  VIEWERPLUGININFO_V1_SIZE       = 108
//  VIEWERPLUGININFO_V4_SIZE       = 128
//
//  VIEWERPLUGINFILEINFOW_V1_SIZE  = 68
//  VIEWERPLUGINFILEINFOW_V2_SIZE  = 76
//  VIEWERPLUGINFILEINFOW_V3_SIZE  = 96
//  VIEWERPLUGINFILEINFOW_V4_SIZE  = 104
//  VIEWERPLUGINFILEINFOA_V1_SIZE  = 68
//  VIEWERPLUGINFILEINFOA_V2_SIZE  = 76
//  VIEWERPLUGINFILEINFOA_V3_SIZE  = 96
//  VIEWERPLUGINFILEINFOA_V4_SIZE  = 104
//
//  VIEWERPLUGINFILEINFO_V1_SIZE   = 68
//  VIEWERPLUGINFILEINFO_V2_SIZE   = 76
//  VIEWERPLUGINFILEINFO_V3_SIZE   = 96
//  VIEWERPLUGINFILEINFO_V4_SIZE   = 104
//
//  DVPFILEINFOMUSICA_V1_SIZE      = 104
//  DVPFILEINFOMUSICA_V4_SIZE      = 108
//  DVPFILEINFOMUSICA_V5_SIZE      = 160
//  DVPFILEINFOMUSICW_V1_SIZE      = 104
//  DVPFILEINFOMUSICW_V4_SIZE      = 108
//  DVPFILEINFOMUSICW_V5_SIZE      = 168
//  DVPFILEINFOMUSICW_V6_SIZE      = 172
//
//  DVPFILEINFOMUSIC_V1_SIZE       = 104
//  DVPFILEINFOMUSIC_V4_SIZE       = 108
//  DVPFILEINFOMUSIC_V5_SIZE       = 168
//  DVPFILEINFOMUSIC_V6_SIZE       = 172
//
//  DVPFILEINFOMOVIEW_V1_SIZE      = 80
//  DVPFILEINFOMOVIEW_V5_SIZE      = 264
//
//  DVPFILEINFOMOVIE_V1_SIZE       = 80
//  DVPFILEINFOMOVIE_V5_SIZE       = 264
//
//  x64
//  VIEWERPLUGININFOW_V1_SIZE      = 132
//  VIEWERPLUGININFOW_V4_SIZE      = 160
//  VIEWERPLUGININFOA_V1_SIZE      = 132
//  VIEWERPLUGININFOA_V4_SIZE      = 160
//
//  VIEWERPLUGININFO_V1_SIZE       = 132
//  VIEWERPLUGININFO_V4_SIZE       = 160
//
//  VIEWERPLUGINFILEINFOW_V1_SIZE  = 72
//  VIEWERPLUGINFILEINFOW_V2_SIZE  = 80
//  VIEWERPLUGINFILEINFOW_V3_SIZE  = 96
//  VIEWERPLUGINFILEINFOW_V4_SIZE  = 104
//  VIEWERPLUGINFILEINFOA_V1_SIZE  = 72
//  VIEWERPLUGINFILEINFOA_V2_SIZE  = 80
//  VIEWERPLUGINFILEINFOA_V3_SIZE  = 96
//  VIEWERPLUGINFILEINFOA_V4_SIZE  = 104
//
//  VIEWERPLUGINFILEINFO_V1_SIZE   = 72
//  VIEWERPLUGINFILEINFO_V2_SIZE   = 80
//  VIEWERPLUGINFILEINFO_V3_SIZE   = 96
//  VIEWERPLUGINFILEINFO_V4_SIZE   = 104
//
//  DVPFILEINFOMUSICA_V1_SIZE      = 164
//  DVPFILEINFOMUSICA_V4_SIZE      = 168
//  DVPFILEINFOMUSICA_V5_SIZE      = 232
//  DVPFILEINFOMUSICW_V1_SIZE      = 164
//  DVPFILEINFOMUSICW_V4_SIZE      = 168
//  DVPFILEINFOMUSICW_V5_SIZE      = 244
//  DVPFILEINFOMUSICW_V6_SIZE      = 248
//
//  DVPFILEINFOMUSIC_V1_SIZE       = 164
//  DVPFILEINFOMUSIC_V4_SIZE       = 168
//  DVPFILEINFOMUSIC_V5_SIZE       = 244
//
//  DVPFILEINFOMOVIEW_V1_SIZE      = 92
//  DVPFILEINFOMOVIEW_V5_SIZE      = 440
//
//  DVPFILEINFOMOVIE_V1_SIZE       = 92
//  DVPFILEINFOMOVIE_V5_SIZE       = 440
{$ENDREGION}

{$ENDREGION}

{*************************************************************************************************}

{$REGION 'VFS Consts'}
// Current version - define VFSPLUGINVERSION when including this file to use an older version
// of the SDK
// Version 1 of the SDK corresponds to Directory Opus 8
// Version 2 corresponds to Directory Opus 9
  VFSPLUGINVERSION = 2;

const
  // VIEWERPLUGININFO initialisation flags
  VFSINITF_FIRSTTIME = (1 shl 0); // First time this plugin has been initialised
  VFSINITF_USB       = (1 shl 1); // Opus is running in USB mode
  
  // Plugin flags
  VFSF_CANCONFIGURE    = (1 shl 0);
  VFSF_CANSHOWABOUT    = (1 shl 1);
  VFSF_MULTIPLEFORMATS = (1 shl 2);
  VFSF_NONREENTRANT    = (1 shl 3);
  
  // Capabilities flags
  // Note that not all values in the 32-bit bitmask are used here, however
  // they are used internally by Opus and so must NOT be set. They may be
  // documented in a future version of this API.
  VFSCAPABILITY_MOVEBYRENAME          = (1 shl 0);
  VFSCAPABILITY_COPYINDEFINITESIZES   = (1 shl 5);
  VFSCAPABILITY_CANRESUMECOPIES       = (1 shl 6);
  VFSCAPABILITY_TRIGGERRESUME         = (1 shl 7);
  VFSCAPABILITY_POSTCOPYREREAD        = (1 shl 8);
  VFSCAPABILITY_CASESENSITIVE         = (1 shl 9);
  VFSCAPABILITY_RANDOMSEEK            = (1 shl 11);
  VFSCAPABILITY_FILEDESCRIPTIONS      = (1 shl 13);
  VFSCAPABILITY_ALLOWMUSICCOLUMNS     = (1 shl 14);
  VFSCAPABILITY_ALLOWIMAGECOLUMNS     = (1 shl 15);
  VFSCAPABILITY_ALLOWEXTRADATECOLUMNS = (1 shl 16);
  VFSCAPABILITY_LETMEDOPARENTS        = (1 shl 17);
  VFSCAPABILITY_COMBINEDPROPERTIES    = (1 shl 19);
  VFSCAPABILITY_COMPARETIMENOSECONDS  = (1 shl 21);
  VFSCAPABILITY_GETBATCHFILEINFO      = (1 shl 23);
  VFSCAPABILITY_SLOW                  = (1 shl 24);
  VFSCAPABILITY_MULTICREATEDIR        = (1 shl 26);
  VFSCAPABILITY_ALLOWFILEHASH         = (1 shl 28);
  VFSCAPABILITY_READONLY              = (1 shl 29);
  VFSCAPABILITY_CHECKAVAILONDIRCHANGE = (1 shl 30);

  // VFSFILEDATA flags
  VFSFDF_INDEFINITESIZE = (1 shl 0); // only used for VFS_GetFileInformation
  VFSFDF_BOLD           = (1 shl 1); // display file in bold
  VFSFDF_SELECTED       = (1 shl 2); // file is initially selected

  // VFSPROP_FUNCAVAILABILITY flags
  // #define BM64(l) (((unsigned __int64)1)<<(l))

  VFSFUNCAVAIL_COPY              = UInt64(1) shl 0;
  VFSFUNCAVAIL_MOVE              = UInt64(1) shl 1;
  VFSFUNCAVAIL_DELETE            = UInt64(1) shl 2;
  VFSFUNCAVAIL_GETSIZES          = UInt64(1) shl 3;
  VFSFUNCAVAIL_MAKEDIR           = UInt64(1) shl 4;
  VFSFUNCAVAIL_PRINT             = UInt64(1) shl 5;
  VFSFUNCAVAIL_PROPERTIES        = UInt64(1) shl 6;
  VFSFUNCAVAIL_RENAME            = UInt64(1) shl 7;
  VFSFUNCAVAIL_SETATTR           = UInt64(1) shl 8;
  VFSFUNCAVAIL_SHORTCUT          = UInt64(1) shl 9;
  VFSFUNCAVAIL_SELECTALL         = UInt64(1) shl 10;
  VFSFUNCAVAIL_SELECTNONE        = UInt64(1) shl 11;
  VFSFUNCAVAIL_SELECTINVERT      = UInt64(1) shl 12;
  VFSFUNCAVAIL_VIEWLARGEICONS    = UInt64(1) shl 13;
  VFSFUNCAVAIL_VIEWSMALLICONS    = UInt64(1) shl 14;
  VFSFUNCAVAIL_VIEWLIST          = UInt64(1) shl 15;
  VFSFUNCAVAIL_VIEWDETAILS       = UInt64(1) shl 16;
  VFSFUNCAVAIL_VIEWTHUMBNAIL     = UInt64(1) shl 17;
  VFSFUNCAVAIL_CLIPCOPY          = UInt64(1) shl 18;
  VFSFUNCAVAIL_CLIPCUT           = UInt64(1) shl 19;
  VFSFUNCAVAIL_CLIPPASTE         = UInt64(1) shl 20;
  VFSFUNCAVAIL_CLIPPASTESHORTCUT = UInt64(1) shl 21;
  VFSFUNCAVAIL_UNDO              = UInt64(1) shl 22;
  VFSFUNCAVAIL_SHOW              = UInt64(1) shl 23;
  VFSFUNCAVAIL_DUPLICATE         = UInt64(1) shl 24;
  VFSFUNCAVAIL_SPLITJOIN         = UInt64(1) shl 25;
  VFSFUNCAVAIL_SELECTRESELECT    = UInt64(1) shl 26;
  VFSFUNCAVAIL_SELECTALLFILES    = UInt64(1) shl 27;
  VFSFUNCAVAIL_SELECTALLDIRS     = UInt64(1) shl 28;
  VFSFUNCAVAIL_PLAY              = UInt64(1) shl 29;
  VFSFUNCAVAIL_SETTIME           = UInt64(1) shl 30;
  VFSFUNCAVAIL_VIEWTILE          = UInt64(1) shl 31;
  VFSFUNCAVAIL_SETCOMMENT        = UInt64(1) shl 32;

  // Custom column flags
  VFSCCF_LEFTJUSTIFY   = 0;
  VFSCCF_RIGHTJUSTIFY  = (1 shl 0);
  VFSCCF_CENTERJUSTIFY = (1 shl 2);
  VFSCCF_NUMBER        = (1 shl 4);
  VFSCCF_PERCENT       = (1 shl 5);
  VFSCCF_SIZE          = (1 shl 6);

  // Context verb flags
  DOPUSCVF_ISDIR = (1 shl 3);

  // Return values from VFS_ContextVerb
  VFSCVRES_FAIL      = 0;
  VFSCVRES_HANDLED   = 1;
  VFSCVRES_DEFAULT   = 2;
  VFSCVRES_EXTRACT   = 3;
  VFSCVRES_CHANGE    = 4;
  VFSCVRES_CHANGEDIR = 5;

  // VFSCONTEXTMENUITEM flags
  VFSCMF_CHECKED      = (1 shl 0); // Item appears checked
  VFSCMF_RADIOCHECK   = (1 shl 1); // Checkmark uses a radio button
  VFSCMF_DISABLED     = (1 shl 2); // Item is disabled
  VFSCMF_SEPARATOR    = (1 shl 3); // Item is a separator
  VFSCMF_BEGINSUBMENU = (1 shl 4); // Item is a submenu
  VFSCMF_ENDSUBMENU   = (1 shl 5); // Item is the last in a submenu

  // VFS_CreateFile flags
  VFSCREATEF_MODEMASK      = $F;
  VFSCREATEF_RESUME        = $01000;
  VFSCREATEF_RECURSIVECOPY = $02000;
  VFSCREATEF_THUMBNAIL     = $04000;
  VFSCREATEF_IGNOREIFSLOW  = $10000;
  VFSCREATEF_BUFFERED      = $20000;

  // VFS_CreateDirectory flags
  VFSCREATEDIRF_COPY     = (1 shl 0);
  VFSCREATEDIRF_MULTIPLE = (1 shl 1);

  // VFS_DeleteFile flags
  VFSDELETEF_FORCE        = (1 shl 0);
  VFSDELETEF_RECYCLE      = (1 shl 1);
  VFSDELETEF_REPLACE      = (1 shl 2);
  VFSDELETEF_COPYFAILED   = (1 shl 3);
  VFSDELETEF_SOURCERESUME = (1 shl 5);

  // VFS_SeekFile flags
  VFSSEEKF_RESUME = (1 shl 0);

  VFSBATCHOP_ADD                = 1;                     // Add files to an archive
  VFSBATCHOP_EXTRACT            = 2;                     // Extract files from an archive
  VFSBATCHOP_DELETE             = 3;                     // Delete files from an archive

  VFSBATCHRES_DODEFAULT         = 0;                     // Do default operation
  VFSBATCHRES_SKIP              = 1;                     // Skip this file
  VFSBATCHRES_HANDLED           = 2;                     // File has been handled by the batch operation
  VFSBATCHRES_ABORT             = 3;                     // Abort the function
  VFSBATCHRES_COMPLETE          = 4;                     // Operation has been completed for all files
  VFSBATCHRES_CALLFOREACH       = (1 shl 12);            // Call batch operation for each file

  // Batch operation flags
  BATCHF_COPY_PRESERVE_ATTR     = (1 shl 0);             // Preserve file attributes
  BATCHF_COPY_PRESERVE_DATE     = (1 shl 1);             // Preserve file dates
  BATCHF_COPY_PRESERVE_COMMENTS = (1 shl 2);             // Preserve comments
  BATCHF_COPY_PRESERVE_SECURITY = (1 shl 3);             // Preserve security info
  BATCHF_COPY_ASK_REPLACE       = (1 shl 4);             // Ask to overwrite existing files
  BATCHF_COPY_ASK_REPLACE_RO    = (1 shl 5);             // Ask to overwrite read only files
  BATCHF_COPY_RENAME            = (1 shl 6);             // Copy/Move As
  BATCHF_DELETE_ASK             = (1 shl 7);             // Ask to begin delete
  BATCHF_DELETE_ASK_FILES       = (1 shl 8);             // Ask to delete files
  BATCHF_DELETE_ASK_FOLDERS     = (1 shl 9);             // Ask to delete folders
  BATCHF_DELETE_UNPROTECT       = (1 shl 10);            // Unprotect automatically
  BATCHF_DELETE_ALL             = (1 shl 11);            // Delete all without prompting for each
  BATCHF_DELETE_QUIET           = (1 shl 12);            // Don't prompt to begin
  BATCHF_DELETE_FORCE           = (1 shl 13);            // Force deletion
  BATCHF_DELETE_SECURE          = (1 shl 14);            // Secure delete
  BATCHF_FILTER                 = (1 shl 15);            // A filter is in force
  BATCHF_FILTER_FOLDERS         = (1 shl 16);            // A filter is in force for folders
  BATCHF_PROGRESS_SUBFOLDERS    = (1 shl 17);            // Progress bar knows about sub-folder contents
  BATCHF_COPY_DELETE_ORIGINAL   = (1 shl 18);            // Operation is a 'Move' - delete original files

  // Exported plugin DLL functions
  VFSFUNCNAME_IDENTIFYA           = 'VFS_IdentifyA';
  VFSFUNCNAME_IDENTIFYW           = 'VFS_IdentifyW';
  VFSFUNCNAME_QUERYPATHA          = 'VFS_QueryPathA';
  VFSFUNCNAME_QUERYPATHW          = 'VFS_QueryPathW';
  VFSFUNCNAME_GETCAPABILITIES     = 'VFS_GetCapabilities';
  VFSFUNCNAME_GETCUSTOMCOLUMNSA   = 'VFS_GetCustomColumnsA';
  VFSFUNCNAME_GETCUSTOMCOLUMNSW   = 'VFS_GetCustomColumnsW';
  VFSFUNCNAME_GETPREFIXLISTA      = 'VFS_GetPrefixListA';
  VFSFUNCNAME_GETPREFIXLISTW      = 'VFS_GetPrefixListW';
  VFSFUNCNAME_CREATE              = 'VFS_Create';
  VFSFUNCNAME_CLONE               = 'VFS_Clone';
  VFSFUNCNAME_DESTROY             = 'VFS_Destroy';
  VFSFUNCNAME_GETLASTERROR        = 'VFS_GetLastError';
  VFSFUNCNAME_READDIRECTORYA      = 'VFS_ReadDirectoryA';
  VFSFUNCNAME_READDIRECTORYW      = 'VFS_ReadDirectoryW';
  VFSFUNCNAME_GETPATHDISPLAYNAMEA = 'VFS_GetPathDisplayNameA';
  VFSFUNCNAME_GETPATHDISPLAYNAMEW = 'VFS_GetPathDisplayNameW';
  VFSFUNCNAME_GETPATHPARENTROOTA  = 'VFS_GetPathParentRootA';
  VFSFUNCNAME_GETPATHPARENTROOTW  = 'VFS_GetPathParentRootW';
  VFSFUNCNAME_GETFILEINFORMATIONA = 'VFS_GetFileInformationA';
  VFSFUNCNAME_GETFILEINFORMATIONW = 'VFS_GetFileInformationW';
  VFSFUNCNAME_GETFILEDESCRIPTIONA = 'VFS_GetFileDescriptionA';
  VFSFUNCNAME_GETFILEDESCRIPTIONW = 'VFS_GetFileDescriptionW';
  VFSFUNCNAME_GETFILEICONA        = 'VFS_GetFileIconA';
  VFSFUNCNAME_GETFILEICONW        = 'VFS_GetFileIconW';
  VFSFUNCNAME_CREATEFILEA         = 'VFS_CreateFileA';
  VFSFUNCNAME_CREATEFILEW         = 'VFS_CreateFileW';
  VFSFUNCNAME_READFILE            = 'VFS_ReadFile';
  VFSFUNCNAME_WRITEFILE           = 'VFS_WriteFile';
  VFSFUNCNAME_SEEKFILE            = 'VFS_SeekFile';
  VFSFUNCNAME_CLOSEFILE           = 'VFS_CloseFile';
  VFSFUNCNAME_MOVEFILEA           = 'VFS_MoveFileA';
  VFSFUNCNAME_MOVEFILEW           = 'VFS_MoveFileW';
  VFSFUNCNAME_DELETEFILEA         = 'VFS_DeleteFileA';
  VFSFUNCNAME_DELETEFILEW         = 'VFS_DeleteFileW';
  VFSFUNCNAME_SETFILETIMEA        = 'VFS_SetFileTimeA';
  VFSFUNCNAME_SETFILETIMEW        = 'VFS_SetFileTimeW';
  VFSFUNCNAME_SETFILEATTRA        = 'VFS_SetFileAttrA';
  VFSFUNCNAME_SETFILEATTRW        = 'VFS_SetFileAttrW';
  VFSFUNCNAME_GETFILEATTRA        = 'VFS_GetFileAttrA';
  VFSFUNCNAME_GETFILEATTRW        = 'VFS_GetFileAttrW';
  VFSFUNCNAME_SETFILECOMMENTA     = 'VFS_SetFileCommentA';
  VFSFUNCNAME_SETFILECOMMENTW     = 'VFS_SetFileCommentW';
  VFSFUNCNAME_GETFILECOMMENTA     = 'VFS_GetFileCommentA';
  VFSFUNCNAME_GETFILECOMMENTW     = 'VFS_GetFileCommentW';
  VFSFUNCNAME_CREATEDIRECTORYA    = 'VFS_CreateDirectoryA';
  VFSFUNCNAME_CREATEDIRECTORYW    = 'VFS_CreateDirectoryW';
  VFSFUNCNAME_REMOVEDIRECTORYA    = 'VFS_RemoveDirectoryA';
  VFSFUNCNAME_REMOVEDIRECTORYW    = 'VFS_RemoveDirectoryW';
  VFSFUNCNAME_GETFILESIZEA        = 'VFS_GetFileSizeA';
  VFSFUNCNAME_GETFILESIZEW        = 'VFS_GetFileSizeW';
  VFSFUNCNAME_FINDFIRSTFILEA      = 'VFS_FindFirstFileA';
  VFSFUNCNAME_FINDFIRSTFILEW      = 'VFS_FindFirstFileW';
  VFSFUNCNAME_FINDNEXTFILEA       = 'VFS_FindNextFileA';
  VFSFUNCNAME_FINDNEXTFILEW       = 'VFS_FindNextFileW';
  VFSFUNCNAME_FINDCLOSE           = 'VFS_FindClose';
  VFSFUNCNAME_PROPGETA            = 'VFS_PropGetA';
  VFSFUNCNAME_PROPGETW            = 'VFS_PropGetW';
  VFSFUNCNAME_CONTEXTVERBA        = 'VFS_ContextVerbA';
  VFSFUNCNAME_CONTEXTVERBW        = 'VFS_ContextVerbW';
  VFSFUNCNAME_EXTRACTFILESA       = 'VFS_ExtractFilesA';
  VFSFUNCNAME_EXTRACTFILESW       = 'VFS_ExtractFilesW';
  VFSFUNCNAME_PROPERTIESA         = 'VFS_PropertiesA';
  VFSFUNCNAME_PROPERTIESW         = 'VFS_PropertiesW';
  VFSFUNCNAME_GETCONTEXTMENUA     = 'VFS_GetContextMenuA';
  VFSFUNCNAME_GETCONTEXTMENUW     = 'VFS_GetContextMenuW';
  VFSFUNCNAME_GETDROPMENUA        = 'VFS_GetDropMenuA';
  VFSFUNCNAME_GETDROPMENUW        = 'VFS_GetDropMenuW';
  VFSFUNCNAME_GETFREEDISKSPACEA   = 'VFS_GetFreeDiskSpaceA';
  VFSFUNCNAME_GETFREEDISKSPACEW   = 'VFS_GetFreeDiskSpaceW';
  VFSFUNCNAME_CONFIGURE           = 'VFS_Configure';
  VFSFUNCNAME_ABOUT               = 'VFS_About';
  VFSFUNCNAME_BATCHOPERATIONA     = 'VFS_BatchOperationA';
  VFSFUNCNAME_BATCHOPERATIONW     = 'VFS_BatchOperationW';
  VFSFUNCNAME_USBSAFE             = 'VFS_USBSafe';
  VFSFUNCNAME_INIT                = 'VFS_Init';
  VFSFUNCNAME_UNINIT              = 'VFS_Uninit';
  
{$IFDEF UNICODE}
  VFSFUNCNAME_IDENTIFY           = VFSFUNCNAME_IDENTIFYW;
  VFSFUNCNAME_GETCUSTOMCOLUMNS   = VFSFUNCNAME_GETCUSTOMCOLUMNSW;
  VFSFUNCNAME_QUERYPATH          = VFSFUNCNAME_QUERYPATHW;
  VFSFUNCNAME_GETPREFIXLIST      = VFSFUNCNAME_GETPREFIXLISTW;
  VFSFUNCNAME_READDIRECTORY      = VFSFUNCNAME_READDIRECTORYW;
  VFSFUNCNAME_GETPATHDISPLAYNAME = VFSFUNCNAME_GETPATHDISPLAYNAMEW;
  VFSFUNCNAME_GETPATHPARENTROOT  = VFSFUNCNAME_GETPATHPARENTROOTW;
  VFSFUNCNAME_GETFILEINFORMATION = VFSFUNCNAME_GETFILEINFORMATIONW;
  VFSFUNCNAME_GETFILEDESCRIPTION = VFSFUNCNAME_GETFILEDESCRIPTIONW;
  VFSFUNCNAME_GETFILEICON        = VFSFUNCNAME_GETFILEICONW;
  VFSFUNCNAME_CREATEFILE         = VFSFUNCNAME_CREATEFILEW;
  VFSFUNCNAME_MOVEFILE           = VFSFUNCNAME_MOVEFILEW;
  VFSFUNCNAME_DELETEFILE         = VFSFUNCNAME_DELETEFILEW;
  VFSFUNCNAME_SETFILETIME        = VFSFUNCNAME_SETFILETIMEW;
  VFSFUNCNAME_SETFILEATTR        = VFSFUNCNAME_SETFILEATTRW;
  VFSFUNCNAME_GETFILEATTR        = VFSFUNCNAME_GETFILEATTRW;
  VFSFUNCNAME_GETFILECOMMENT     = VFSFUNCNAME_GETFILECOMMENTW;
  VFSFUNCNAME_SETFILECOMMENT     = VFSFUNCNAME_SETFILECOMMENTW;
  VFSFUNCNAME_CREATEDIRECTORY    = VFSFUNCNAME_CREATEDIRECTORYW;
  VFSFUNCNAME_REMOVEDIRECTORY    = VFSFUNCNAME_REMOVEDIRECTORYW;
  VFSFUNCNAME_GETFILESIZE        = VFSFUNCNAME_GETFILESIZEW;
  VFSFUNCNAME_FINDFIRSTFILE      = VFSFUNCNAME_FINDFIRSTFILEW;
  VFSFUNCNAME_FINDNEXTFILE       = VFSFUNCNAME_FINDNEXTFILEW;
  VFSFUNCNAME_PROPGET            = VFSFUNCNAME_PROPGETW;
  VFSFUNCNAME_CONTEXTVERB        = VFSFUNCNAME_CONTEXTVERBW;
  VFSFUNCNAME_EXTRACTFILES       = VFSFUNCNAME_EXTRACTFILESW;
  VFSFUNCNAME_PROPERTIES         = VFSFUNCNAME_PROPERTIESW;
  VFSFUNCNAME_GETCONTEXTMENU     = VFSFUNCNAME_GETCONTEXTMENUW;
  VFSFUNCNAME_GETDROPMENU        = VFSFUNCNAME_GETDROPMENUW;
  VFSFUNCNAME_GETFREEDISKSPACE   = VFSFUNCNAME_GETFREEDISKSPACEW;
  VFSFUNCNAME_BATCHOPERATION     = VFSFUNCNAME_BATCHOPERATIONW;
{$ELSE}
  VFSFUNCNAME_IDENTIFY           = VFSFUNCNAME_IDENTIFYA;
  VFSFUNCNAME_GETCUSTOMCOLUMNS   = VFSFUNCNAME_GETCUSTOMCOLUMNSA;
  VFSFUNCNAME_QUERYPATH          = VFSFUNCNAME_QUERYPATHA;
  VFSFUNCNAME_GETPREFIXLIST      = VFSFUNCNAME_GETPREFIXLISTA;
  VFSFUNCNAME_READDIRECTORY      = VFSFUNCNAME_READDIRECTORYA;
  VFSFUNCNAME_GETPATHDISPLAYNAME = VFSFUNCNAME_GETPATHDISPLAYNAMEA;
  VFSFUNCNAME_GETPATHPARENTROOT  = VFSFUNCNAME_GETPATHPARENTROOTA;
  VFSFUNCNAME_GETFILEINFORMATION = VFSFUNCNAME_GETFILEINFORMATIONA;
  VFSFUNCNAME_GETFILEDESCRIPTION = VFSFUNCNAME_GETFILEDESCRIPTIONA;
  VFSFUNCNAME_GETFILEICON        = VFSFUNCNAME_GETFILEICONA;
  VFSFUNCNAME_CREATEFILE         = VFSFUNCNAME_CREATEFILEA;
  VFSFUNCNAME_MOVEFILE           = VFSFUNCNAME_MOVEFILEA;
  VFSFUNCNAME_DELETEFILE         = VFSFUNCNAME_DELETEFILEA;
  VFSFUNCNAME_SETFILETIME        = VFSFUNCNAME_SETFILETIMEA;
  VFSFUNCNAME_SETFILEATTR        = VFSFUNCNAME_SETFILEATTRA;
  VFSFUNCNAME_GETFILEATTR        = VFSFUNCNAME_GETFILEATTRA;
  VFSFUNCNAME_SETFILECOMMENT     = VFSFUNCNAME_SETFILECOMMENTA;
  VFSFUNCNAME_GETFILECOMMENT     = VFSFUNCNAME_GETFILECOMMENTA;
  VFSFUNCNAME_CREATEDIRECTORY    = VFSFUNCNAME_CREATEDIRECTORYA;
  VFSFUNCNAME_REMOVEDIRECTORY    = VFSFUNCNAME_REMOVEDIRECTORYA;
  VFSFUNCNAME_GETFILESIZE        = VFSFUNCNAME_GETFILESIZEA;
  VFSFUNCNAME_FINDFIRSTFILE      = VFSFUNCNAME_FINDFIRSTFILEA;
  VFSFUNCNAME_FINDNEXTFILE       = VFSFUNCNAME_FINDNEXTFILEA;
  VFSFUNCNAME_PROPGET            = VFSFUNCNAME_PROPGETA;
  VFSFUNCNAME_CONTEXTVERB        = VFSFUNCNAME_CONTEXTVERBA;
  VFSFUNCNAME_EXTRACTFILES       = VFSFUNCNAME_EXTRACTFILESA;
  VFSFUNCNAME_PROPERTIES         = VFSFUNCNAME_PROPERTIESA;
  VFSFUNCNAME_GETCONTEXTMENU     = VFSFUNCNAME_GETCONTEXTMENUA;
  VFSFUNCNAME_GETDROPMENU        = VFSFUNCNAME_GETDROPMENUA;
  VFSFUNCNAME_GETFREEDISKSPACE   = VFSFUNCNAME_GETFREEDISKSPACEA;
  VFSFUNCNAME_BATCHOPERATION = VFSFUNCNAME_BATCHOPERATIONW;
{$ENDIF}

  // Custom Directory Opus file errors
  VFSERR_COPY_INTO_ITSELF       = -2;
  VFSERR_NOT_SUPPORTED          = -3;
  VFSERR_MOVE_INTO_SAMEDIR      = -4;
  VFSERR_DIR_ALREADY_EXISTS     = -5;
  VFSERR_FILE_IS_DIR            = -6;
  VFSERR_BADLINK                = -7;
  VFSERR_NOTEXPORTFILE          = -8;
  VFSERR_NORECYCLEBIN           = -9;
  VFSERR_RECYCLETOOBIG          = -10;
  VFSERR_NOPRINTHANDLER         = -11;
  VFSERR_BADZIPFILE             = -12;
  VFSERR_GENERALERRMSG          = -13;
  VFSERR_WRITEPROTECTED         = -14;
  VFSERR_WRITEPROTECTEDZIP      = -15;
  VFSERR_ZIPISDIR               = -16;
  VFSERR_CANTRENAMEFOLDERS      = -17;
  VFSERR_SHARINGVIOLATION       = -18;
  VFSERR_ALREADYINCOLL          = -19;
  VFSERR_CANTCOPYTOCOLLROOT     = -20;
  VFSERR_NOMOVETOCOLLECTION     = -21;
  VFSERR_NOJOINTOCOLLECTION     = -22;
  VFSERR_NODROPDATATOCOLLECTION = -23;
  VFSERR_NOCOLLINCOLL           = -24;
  VFSERR_FEATURENOTENABLED      = -25;
  VFSERR_UNKNOWNERROR           = -26;
  VFSERR_CANTCOPYFILEOVERITSELF = -27;
  VFSERR_CANTCHANGEZIPCASE      = -28;
  VFSERR_NOT_EXTRACTABLE = -29;

  // Reinitialise message for VFS_Configure function
  DVFSPLUGINMSG_REINITIALIZE = (WM_APP + $FFF);
{$ENDREGION}

implementation

end.