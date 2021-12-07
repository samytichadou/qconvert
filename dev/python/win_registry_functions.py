import winreg as wreg
import win_admin_functions

def install_base_registry_entries():

    # FILE MENU
    fm_key = wreg.CreateKey(wreg.HKEY_CLASSES_ROOT, "*\\Shell\\qc_file_menu2")
    # wreg.SetValue(fm_key, 'MUIVerb', wreg.REG_SZ, 'QConvert2')
    wreg.SetValueEx(fm_key, 'MUIVerb', 0, wreg.REG_SZ, 'QConvert2')
    # subcommands = "qc_convert2_h264;qc_settings;qc_folder;qc_path;qc_uninstall"
    subcommands = "qc_test;qc_settings"
    # wreg.SetValue(fm_key, 'SubCommands', wreg.REG_SZ, subcommands)
    wreg.SetValueEx(fm_key, 'SubCommands', 0, wreg.REG_SZ, subcommands)
    fm_key.Close()

    # SETTINGS ENTRY
    test_key = wreg.CreateKey(wreg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CommandStore\\shell\\qc_test")
    wreg.SetValueEx(test_key, '', 0, wreg.REG_SZ, 'Test1')
    ffmpeg_command = r'python "path" args'
    wreg.SetValue(test_key, 'command', wreg.REG_SZ, ffmpeg_command)
    test_key.Close()

    settings_key = wreg.CreateKey(wreg.HKEY_LOCAL_MACHINE, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\CommandStore\\shell\\qc_settings")
    wreg.SetValueEx(settings_key, '', 0, wreg.REG_SZ, 'Test2')
    ffmpeg_command = r'python "path" args'
    wreg.SetValue(settings_key, 'command', wreg.REG_SZ, ffmpeg_command)
    wreg.SetValueEx(settings_key,"CommandFlags",0, wreg.REG_DWORD, 0x00000020) #separator before
    settings_key.Close()

win_admin_functions.get_admin_rights()
install_base_registry_entries()