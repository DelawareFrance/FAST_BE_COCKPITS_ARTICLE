*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_/DLWUPEX/FGCUSTO
*   generation date: 17.06.2019 at 15:05:10
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_/DLWUPEX/FGCUSTO   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
