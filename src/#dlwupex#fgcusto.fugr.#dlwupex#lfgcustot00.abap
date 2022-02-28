*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: /DLWUPEX/TALE2WT................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TALE2WT              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TALE2WT              .
CONTROLS: TCTRL_/DLWUPEX/TALE2WT
            TYPE TABLEVIEW USING SCREEN '0006'.
*...processing: /DLWUPEX/TBUHEAD................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TBUHEAD              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TBUHEAD              .
CONTROLS: TCTRL_/DLWUPEX/TBUHEAD
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: /DLWUPEX/TBUOA..................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TBUOA                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TBUOA                .
CONTROLS: TCTRL_/DLWUPEX/TBUOA
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: /DLWUPEX/TBUOC..................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TBUOC                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TBUOC                .
CONTROLS: TCTRL_/DLWUPEX/TBUOC
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: /DLWUPEX/TCUSTO.................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TCUSTO               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TCUSTO               .
CONTROLS: TCTRL_/DLWUPEX/TCUSTO
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: /DLWUPEX/TFIELDS................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TFIELDS              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TFIELDS              .
CONTROLS: TCTRL_/DLWUPEX/TFIELDS
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: /DLWUPEX/TSTEPS.................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TSTEPS               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TSTEPS               .
CONTROLS: TCTRL_/DLWUPEX/TSTEPS
            TYPE TABLEVIEW USING SCREEN '0007'.
*...processing: /DLWUPEX/TTAXE..................................*
DATA:  BEGIN OF STATUS_/DLWUPEX/TTAXE                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_/DLWUPEX/TTAXE                .
CONTROLS: TCTRL_/DLWUPEX/TTAXE
            TYPE TABLEVIEW USING SCREEN '9000'.
*.........table declarations:.................................*
TABLES: */DLWUPEX/TALE2WT              .
TABLES: */DLWUPEX/TBUHEAD              .
TABLES: */DLWUPEX/TBUOA                .
TABLES: */DLWUPEX/TBUOC                .
TABLES: */DLWUPEX/TCUSTO               .
TABLES: */DLWUPEX/TFIELDS              .
TABLES: */DLWUPEX/TSTEPS               .
TABLES: */DLWUPEX/TTAXE                .
TABLES: /DLWUPEX/TALE2WT               .
TABLES: /DLWUPEX/TBUHEAD               .
TABLES: /DLWUPEX/TBUOA                 .
TABLES: /DLWUPEX/TBUOC                 .
TABLES: /DLWUPEX/TCUSTO                .
TABLES: /DLWUPEX/TFIELDS               .
TABLES: /DLWUPEX/TSTEPS                .
TABLES: /DLWUPEX/TTAXE                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
