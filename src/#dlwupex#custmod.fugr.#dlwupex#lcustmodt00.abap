*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: /DLWUPEX/TCHECK.................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TCHECK               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TCHECK               .
CONTROLS: TCTRL_/DLWUPEX/TCHECK
            TYPE TABLEVIEW USING SCREEN '9006'.
*...processing: /DLWUPEX/TLIM_AR................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TLIM_AR              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TLIM_AR              .
CONTROLS: TCTRL_/DLWUPEX/TLIM_AR
            TYPE TABLEVIEW USING SCREEN '9000'.
*...processing: /DLWUPEX/TLINK..................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TLINK                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TLINK                .
CONTROLS: TCTRL_/DLWUPEX/TLINK
            TYPE TABLEVIEW USING SCREEN '9008'.
*...processing: /DLWUPEX/TST_MOD................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TST_MOD              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TST_MOD              .
CONTROLS: TCTRL_/DLWUPEX/TST_MOD
            TYPE TABLEVIEW USING SCREEN '9010'.
*...processing: /DLWUPEX/TUSERGR................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TUSERGR              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TUSERGR              .
CONTROLS: TCTRL_/DLWUPEX/TUSERGR
            TYPE TABLEVIEW USING SCREEN '9002'.
*...processing: /DLWUPEX/TVIEW_K................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TVIEW_K              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TVIEW_K              .
CONTROLS: TCTRL_/DLWUPEX/TVIEW_K
            TYPE TABLEVIEW USING SCREEN '9004'.
*.........table declarations:.................................*
TABLES: */DLWUPEX/TCHECK               .
TABLES: */DLWUPEX/TLIM_AR              .
TABLES: */DLWUPEX/TLINK                .
TABLES: */DLWUPEX/TST_MOD              .
TABLES: */DLWUPEX/TUSERGR              .
TABLES: */DLWUPEX/TVIEW_K              .
TABLES: /DLWUPEX/TCHECK                .
TABLES: /DLWUPEX/TLIM_AR               .
TABLES: /DLWUPEX/TLINK                 .
TABLES: /DLWUPEX/TST_MOD               .
TABLES: /DLWUPEX/TUSERGR               .
TABLES: /DLWUPEX/TVIEW_K               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
