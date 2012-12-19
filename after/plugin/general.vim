" Config for taglist plugin
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Update = 1
let tlist_php_settings = 'php;c:class;d:constant;f:function'
if exists('loaded_taglist')
    nmap <silent> <Leader>t :TlistToggle<Cr>
endif
