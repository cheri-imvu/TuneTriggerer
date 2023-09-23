; Script generated by the Inno Setup Script Wizard and ChatGPT, with manual revisions.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Triggerless Triggerbot"
#define MyAppVersion "0.8.0"
#define MyAppPublisher "triggerless.com"
#define MyAppURL "https://triggerless.com"
#define MyAppExeName "TriggerBot.exe"
#define MyAppIcoName "favicon.ico"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B698BC6A-2407-4B85-B87B-6F638BF423E7}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userappdata}\Triggerless\Triggerbot
DisableDirPage=yes
DisableProgramGroupPage=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
OutputBaseFilename=mysetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupIconFile=D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\assets\favicon.ico


[Code]
function IsAppInstalled(): Boolean;
var
  UninstallKey: string;
begin
  // Specify the uninstallation registry key for your application
  UninstallKey := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{B698BC6A-2407-4B85-B87B-6F638BF423E7}';

  // Check if the uninstallation registry key exists
  Result := RegKeyExists(HKCU, UninstallKey);
end;

function GetUninstallerPath(): string;
var
  UninstallKey: string;
begin
  // Specify the uninstallation registry key for your application
  UninstallKey := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{B698BC6A-2407-4B85-B87B-6F638BF423E7}';

  // Read the UninstallString value from the uninstallation registry key
  Result := '';

  if RegQueryStringValue(HKCU, UninstallKey, 'UninstallString', Result) then
  begin
    // Remove any quotes surrounding the uninstaller path
    Result := RemoveQuotes(Result);
  end;
end;

function InitializeSetup(): Boolean;
var
  UninstallExePath: string;
  ResultCode: Integer;
begin
  // Check if the application is already installed
  if IsAppInstalled() then
  begin
    // Get the path to the uninstaller for the currently installed version
    UninstallExePath := GetUninstallerPath();

    // Execute the uninstaller if the path is valid
    if UninstallExePath <> '' then
    begin
      // Execute the uninstaller and wait for it to finish
      Exec('"' + UninstallExePath + '"', '/SILENT', '', SW_SHOW, ewWaitUntilTerminated, ResultCode);

      // Check if the uninstallation was successful
      if ResultCode = 0 then
      begin
        // Uninstallation succeeded, continue with the installation
        Result := True;
      end
      else
      begin
        // Uninstallation failed, abort the installation
        MsgBox('Unable to uninstall the previous version. Please manually uninstall the application before proceeding.', mbError, MB_OK);
        Result := False;
      end;
    end
    else
    begin
      // Invalid uninstaller path, abort the installation
      MsgBox('Unable to find the uninstaller for the previous version. Please manually uninstall the application before proceeding.', mbError, MB_OK);
      Result := False;
    end;
  end
  else
  begin
    Result := True; // Continue with the installation
  end;
end;


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\assets\favicon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\ffmpeg.exe"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\libbz2-1.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\libgcc_s_seh-1.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\libgomp-1.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\libiconv-2.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\liblzma-5.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\libssp-0.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\libwinpthread-1.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ffmpeg\xvidcore.dll"; DestDir: "{app}\ffmpeg"; Flags: ignoreversion

Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\x64\SQLite.Interop.dll"; DestDir: "{app}\x64"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\x86\SQLite.Interop.dll"; DestDir: "{app}\x86"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\Dapper.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ICSharpCode.SharpZipLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ManagedWinapi.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\ManagedWinapiNativeHelper.dll"; DestDir: "{app}"; Flags: ignoreversion 
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\Microsoft.Win32.Registry.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\Microsoft.WindowsAPICodePack.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\Microsoft.WindowsAPICodePack.Shell.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.Asio.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.Midi.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.Wasapi.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.WaveFormRenderer.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.WinForms.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NAudio.WinMM.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\NVorbis.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Buffers.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Data.SQLite.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Drawing.Common.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Memory.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Numerics.Vectors.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Runtime.CompilerServices.Unsafe.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Security.AccessControl.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Security.Principal.Windows.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\System.Threading.Tasks.Extensions.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\Triggerless.XAFLib.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\DEV\CS\triggerless-triggerbot\Triggerless.TriggerBot\bin\Release\TriggerBot.exe.config"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\{#MyAppIcoName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

