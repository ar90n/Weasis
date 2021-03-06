;This file will be executed next to the application bundle image

;I.e. current directory will contain folder INSTALLER_NAME with application files

[Setup]

AppId=PRODUCT_APP_IDENTIFIER

AppName=INSTALLER_NAME

AppVersion=APPLICATION_VERSION

AppVerName=INSTALLER_NAME APPLICATION_VERSION

AppPublisher=APPLICATION_VENDOR

AppComments=APPLICATION_COMMENTS

AppCopyright=APPLICATION_COPYRIGHT

DefaultDirName=APPLICATION_INSTALL_ROOT\INSTALLER_NAME

DisableStartupPrompt=Yes

DisableDirPage=DISABLE_DIR_PAGE

DisableProgramGroupPage=Yes

DisableReadyPage=Yes

DisableFinishedPage=Yes

DisableWelcomePage=Yes

DefaultGroupName=APPLICATION_GROUP

;Optional License

LicenseFile=APPLICATION_LICENSE_FILE

;WinXP or above

MinVersion=0,5.1

OutputBaseFilename=INSTALLER_FILE_NAME

Compression=lzma

SolidCompression=yes

PrivilegesRequired=APPLICATION_INSTALL_PRIVILEGE

SetupIconFile=INSTALLER_NAME\LAUNCHER_NAME.ico

UninstallDisplayIcon={app}\LAUNCHER_NAME.ico

UninstallDisplayName=INSTALLER_NAME

WizardImageStretch=No

WizardSmallImageFile=INSTALLER_NAME-setup-icon.bmp

ArchitecturesInstallIn64BitMode=ARCHITECTURE_BIT_MODE

FILE_ASSOCIATIONS



[Languages]

Name: "english"; MessagesFile: "compiler:Default.isl"



[Files]

Source: "INSTALLER_NAME\LAUNCHER_NAME.exe"; DestDir: "{app}"; Flags: ignoreversion

Source: "INSTALLER_NAME\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs



[Icons]

Name: "{group}\INSTALLER_NAME"; Filename: "{app}\LAUNCHER_NAME.exe"; IconFilename: "{app}\LAUNCHER_NAME.ico"; Check: APPLICATION_MENU_SHORTCUT()

Name: "{commondesktop}\INSTALLER_NAME"; Filename: "{app}\LAUNCHER_NAME.exe";  IconFilename: "{app}\LAUNCHER_NAME.ico"; Check: APPLICATION_DESKTOP_SHORTCUT()

Name: "{group}\Dicomizer"; Filename: "{app}\WeasisDicomizer.exe"; IconFilename: "{app}\WeasisDicomizer.ico"; Check: APPLICATION_MENU_SHORTCUT()



[Run]

Filename: "{app}\RUN_FILENAME.exe"; Parameters: "-Xappcds:generatecache"; Check: APPLICATION_APP_CDS_INSTALL()

Filename: "{app}\RUN_FILENAME.exe"; Description: "{cm:LaunchProgram,INSTALLER_NAME}"; Flags: nowait postinstall skipifsilent; Check: APPLICATION_NOT_SERVICE()

Filename: "{app}\RUN_FILENAME.exe"; Parameters: "-install -svcName ""INSTALLER_NAME"" -svcDesc ""APPLICATION_DESCRIPTION"" -mainExe ""APPLICATION_LAUNCHER_FILENAME"" START_ON_INSTALL RUN_AT_STARTUP"; Check: APPLICATION_SERVICE()



[UninstallRun]

Filename: "{app}\RUN_FILENAME.exe "; Parameters: "-uninstall -svcName INSTALLER_NAME STOP_ON_UNINSTALL"; Check: APPLICATION_SERVICE()

[Registry]
Root: HKCR; Subkey: "weasis"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "weasis"; ValueType: string; ValueData: "Weasis URI handler"; Flags: uninsdeletekey
Root: HKCR; Subkey: "weasis"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: uninsdeletekey
Root: HKCR; Subkey: "weasis"; ValueType: string; ValueName: "DefaultIcon"; ValueData: """{app}\Weasis.ico"",1"; Flags: uninsdeletekey
Root: HKCR; Subkey: "weasis\shell"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "weasis\shell\open"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "weasis\shell\open\command"; ValueType: string; ValueData: """{app}\Weasis.exe"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "weasis-dicomizer"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "weasis-dicomizer"; ValueType: string; ValueData: "Weasis Dicomizer URI handler"; Flags: uninsdeletekey
Root: HKCR; Subkey: "weasis-dicomizer"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""; Flags: uninsdeletekey
Root: HKCR; Subkey: "weasis-dicomizer"; ValueType: string; ValueName: "DefaultIcon"; ValueData: """{app}\WeasisDicomizer.ico"",1"; Flags: uninsdeletekey
Root: HKCR; Subkey: "weasis-dicomizer\shell"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "weasis-dicomizer\shell\open"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "weasis-dicomizer\shell\open\command"; ValueType: string; ValueData: """{app}\WeasisDicomizer.exe"" ""%1"""; Flags: uninsdeletekey

[Code]

function returnTrue(): Boolean;

begin

  Result := True;

end;



function returnFalse(): Boolean;

begin

  Result := False;

end;



function InitializeSetup(): Boolean;

begin

// Possible future improvements:

//   if version less or same => just launch app

//   if upgrade => check if same app is running and wait for it to exit

  Result := True;

end;