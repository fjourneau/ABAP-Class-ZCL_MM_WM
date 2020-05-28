CLASS zcl_mm_wm DEFINITION.
*                public              " Uncomment that tu use as
*                create public .     " public class (in SE24)

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ts_goodsmvt_create_return,
                    s_created_mvt TYPE bapi2017_gm_head_ret,
                    s_success     TYPE bapiret2,
                    t_errors      TYPE bapiret2_tab,
                  END OF ts_goodsmvt_create_return .
    TYPES:
      BEGIN OF ts_goodsmvt_cancel_return,
                    s_cancelled_mvt TYPE bapi2017_gm_head_ret,
                    s_success       TYPE bapiret2,
                    t_errors        TYPE bapiret2_tab,
                  END OF ts_goodsmvt_cancel_return .
    TYPES:
      BEGIN OF ts_to_create_return,
                    tanum                 TYPE tanum,
                    partial_transfer_done TYPE t340dteilv,
                    s_success             TYPE bapiret2,
                    t_errors              TYPE bapiret2_tab,
                  END OF ts_to_create_return .

    CONSTANTS:
      BEGIN OF c_mm_mvt_tcode,
                  mb01  TYPE gm_code VALUE '01',
                  mb31  TYPE gm_code VALUE '02',
                  mb1a  TYPE gm_code VALUE '03',
                  mb1b  TYPE gm_code VALUE '04',
                  mb1c  TYPE gm_code VALUE '05',
                  mb11  TYPE gm_code VALUE '06',
                  mb04  TYPE gm_code VALUE '07',
                END OF c_mm_mvt_tcode .

    CLASS-METHODS add_bapiret2_msg
      IMPORTING
        !iv_ty TYPE bapi_mtype
        !iv_id TYPE symsgid
        !iv_no TYPE msgno
        !iv_v1 TYPE any OPTIONAL
        !iv_v2 TYPE any OPTIONAL
        !iv_v3 TYPE any OPTIONAL
        !iv_v4 TYPE any OPTIONAL
      RETURNING
        VALUE(rs_bapiret2) TYPE bapiret2 .
    CLASS-METHODS add_bapiret2_table_msg
      IMPORTING
        !iv_ty TYPE bapi_mtype
        !iv_id TYPE symsgid
        !iv_no TYPE msgno
        !iv_v1 TYPE any OPTIONAL
        !iv_v2 TYPE any OPTIONAL
        !iv_v3 TYPE any OPTIONAL
        !iv_v4 TYPE any OPTIONAL
      CHANGING
        !ct_bapiret2 TYPE bapiret2_tab OPTIONAL .
    CLASS-METHODS call_bapi_goodsmvt_cancel
      IMPORTING
        !is_goodmvt TYPE bapi2017_gm_head_ret
        !iv_commit_work TYPE xfeld DEFAULT 'X'
      RETURNING
        VALUE(rs_return) TYPE ts_goodsmvt_cancel_return .
    CLASS-METHODS call_bapi_goodsmvt_create
      IMPORTING
        !iv_transaction_code TYPE gm_code
        !is_mvt_header TYPE bapi2017_gm_head_01
        !it_mvt_item TYPE bapi2017_gm_item_create_t
        !iv_commit_work TYPE xfeld DEFAULT 'X'
      RETURNING
        VALUE(rs_return) TYPE ts_goodsmvt_create_return .
    CLASS-METHODS call_bapi_to_create_from_tr
      IMPORTING
        !iv_warehouse TYPE lgnum
        !iv_transfer_requirement TYPE tbnum
        !iv_partial_transfer_allowed TYPE t340dteilv DEFAULT ''
        !iv_user TYPE lvs_bname DEFAULT sy-uname
        !iv_commit_work TYPE xfeld DEFAULT 'X'
        !it_trite TYPE l03b_trite_t
      RETURNING
        VALUE(rs_return) TYPE ts_to_create_return .
    METHODS cancel_mm_mvt
      IMPORTING
        !is_goodmvt TYPE bapi2017_gm_head_ret OPTIONAL
      RETURNING
        VALUE(rs_return) TYPE ts_goodsmvt_cancel_return .
    METHODS constructor .
    METHODS create_mm_mvt
      RETURNING
        VALUE(rs_return) TYPE ts_goodsmvt_create_return .
    METHODS create_mm_wm_mvt
      RETURNING
        VALUE(rs_bapiret2) TYPE bapiret2 .
    METHODS create_wm_to_from_tr
      RETURNING
        VALUE(rs_return) TYPE ts_to_create_return .
    METHODS get_storage_type_from_material
      IMPORTING
        !iv_matnr TYPE matnr DEFAULT ''
        !iv_warehouse TYPE lgnum DEFAULT ''
      RETURNING
        VALUE(rv_letyl) TYPE lvs_letyp .
    METHODS get_subrc
      RETURNING
        VALUE(rv_subrc) TYPE subrc .
    METHODS get_tr_from_goodmvt
      IMPORTING
        !iv_lgnum TYPE lgnum OPTIONAL
        !is_goodmvt TYPE bapi2017_gm_head_ret OPTIONAL
        !iv_bwart TYPE bwart OPTIONAL
      RETURNING
        VALUE(rv_tbnum) TYPE tbnum .
    CLASS-METHODS retrieve_storage_type_from_mat
      IMPORTING
        !iv_matnr TYPE matnr DEFAULT ''
        !iv_warehouse TYPE lgnum DEFAULT ''
      RETURNING
        VALUE(rv_letyl) TYPE lvs_letyp .
    CLASS-METHODS retrieve_tr_from_goodmvt
      IMPORTING
        !iv_lgnum TYPE lgnum
        !is_goodmvt TYPE bapi2017_gm_head_ret
        !iv_bwart TYPE bwart
      RETURNING
        VALUE(rv_tbnum) TYPE tbnum .
    CLASS-METHODS retrieve_tvarvc_param
      IMPORTING
        !iv_param TYPE rvari_vnam
      RETURNING
        VALUE(rv_return) TYPE tvarv_low .
    METHODS set_batch
      IMPORTING
        !iv_batch TYPE charg_d .
    METHODS set_batch_dest
      IMPORTING
        !iv_batch TYPE charg_d .
    METHODS set_batch_source
      IMPORTING
        !iv_batch TYPE charg_d .
    METHODS set_cost_center
      IMPORTING
        !iv_cost_center TYPE kostl .
    METHODS set_matnr
      IMPORTING
        !iv_matnr TYPE matnr .
    METHODS set_matnr_dest
      IMPORTING
        !iv_matnr TYPE matnr .
    METHODS set_matnr_source
      IMPORTING
        !iv_matnr TYPE matnr .
    METHODS set_mm_mvt_code
      IMPORTING
        !iv_mvt_code TYPE bwart .
    METHODS set_mm_mvt_header_data
      IMPORTING
        !is_mvt_header TYPE bapi2017_gm_head_01 OPTIONAL .
    METHODS set_mm_mvt_item_data
      IMPORTING
        !is_mvt_item TYPE bapi2017_gm_item_create OPTIONAL .
    METHODS set_mm_mvt_transaction
      IMPORTING
        !iv_gm_code TYPE gm_code .
    METHODS set_quantity
      IMPORTING
        !iv_quantity TYPE erfmg .
    METHODS set_recipient
      IMPORTING
        !iv_recipient TYPE wempf .
    METHODS set_storage_bin
      IMPORTING
        !iv_lgpla TYPE lgpla .
    METHODS set_storage_bin_dest
      IMPORTING
        !iv_lgpla TYPE lgpla .
    METHODS set_storage_bin_source
      IMPORTING
        !iv_lgpla TYPE lgpla .
    METHODS set_storage_loc
      IMPORTING
        !iv_stg_loc TYPE lgort_d .
    METHODS set_storage_loc_dest
      IMPORTING
        !iv_stg_loc TYPE lgort_d .
    METHODS set_storage_loc_source
      IMPORTING
        !iv_stg_loc TYPE lgort_d .
    METHODS set_storage_type_dest
      IMPORTING
        !iv_nltyp TYPE ltap-nltyp .
    METHODS set_storage_type_source
      IMPORTING
        !iv_vltyp TYPE ltap-vltyp .
    METHODS set_storage_unit_dest
      IMPORTING
        !iv_lenum TYPE lenum .
    METHODS set_storage_unit_source
      IMPORTING
        !iv_lenum TYPE lenum .
    METHODS set_storage_unit_type
      IMPORTING
        !iv_letyp TYPE lvs_letyp .
    METHODS set_subrc
      IMPORTING
        !iv_subrc TYPE subrc .
    METHODS set_transfer_requirement
      IMPORTING
        !iv_tbnum TYPE tbnum .
    METHODS set_warehouse
      IMPORTING
        !iv_warehouse TYPE lgnum .
    METHODS set_werks
      IMPORTING
        !iv_werks TYPE werks_d .
    METHODS set_werks_dest
      IMPORTING
        !iv_werks TYPE werks_d .
    METHODS set_werks_source
      IMPORTING
        !iv_werks TYPE werks_d .
    METHODS set_wm_to_data
      IMPORTING
        !is_trite TYPE l03b_trite OPTIONAL .
  PROTECTED SECTION.

    DATA gs_goodmvt TYPE bapi2017_gm_head_ret .
    DATA gs_mvt_header TYPE bapi2017_gm_head_01 .
    DATA gt_mvt_item TYPE bapi2017_gm_item_create_t .
    DATA gt_trite TYPE l03b_trite_t .
    DATA gv_batch_dest TYPE umcha .
    DATA gv_batch_source TYPE charg_d .
    DATA gv_cost_center TYPE kostl .
    DATA gv_gm_code TYPE gm_code .
    DATA gv_matnr_dest TYPE ummat .
    DATA gv_matnr_source TYPE matnr .
    DATA gv_mm_mvt_code TYPE bwart .
    DATA gv_partial_transfer_allowed TYPE t340dteilv VALUE 'X'. "#EC NOT
    DATA gv_quantity TYPE erfmg .
    DATA gv_recipient TYPE wempf .
    DATA gv_stock_unit_type TYPE lvs_letyp .
    DATA gv_storage_bin_dest TYPE lgpla .
    DATA gv_storage_bin_source TYPE lgpla .
    DATA gv_storage_loc_dest TYPE umlgo .
    DATA gv_storage_loc_source TYPE lgort_d .
    DATA gv_storage_type_dest TYPE ltap_nltyp .
    DATA gv_storage_type_source TYPE ltap_vltyp .
    DATA gv_storage_unit_dest TYPE lenum .
    DATA gv_storage_unit_source TYPE lenum .
    DATA gv_subrc TYPE subrc .
    DATA gv_transfer_req TYPE tbnum .
    DATA gv_warehouse TYPE lgnum .
    DATA gv_werks_dest TYPE umwrk .
    DATA gv_werks_source TYPE werks_d .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mm_wm IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>ADD_BAPIRET2_MSG
* +-------------------------------------------------------------------
* | [--->] IV_TY                          TYPE        BAPI_MTYPE
* | [--->] IV_ID                          TYPE        SYMSGID
* | [--->] IV_NO                          TYPE        MSGNO
* | [--->] IV_V1                          TYPE        ANY(optional)
* | [--->] IV_V2                          TYPE        ANY(optional)
* | [--->] IV_V3                          TYPE        ANY(optional)
* | [--->] IV_V4                          TYPE        ANY(optional)
* | [<-()] RS_BAPIRET2                    TYPE        BAPIRET2
* +-------------------------------------------------------------------
  METHOD add_bapiret2_msg.

    rs_bapiret2-type       = iv_ty.
    rs_bapiret2-id         = iv_id.
    rs_bapiret2-number     = iv_no.
    rs_bapiret2-message_v1 = iv_v1.
    rs_bapiret2-message_v2 = iv_v2.
    rs_bapiret2-message_v3 = iv_v3.
    rs_bapiret2-message_v4 = iv_v4.

    " Sécurité.
    IF rs_bapiret2-type IS INITIAL.
      rs_bapiret2-type = 'E'.
    ENDIF.

    MESSAGE ID rs_bapiret2-id TYPE rs_bapiret2-type NUMBER rs_bapiret2-number
      WITH rs_bapiret2-message_v1
           rs_bapiret2-message_v2
           rs_bapiret2-message_v3
           rs_bapiret2-message_v4
      INTO rs_bapiret2-message.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>ADD_BAPIRET2_TABLE_MSG
* +-------------------------------------------------------------------
* | [--->] IV_TY                          TYPE        BAPI_MTYPE
* | [--->] IV_ID                          TYPE        SYMSGID
* | [--->] IV_NO                          TYPE        MSGNO
* | [--->] IV_V1                          TYPE        ANY(optional)
* | [--->] IV_V2                          TYPE        ANY(optional)
* | [--->] IV_V3                          TYPE        ANY(optional)
* | [--->] IV_V4                          TYPE        ANY(optional)
* | [<-->] CT_BAPIRET2                    TYPE        BAPIRET2_TAB(opt
* +-------------------------------------------------------------------
  METHOD add_bapiret2_table_msg.

    APPEND INITIAL LINE TO ct_bapiret2 ASSIGNING FIELD-SYMBOL(<fs_bapiret2>).

    <fs_bapiret2> = zcl_mm_wm=>add_bapiret2_msg(  iv_ty = iv_ty
                                                  iv_id = iv_id
                                                  iv_no = iv_no
                                                  iv_v1 = iv_v1
                                                  iv_v2 = iv_v2 ).


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>CALL_BAPI_GOODSMVT_CANCEL
* +-------------------------------------------------------------------
* | [--->] IS_GOODMVT                     TYPE        BAPI2017_GM_HEAD
* | [--->] IV_COMMIT_WORK                 TYPE        XFELD (default =
* | [<-()] RS_RETURN                      TYPE        TS_GOODSMVT_CANC
* +-------------------------------------------------------------------
  METHOD call_bapi_goodsmvt_cancel.

    DATA : lt_return      TYPE STANDARD TABLE OF bapiret2,
         lt_poste_cancel  TYPE STANDARD TABLE OF bapi2017_gm_item_04.


    CALL FUNCTION 'BAPI_GOODSMVT_CANCEL'
      EXPORTING
        materialdocument    = is_goodmvt-mat_doc
        matdocumentyear     = is_goodmvt-doc_year
        goodsmvt_pstng_date = sy-datum
*       GOODSMVT_PR_UNAME   =
      IMPORTING
        goodsmvt_headret    = rs_return-s_cancelled_mvt
      TABLES
        return              = lt_return
        goodsmvt_matdocitem = lt_poste_cancel.


    LOOP AT lt_return TRANSPORTING NO FIELDS WHERE type = 'A'
                                                OR type = 'E'.
    ENDLOOP.

    IF sy-subrc = 0.

      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.

      APPEND LINES OF lt_return TO rs_return-t_errors.

      " Erreur, le doc article &1/&2 n'a pas pu être annulé.
      MESSAGE e438(zp) INTO DATA(lv_dummy). " for WHERE-USED
      zcl_mm_wm=>add_bapiret2_table_msg( EXPORTING iv_ty = 'E'
                                                   iv_id = 'ZP'
                                                   iv_no = '438'
                                                   iv_v1 = is_goodmvt-mat_doc
                                                   iv_v2 = is_goodmvt-doc_year
                                          CHANGING ct_bapiret2 = rs_return-t_errors  ).

    ELSE.

      IF iv_commit_work IS NOT INITIAL.
        CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
          EXPORTING
            wait = 'X'.
      ENDIF.

      "   RM195 : Mouvement d'article annulé avec le doc. &
      rs_return-s_success = zcl_mm_wm=>add_bapiret2_msg( iv_ty = 'S'
                                                         iv_id = 'RM'
                                                         iv_no = '438'
                                                         iv_v1 = rs_return-s_cancelled_mvt-mat_doc ).

    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>CALL_BAPI_GOODSMVT_CREATE
* +-------------------------------------------------------------------
* | [--->] IV_TRANSACTION_CODE            TYPE        GM_CODE
* | [--->] IS_MVT_HEADER                  TYPE        BAPI2017_GM_HEAD
* | [--->] IT_MVT_ITEM                    TYPE        BAPI2017_GM_ITEM
* | [--->] IV_COMMIT_WORK                 TYPE        XFELD (default =
* | [<-()] RS_RETURN                      TYPE        TS_GOODSMVT_CREA
* +-------------------------------------------------------------------
  METHOD call_bapi_goodsmvt_create.

    DATA : lt_return TYPE bapiret2_tab,
           ls_goodsmvt_code TYPE bapi2017_gm_code.

**********************************************************************
    " 01 ==> MB01
    " 02 ==> MB31
    " 03 ==> MB1A
    " 04 ==> MB1B
    " 05 ==> MB1C
    " 06 ==> MB11
    " 07 ==> MB04
    " (Defined into table T158G)

    ls_goodsmvt_code = iv_transaction_code.
**********************************************************************

    IF iv_commit_work IS NOT INITIAL.
      " On force les taches V2 à s'xécuter dans cette session
      SET UPDATE TASK LOCAL.
    ENDIF.

    CLEAR rs_return-s_created_mvt.

    CALL FUNCTION 'BAPI_GOODSMVT_CREATE'
      EXPORTING
        goodsmvt_header  = is_mvt_header
        goodsmvt_code    = ls_goodsmvt_code
      IMPORTING
        materialdocument = rs_return-s_created_mvt-mat_doc
        matdocumentyear  = rs_return-s_created_mvt-doc_year
      TABLES
        goodsmvt_item    = it_mvt_item
        return           = lt_return.


    IF rs_return-s_created_mvt IS NOT INITIAL.
      IF iv_commit_work IS NOT INITIAL.
        CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
          EXPORTING
            wait = 'X'.
      ENDIF.

      " Le document & a été enregistré
      rs_return-s_success = add_bapiret2_msg( iv_ty = 'S' iv_id = 'M7' iv_no = '060' iv_v1 = rs_return-s_created_mvt-mat_doc ).


    ELSE.
      IF iv_commit_work IS NOT INITIAL.
        CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
      ENDIF.

      LOOP AT lt_return INTO DATA(ls_return).
        APPEND ls_return TO rs_return-t_errors.
      ENDLOOP.

      " Le mouvement MM n'a pas pu être généré.
      MESSAGE e448(zp) INTO DATA(lv_dummy). " pour where used.
      add_bapiret2_table_msg( EXPORTING iv_ty = 'E' iv_id = 'ZP' iv_no = '448'
                               CHANGING ct_bapiret2 = rs_return-t_errors ).

    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>CALL_BAPI_TO_CREATE_FROM_TR
* +-------------------------------------------------------------------
* | [--->] IV_WAREHOUSE                   TYPE        LGNUM
* | [--->] IV_TRANSFER_REQUIREMENT        TYPE        TBNUM
* | [--->] IV_PARTIAL_TRANSFER_ALLOWED    TYPE        T340DTEILV (defa
* | [--->] IV_USER                        TYPE        LVS_BNAME (defau
* | [--->] IV_COMMIT_WORK                 TYPE        XFELD (default =
* | [--->] IT_TRITE                       TYPE        L03B_TRITE_T
* | [<-()] RS_RETURN                      TYPE        TS_TO_CREATE_RET
* +-------------------------------------------------------------------
  METHOD call_bapi_to_create_from_tr.

    DATA : lt_wmgrp_msg  TYPE STANDARD TABLE OF wmgrp_msg.

    CALL FUNCTION 'L_TO_CREATE_TR'
      EXPORTING
        i_lgnum                        = iv_warehouse
        i_tbnum                        = iv_transfer_requirement
        i_commit_work                  = iv_commit_work
        i_bname                        = iv_user
        i_teilk                        = iv_partial_transfer_allowed  " transfert partiel autorisé
        it_trite                       = it_trite
      IMPORTING
        e_tanum                        = rs_return-tanum
        e_teilk                        = rs_return-partial_transfer_done
      TABLES
*       t_ltak                         = lt_ltak
*       t_ltap_vb                      = lt_ltap
        t_wmgrp_msg                    = lt_wmgrp_msg
      EXCEPTIONS
        foreign_lock                   = 1
        qm_relevant                    = 2
        tr_completed                   = 3
        xfeld_wrong                    = 4
        ldest_wrong                    = 5
        drukz_wrong                    = 6
        tr_wrong                       = 7
        squit_forbidden                = 8
        no_to_created                  = 9
        update_without_commit          = 10
        no_authority                   = 11
        preallocated_stock             = 12
        partial_transfer_req_forbidden = 13
        input_error                    = 14
        error_message                  = 99
        OTHERS                         = 15.

    IF sy-subrc <> 0 OR rs_return-tanum IS INITIAL.

      IF sy-subrc <> 0.
        zcl_mm_wm=>add_bapiret2_table_msg( EXPORTING iv_ty = sy-msgty
                                                     iv_id = sy-msgid
                                                     iv_no = |{ sy-msgno ALPHA = OUT }|
                                                     iv_v1 = sy-msgv1
                                                     iv_v2 = sy-msgv2
                                                     iv_v3 = sy-msgv3
                                                     iv_v4 = sy-msgv4
                                            CHANGING ct_bapiret2 = rs_return-t_errors ).
      ENDIF.

      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.

      LOOP AT lt_wmgrp_msg INTO DATA(ls_wmgrp_msg).
        zcl_mm_wm=>add_bapiret2_table_msg( EXPORTING iv_ty = ls_wmgrp_msg-msgty
                                                     iv_id = ls_wmgrp_msg-msgid
                                                     iv_no = ls_wmgrp_msg-msgno
                                           CHANGING  ct_bapiret2 = rs_return-t_errors ).
      ENDLOOP.

      " Erreur, l'ordre de transport n'a pas pu être créé.
      MESSAGE s436(zp) INTO DATA(lv_message). " Pour where-ued
      add_bapiret2_table_msg( EXPORTING iv_ty = 'E' iv_id = 'ZP' iv_no = '436'
                               CHANGING ct_bapiret2 = rs_return-t_errors ).

    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = 'X'.

      " Vous avez créé l'ordre de transfert &
      rs_return-s_success = zcl_mm_wm=>add_bapiret2_msg( iv_ty = 'S'
                                                         iv_id = 'L3'
                                                         iv_no = '016'
                                                         iv_v1 = rs_return-tanum ).

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->CANCEL_MM_MVT
* +-------------------------------------------------------------------
* | [--->] IS_GOODMVT                     TYPE        BAPI2017_GM_HEAD
* | [<-()] RS_RETURN                      TYPE        TS_GOODSMVT_CANC
* +-------------------------------------------------------------------
  METHOD cancel_mm_mvt.

    DATA : ls_goodmvt TYPE bapi2017_gm_head_ret.

    IF is_goodmvt IS NOT INITIAL.
      ls_goodmvt = is_goodmvt.
    ELSE.
      ls_goodmvt = me->gs_goodmvt.
    ENDIF.


    rs_return = zcl_mm_wm=>call_bapi_goodsmvt_cancel( is_goodmvt      = me->gs_goodmvt
                                                      iv_commit_work  = 'X'
                                                     ).

    IF rs_return-t_errors IS NOT INITIAL.


      me->set_subrc( 8 ).

    ELSE.

      me->set_subrc( 0 ).

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->CONSTRUCTOR
* +-------------------------------------------------------------------
* +-------------------------------------------------------------------
  METHOD constructor.

    " Nothing done here, attribution of params are done in sub-class c

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->CREATE_MM_MVT
* +-------------------------------------------------------------------
* | [<-()] RS_RETURN                      TYPE        TS_GOODSMVT_CREA
* +-------------------------------------------------------------------
  METHOD create_mm_mvt.

    IF me->gs_mvt_header IS INITIAL.
      me->set_mm_mvt_header_data( ).
    ENDIF.

    IF me->gt_mvt_item IS INITIAL.
      me->set_mm_mvt_item_data( ).
    ENDIF.

    rs_return = zcl_mm_wm=>call_bapi_goodsmvt_create(
                        iv_transaction_code = me->gv_gm_code
                        is_mvt_header       = me->gs_mvt_header
                        it_mvt_item         = me->gt_mvt_item
                        iv_commit_work      = 'X' ).


    IF rs_return-t_errors IS NOT INITIAL.

      me->set_subrc( 8 ).

    ELSE.

      me->gs_goodmvt = rs_return-s_created_mvt.

      me->set_subrc( 0 ).

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->CREATE_MM_WM_MVT
* +-------------------------------------------------------------------
* | [<-()] RS_BAPIRET2                    TYPE        BAPIRET2
* +-------------------------------------------------------------------
  METHOD create_mm_wm_mvt.

    DATA : ls_return_mm TYPE ts_goodsmvt_create_return,
             ls_return_wm TYPE ts_to_create_return.

    " Création mouvement MM
    " ======================
    ls_return_mm = me->create_mm_mvt( ).

    IF me->get_subrc( ) = 0.
*      APPEND ls_return_mm-s_success TO rt_bapiret2.

    ELSE.
      READ TABLE ls_return_mm-t_errors INTO rs_bapiret2 INDEX 1.
      me->set_subrc( 8 ).
      RETURN.

    ENDIF.


    " Récupéraion de la demande de transfert créée.
    " ============================================
    me->get_tr_from_goodmvt( ).

    IF  me->get_subrc( ) <> 0.

      " La demande de transfert n'a pas été générée.
      MESSAGE e447(zp) INTO DATA(lv_dummy). " pour where used.
      rs_bapiret2 = me->add_bapiret2_msg( iv_ty = 'E' iv_id = 'ZP' iv_no = '447' ).

      " En cas d'erreur, annulation du mouvement MM.
      me->cancel_mm_mvt( ).

      me->set_subrc( 8 ).
      RETURN.
    ENDIF.


    " On vérifie que la DT n'est pas bloquée
    " ======================================
    zcl_manage_lock=>check_lock_transfer_request( iw_lgnum         = me->gv_warehouse
                                                  iw_tbnum         = me->gv_transfer_req
                                                  iw_max_wait_time = 5 ).
    " Sert à temporiser si la DT est encore bloquée par la création doc article (cas très
    " particulier en cas de lenteur du système). On tente quand même de créer les objets
    " même si bloquée pour garder la gestion des erreurs existente.


    " Création mouvement WM
    " ======================
    ls_return_wm = me->create_wm_to_from_tr( ).

    IF me->get_subrc( ) <> 0.

      " En cas d'erreur, annulation du mouvement MM.
      me->cancel_mm_mvt( ).

      READ TABLE ls_return_wm-t_errors INTO rs_bapiret2 INDEX 1.

      me->set_subrc( 8 ).
      RETURN.
    ENDIF.

    " Fin de process MM WM Ok
    me->set_subrc( 0 ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->CREATE_WM_TO_FROM_TR
* +-------------------------------------------------------------------
* | [<-()] RS_RETURN                      TYPE        TS_TO_CREATE_RET
* +-------------------------------------------------------------------
  METHOD create_wm_to_from_tr.



    IF me->gt_trite IS INITIAL.
      me->set_wm_to_data( ).
    ENDIF.


    rs_return = zcl_mm_wm=>call_bapi_to_create_from_tr(
          iv_warehouse                = me->gv_warehouse
          iv_transfer_requirement     = me->gv_transfer_req
          iv_partial_transfer_allowed = me->gv_partial_transfer_allowed
          iv_user                     = sy-uname
          iv_commit_work              = 'X'
          it_trite                    = me->gt_trite ).

    IF rs_return-t_errors IS NOT INITIAL.

      me->set_subrc( 8 ).

    ELSE.

      me->set_subrc( 0 ).

    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->GET_STORAGE_TYPE_FROM_MATERIAL
* +-------------------------------------------------------------------
* | [--->] IV_MATNR                       TYPE        MATNR (default =
* | [--->] IV_WAREHOUSE                   TYPE        LGNUM (default =
* | [<-()] RV_LETYL                       TYPE        LVS_LETYP
* +-------------------------------------------------------------------
  METHOD get_storage_type_from_material.

    DATA : lv_matnr TYPE matnr,
           lv_warehouse TYPE lgnum.

    IF iv_matnr IS NOT INITIAL.
      lv_matnr = iv_matnr.
    ELSE.
      lv_matnr = me->gv_matnr_dest.

      IF lv_matnr IS INITIAL.
        lv_matnr = me->gv_matnr_source.
      ENDIF.
    ENDIF.

    IF iv_warehouse IS NOT INITIAL.
      lv_warehouse = iv_warehouse.
    ELSE.
      lv_warehouse = me->gv_warehouse.
    ENDIF.

    rv_letyl = retrieve_storage_type_from_mat(
                                   iv_matnr     = lv_matnr
                                   iv_warehouse = lv_warehouse ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->GET_SUBRC
* +-------------------------------------------------------------------
* | [<-()] RV_SUBRC                       TYPE        SUBRC
* +-------------------------------------------------------------------
  METHOD get_subrc.

    rv_subrc = me->gv_subrc.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->GET_TR_FROM_GOODMVT
* +-------------------------------------------------------------------
* | [--->] IV_LGNUM                       TYPE        LGNUM(optional)
* | [--->] IS_GOODMVT                     TYPE        BAPI2017_GM_HEAD
* | [--->] IV_BWART                       TYPE        BWART(optional)
* | [<-()] RV_TBNUM                       TYPE        TBNUM
* +-------------------------------------------------------------------
  METHOD get_tr_from_goodmvt.

    DATA : lv_lgnum	TYPE lgnum,
           ls_goodmvt  TYPE bapi2017_gm_head_ret,
           lv_bwart  TYPE bwart.

    IF iv_lgnum IS NOT INITIAL.
      lv_lgnum = iv_lgnum.

    ELSE.
      lv_lgnum = me->gv_warehouse.

    ENDIF.

    IF is_goodmvt IS NOT INITIAL.
      ls_goodmvt = ls_goodmvt.

    ELSE.
      ls_goodmvt = me->gs_goodmvt.
    ENDIF.

    IF iv_bwart IS NOT INITIAL.
      lv_bwart = iv_bwart.

    ELSE.
      lv_bwart = me->gv_mm_mvt_code.

    ENDIF.

    rv_tbnum = retrieve_tr_from_goodmvt( iv_lgnum   = lv_lgnum
                                         is_goodmvt = ls_goodmvt
                                         iv_bwart   = lv_bwart ).

    IF rv_tbnum IS NOT INITIAL.

      me->gv_transfer_req = rv_tbnum.
      me->set_subrc( 0 ).

    ELSE.
      me->set_subrc( 8 ).

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>RETRIEVE_STORAGE_TYPE_FROM_MAT
* +-------------------------------------------------------------------
* | [--->] IV_MATNR                       TYPE        MATNR (default =
* | [--->] IV_WAREHOUSE                   TYPE        LGNUM (default =
* | [<-()] RV_LETYL                       TYPE        LVS_LETYP
* +-------------------------------------------------------------------
  METHOD retrieve_storage_type_from_mat.

    SELECT SINGLE lety1 FROM mlgn INTO rv_letyl
      WHERE matnr = iv_matnr
        AND lgnum = iv_warehouse.
    IF sy-subrc <> 0.
      CLEAR rv_letyl.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>RETRIEVE_TR_FROM_GOODMVT
* +-------------------------------------------------------------------
* | [--->] IV_LGNUM                       TYPE        LGNUM
* | [--->] IS_GOODMVT                     TYPE        BAPI2017_GM_HEAD
* | [--->] IV_BWART                       TYPE        BWART
* | [<-()] RV_TBNUM                       TYPE        TBNUM
* +-------------------------------------------------------------------
  METHOD retrieve_tr_from_goodmvt.

    " Recherche numéro de la demande de tranfert générée sur le mouvem
    SELECT tbnum UP TO 1 ROWS FROM ltbk  INTO rv_tbnum
      WHERE lgnum = iv_lgnum
        AND bwart = iv_bwart
        AND mjahr = is_goodmvt-doc_year
        AND mblnr = is_goodmvt-mat_doc.
    ENDSELECT.

    IF sy-subrc <> 0.
      CLEAR rv_tbnum.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Static Public Method ZCL_MM_WM=>RETRIEVE_TVARVC_PARAM
* +-------------------------------------------------------------------
* | [--->] IV_PARAM                       TYPE        RVARI_VNAM
* | [<-()] RV_RETURN                      TYPE        TVARV_LOW
* +-------------------------------------------------------------------
  METHOD retrieve_tvarvc_param.

    SELECT SINGLE low FROM tvarvc INTO rv_return
      WHERE name = iv_param
        AND type = 'P'. " Parameter

    IF sy-subrc <> 0.
      CLEAR rv_return.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_BATCH
* +-------------------------------------------------------------------
* | [--->] IV_BATCH                       TYPE        CHARG_D
* +-------------------------------------------------------------------
  METHOD set_batch.

    " For movment with same batch as source/destination.

    me->set_batch_source( iv_batch ).

    me->set_batch_dest( iv_batch ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_BATCH_DEST
* +-------------------------------------------------------------------
* | [--->] IV_BATCH                       TYPE        CHARG_D
* +-------------------------------------------------------------------
  METHOD set_batch_dest.

    me->gv_batch_dest = iv_batch.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_BATCH_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_BATCH                       TYPE        CHARG_D
* +-------------------------------------------------------------------
  METHOD set_batch_source.

    me->gv_batch_source = iv_batch.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_COST_CENTER
* +-------------------------------------------------------------------
* | [--->] IV_COST_CENTER                 TYPE        KOSTL
* +-------------------------------------------------------------------
  METHOD set_cost_center.

    me->gv_cost_center = iv_cost_center.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MATNR
* +-------------------------------------------------------------------
* | [--->] IV_MATNR                       TYPE        MATNR
* +-------------------------------------------------------------------
  METHOD set_matnr.

    " For movment with same article as source/destination.

    me->set_matnr_source( iv_matnr ).

    me->set_matnr_dest( iv_matnr ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MATNR_DEST
* +-------------------------------------------------------------------
* | [--->] IV_MATNR                       TYPE        MATNR
* +-------------------------------------------------------------------
  METHOD set_matnr_dest.

    me->gv_matnr_dest = iv_matnr.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MATNR_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_MATNR                       TYPE        MATNR
* +-------------------------------------------------------------------
  METHOD set_matnr_source.

    me->gv_matnr_source = iv_matnr.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MM_MVT_CODE
* +-------------------------------------------------------------------
* | [--->] IV_MVT_CODE                    TYPE        BWART
* +-------------------------------------------------------------------
  METHOD set_mm_mvt_code.

    me->gv_mm_mvt_code = iv_mvt_code.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MM_MVT_HEADER_DATA
* +-------------------------------------------------------------------
* | [--->] IS_MVT_HEADER                  TYPE        BAPI2017_GM_HEAD
* +-------------------------------------------------------------------
  METHOD set_mm_mvt_header_data.

    IF is_mvt_header IS NOT INITIAL.
      me->gs_mvt_header = is_mvt_header.
    ENDIF.

    IF me->gs_mvt_header-pstng_date IS INITIAL.
      me->gs_mvt_header-pstng_date = sy-datum.
    ENDIF.

    IF me->gs_mvt_header-doc_date IS INITIAL.
      me->gs_mvt_header-doc_date = sy-datum.
    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MM_MVT_ITEM_DATA
* +-------------------------------------------------------------------
* | [--->] IS_MVT_ITEM                    TYPE        BAPI2017_GM_ITEM
* +-------------------------------------------------------------------
  METHOD set_mm_mvt_item_data.

    DATA : ls_mvt_item TYPE bapi2017_gm_item_create,
           lv_shkzg TYPE shkzg.

    " Retrieve the Direction of Goods Movement (SHKZG)
    " Table T156 buffered, select can be done directly (as READ TABLE)
    SELECT SINGLE shkzg FROM t156 INTO lv_shkzg
      WHERE bwart = me->gv_mm_mvt_code.
    IF sy-subrc <> 0.
      CLEAR lv_shkzg.
    ENDIF.


    IF is_mvt_item IS NOT INITIAL.
      ls_mvt_item = is_mvt_item.
    ENDIF.

    IF ls_mvt_item-move_type IS INITIAL.
      ls_mvt_item-move_type = me->gv_mm_mvt_code.
    ENDIF.


    IF lv_shkzg = 'H'.

      " Mouvement d'entrée / Input movment (credit) :
      " ---------------------------------------------


      IF ls_mvt_item-material IS INITIAL.
        ls_mvt_item-material = me->gv_matnr_source.
      ENDIF.

      IF ls_mvt_item-plant IS INITIAL.
        ls_mvt_item-plant = me->gv_werks_source.
      ENDIF.

      IF ls_mvt_item-stge_loc IS INITIAL.
        ls_mvt_item-stge_loc = me->gv_storage_loc_source.
      ENDIF.

      IF ls_mvt_item-batch IS INITIAL.
        ls_mvt_item-batch = me->gv_batch_source.
      ENDIF.

      " ---------------------------------------------

      IF ls_mvt_item-move_mat IS INITIAL.
        ls_mvt_item-move_mat = me->gv_matnr_dest.
      ENDIF.

      IF ls_mvt_item-move_plant IS INITIAL.
        ls_mvt_item-move_plant = me->gv_werks_dest.
      ENDIF.

      IF ls_mvt_item-move_stloc IS INITIAL.
        ls_mvt_item-move_stloc = me->gv_storage_loc_dest.
      ENDIF.

      IF ls_mvt_item-move_batch IS INITIAL.
        ls_mvt_item-move_batch = me->gv_batch_dest.
      ENDIF.

    ELSE.
      " Mouvement de sortie / Output movment (debit) :
      " ----------------------------------------------

      IF ls_mvt_item-material IS INITIAL.
        ls_mvt_item-material = me->gv_matnr_dest.
      ENDIF.

      IF ls_mvt_item-plant IS INITIAL.
        ls_mvt_item-plant = me->gv_werks_dest.
      ENDIF.

      IF ls_mvt_item-stge_loc IS INITIAL.
        ls_mvt_item-stge_loc = me->gv_storage_loc_dest.
      ENDIF.

      IF ls_mvt_item-batch IS INITIAL.
        ls_mvt_item-batch = me->gv_batch_dest.
      ENDIF.

      " ----------------------------------------------

      IF ls_mvt_item-move_mat IS INITIAL.
        ls_mvt_item-move_mat = me->gv_matnr_source.
      ENDIF.

      IF ls_mvt_item-move_plant IS INITIAL.
        ls_mvt_item-move_plant = me->gv_werks_source.
      ENDIF.

      IF ls_mvt_item-move_stloc IS INITIAL.
        ls_mvt_item-move_stloc = me->gv_storage_loc_source.
      ENDIF.

      IF ls_mvt_item-move_batch IS INITIAL.
        ls_mvt_item-move_batch = me->gv_batch_source.
      ENDIF.

    ENDIF.


    IF ls_mvt_item-entry_qnt IS INITIAL.
      ls_mvt_item-entry_qnt = me->gv_quantity.
    ENDIF.

    IF ls_mvt_item-gr_rcpt IS INITIAL.
      ls_mvt_item-gr_rcpt = me->gv_recipient.
    ENDIF.

    IF ls_mvt_item-costcenter IS INITIAL.
      ls_mvt_item-costcenter = me->gv_cost_center.
    ENDIF.



    IF ls_mvt_item IS NOT INITIAL.

      APPEND ls_mvt_item TO me->gt_mvt_item.

    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_MM_MVT_TRANSACTION
* +-------------------------------------------------------------------
* | [--->] IV_GM_CODE                     TYPE        GM_CODE
* +-------------------------------------------------------------------
  METHOD set_mm_mvt_transaction.

    " Use constant ZCL_MM_WM=>C_MM_MVT_TCODE to set transaction code.
    " 01 ==> MB01
    " 02 ==> MB31
    " 03 ==> MB1A
    " 04 ==> MB1B
    " 05 ==> MB1C
    " 06 ==> MB11
    " 07 ==> MB04

    CASE  iv_gm_code.
      WHEN '02' OR '03' OR '04' OR '05' OR '06' OR '07'.

        me->gv_gm_code = iv_gm_code.

      WHEN OTHERS.

        CLEAR me->gv_gm_code.

    ENDCASE.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_QUANTITY
* +-------------------------------------------------------------------
* | [--->] IV_QUANTITY                    TYPE        ERFMG
* +-------------------------------------------------------------------
  METHOD set_quantity.

    me->gv_quantity = iv_quantity.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_RECIPIENT
* +-------------------------------------------------------------------
* | [--->] IV_RECIPIENT                   TYPE        WEMPF
* +-------------------------------------------------------------------
  METHOD set_recipient.

    me->gv_recipient = iv_recipient.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_BIN
* +-------------------------------------------------------------------
* | [--->] IV_LGPLA                       TYPE        LGPLA
* +-------------------------------------------------------------------
  METHOD set_storage_bin.

    me->set_storage_bin_source( iv_lgpla ).

    me->set_storage_bin_dest( iv_lgpla ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_BIN_DEST
* +-------------------------------------------------------------------
* | [--->] IV_LGPLA                       TYPE        LGPLA
* +-------------------------------------------------------------------
  METHOD set_storage_bin_dest.

    me->gv_storage_bin_dest = iv_lgpla.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_BIN_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_LGPLA                       TYPE        LGPLA
* +-------------------------------------------------------------------
  METHOD set_storage_bin_source.

    me->gv_storage_bin_source = iv_lgpla.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_LOC
* +-------------------------------------------------------------------
* | [--->] IV_STG_LOC                     TYPE        LGORT_D
* +-------------------------------------------------------------------
  METHOD set_storage_loc.

    " For movment with same article as source/destination.

    me->set_storage_loc_source( iv_stg_loc ).

    me->set_storage_loc_dest( iv_stg_loc ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_LOC_DEST
* +-------------------------------------------------------------------
* | [--->] IV_STG_LOC                     TYPE        LGORT_D
* +-------------------------------------------------------------------
  METHOD set_storage_loc_dest.

    me->gv_storage_loc_dest = iv_stg_loc.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_LOC_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_STG_LOC                     TYPE        LGORT_D
* +-------------------------------------------------------------------
  METHOD set_storage_loc_source.

    me->gv_storage_loc_source = iv_stg_loc.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_TYPE_DEST
* +-------------------------------------------------------------------
* | [--->] IV_NLTYP                       TYPE        LTAP-NLTYP
* +-------------------------------------------------------------------
  METHOD set_storage_type_dest.

    me->gv_storage_type_dest = iv_nltyp.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_TYPE_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_VLTYP                       TYPE        LTAP-VLTYP
* +-------------------------------------------------------------------
  METHOD set_storage_type_source.

    me->gv_storage_type_source = iv_vltyp.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_UNIT_DEST
* +-------------------------------------------------------------------
* | [--->] IV_LENUM                       TYPE        LENUM
* +-------------------------------------------------------------------
  METHOD set_storage_unit_dest.

    me->gv_storage_unit_dest = iv_lenum.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_UNIT_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_LENUM                       TYPE        LENUM
* +-------------------------------------------------------------------
  METHOD set_storage_unit_source.

    me->gv_storage_unit_source = iv_lenum.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_STORAGE_UNIT_TYPE
* +-------------------------------------------------------------------
* | [--->] IV_LETYP                       TYPE        LVS_LETYP
* +-------------------------------------------------------------------
  METHOD set_storage_unit_type.

    me->gv_stock_unit_type = iv_letyp.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_SUBRC
* +-------------------------------------------------------------------
* | [--->] IV_SUBRC                       TYPE        SUBRC
* +-------------------------------------------------------------------
  METHOD set_subrc.

    me->gv_subrc = iv_subrc.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_TRANSFER_REQUIREMENT
* +-------------------------------------------------------------------
* | [--->] IV_TBNUM                       TYPE        TBNUM
* +-------------------------------------------------------------------
  METHOD set_transfer_requirement.

    me->gv_transfer_req = iv_tbnum.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_WAREHOUSE
* +-------------------------------------------------------------------
* | [--->] IV_WAREHOUSE                   TYPE        LGNUM
* +-------------------------------------------------------------------
  METHOD set_warehouse.

    me->gv_warehouse = iv_warehouse.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_WERKS
* +-------------------------------------------------------------------
* | [--->] IV_WERKS                       TYPE        WERKS_D
* +-------------------------------------------------------------------
  METHOD set_werks.

    " For movment in the same plant.

    me->set_werks_source( iv_werks ).

    me->set_werks_dest( iv_werks ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_WERKS_DEST
* +-------------------------------------------------------------------
* | [--->] IV_WERKS                       TYPE        WERKS_D
* +-------------------------------------------------------------------
  METHOD set_werks_dest.

    me->gv_werks_dest = iv_werks.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_WERKS_SOURCE
* +-------------------------------------------------------------------
* | [--->] IV_WERKS                       TYPE        WERKS_D
* +-------------------------------------------------------------------
  METHOD set_werks_source.

    me->gv_werks_source = iv_werks.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------
* | Instance Public Method ZCL_MM_WM->SET_WM_TO_DATA
* +-------------------------------------------------------------------
* | [--->] IS_TRITE                       TYPE        L03B_TRITE(optio
* +-------------------------------------------------------------------
  METHOD set_wm_to_data.

    DATA : ls_trite TYPE l03b_trite.

    IF is_trite IS NOT INITIAL.
      ls_trite = is_trite.
    ENDIF.

    IF ls_trite-charg IS INITIAL. " Lot prenant
      ls_trite-charg = me->gv_batch_dest.
    ENDIF.

    IF  ls_trite-anfme IS INITIAL.
      ls_trite-anfme = me->gv_quantity.
    ENDIF.

    IF ls_trite-altme IS INITIAL.
      ls_trite-altme = 'PCE'.
    ENDIF.

    IF ls_trite-letyp IS INITIAL. " Type d'unité de stock
      ls_trite-letyp = me->gv_stock_unit_type.
    ENDIF.
    IF ls_trite-letyp IS INITIAL.
      ls_trite-letyp = get_storage_type_from_material( ).

    ENDIF.

    " ---- Prenant ----

    IF ls_trite-nlpla IS INITIAL. " Emplacement prenant
      ls_trite-nlpla = me->gv_storage_bin_dest.
    ENDIF.

    IF ls_trite-nltyp IS INITIAL. " Type magasin prenant
      ls_trite-nltyp = me->gv_storage_type_dest.
    ENDIF.

    IF ls_trite-nlenr IS INITIAL. " Numéro de l'unité de stock prenant
      ls_trite-nlenr = me->gv_storage_unit_dest.
    ENDIF.

    " ---- Cédant ----

    IF ls_trite-vltyp IS INITIAL. " Type magasin cédant
      ls_trite-vltyp = me->gv_storage_type_source.
    ENDIF.

    IF ls_trite-vlpla IS INITIAL. " Emplacement cédant
      ls_trite-vlpla = me->gv_storage_bin_source.
    ENDIF.

    IF ls_trite-vlenr IS INITIAL. " Numéro de l'unité de stock cédante
      ls_trite-vlenr = me->gv_storage_unit_source.
    ENDIF.


    CHECK ls_trite IS NOT INITIAL.

    " Manage item counter.
    DESCRIBE TABLE me->gt_trite LINES DATA(lv_lines).
    ADD 1 TO lv_lines.

    ls_trite-tbpos = lv_lines.

    APPEND ls_trite TO me->gt_trite.

  ENDMETHOD.
ENDCLASS.