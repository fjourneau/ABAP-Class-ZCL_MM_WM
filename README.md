# ABAP-Class-ZCL_MM_WM
SAP : Class to manage MM/WM movments

The goal of this class is to simplify the code and make it clear.

> :warning: **Warning** This code has been design for specific needs. This class shall be completed and behavior may change according your customization system.

>:information_source: Also notice that code has been developped on SAP release 7.6. If your working on version lower than 7.4, you shall do some code adaptations. :

## Examples

Check how easy it can be to do some cool actions :

```abap
" Create object with inline declaration (release >= 7.40 needed)
DATA(lo_mvt) = NEW zcl_mm_wm_zh( ).

" Transaction MB1A
lo_mvt->set_mm_mvt_transaction( zcl_mm_wm_zh=>c_mm_mvt_tcode-mb1a ).

" Mvt code (BWART)
lo_mvt->set_mm_mvt_code( '201' ).

" Entrepot  (LGNUM) : 
lo_mvt->set_warehouse( 'XXX ).

" Emplacement (LGORT)
lo_mvt->set_storage_loc( 'YYYY' ).

" Recipient 
lo_mvt->set_recipient( 'VALUE' ).
 
" Article prenant 
lo_mvt->set_matnr_source( gv_material_dest ).
 
" Article cédant 
lo_mvt->set_matnr_dest( gv_material_dest ). 
 
" Lot prenant/cédant 
lo_mvt->set_batch( gv_batch ).
 
lo_mvt->set_quantity( gv_quantity ).
 
" US prenante 
lo_mvt->set_storage_unit_dest( iv_us ).


" Create MM/WM movment. 
" =====================
" Here TR is automatically created at good
"  movment creation. TO is created from TR.
DATA(ls_bapiret2) = lo_mvt->create_mm_wm_mvt( ).
 
 IF lo_mvt->get_subrc( ) IS INITIAL.
	" Succress message
ELSE.
	" Error message
	" ls_bapiret2 contains the last error loggued.

ENDIF. 
```

## Documentation

### Methods

| Name | Type |Visibility | Description |
|---|---|---|---|
|`ADD_BAPIRET2_MSG`|Static Method|Public|Ajout message dans structure de type BAPIRET2|
|`ADD_BAPIRET2_TABLE_MSG`|Static Method|Public|Ajout message dans table de type BAPIRET2|
|`CALL_BAPI_GOODSMVT_CANCEL`|Static Method|Public|BAPI : Annulation de mouvement MM|
|`CALL_BAPI_GOODSMVT_CREATE`|Static Method|Public|BAPI : Création de mouvement MM|
|`CALL_BAPI_TO_CREATE_FROM_TR`|Static Method|Public|BAPI : Création d'ordre de transport WM|
|`CANCEL_MM_MVT`|Instance Method|Public|Annulation mouvement MM|
|`CONSTRUCTOR`|Instance Method|Public|Constructeur|
|`CREATE_MM_MVT`|Instance Method|Public|Création mouvement MM|
|`CREATE_MM_WM_MVT`|Instance Method|Public|Création mouvement MM WM|
|`CREATE_WM_TO_FROM_TR`|Instance Method|Public|Création de l'OT WM.|
|`GET_STORAGE_TYPE_FROM_MATERIAL`|Instance Method|Public|Récupérer le type de magasin en fonction de l'article.|
|`GET_SUBRC`|Instance Method|Public|Return code for methods|
|`GET_TR_FROM_GOODMVT`|Instance Method|Public|Récupère la demande de transfert générée par le mvt MM.|
|`RETRIEVE_STORAGE_TYPE_FROM_MAT`|Static Method|Public|SELECT : Récupère le type de stock en fonction de l'article.|
|`RETRIEVE_TR_FROM_GOODMVT`|Static Method|Public|SELECT : Récupère la DT générée par le mvt MM.|
|`RETRIEVE_TVARVC_PARAM`|Static Method|Public|Récupère un paramètre dans la TVARVC|
|`SET_BATCH`|Instance Method|Public|Passer le lot prenant/cédant.|
|`SET_BATCH_DEST`|Instance Method|Public|Passer le lot prenant|
|`SET_BATCH_SOURCE`|Instance Method|Public|Passer le lot cédant|
|`SET_COST_CENTER`|Instance Method|Public|Passer le centre de coût.|
|`SET_MATNR`|Instance Method|Public|Passer l'artcle  prenant/cédant.|
|`SET_MATNR_DEST`|Instance Method|Public|Passer l'article prenant.|
|`SET_MATNR_SOURCE`|Instance Method|Public|Passer l'article cédant.|
|`SET_MM_MVT_CODE`|Instance Method|Public|Passer le code mouvement MM.|
|`SET_MM_MVT_HEADER_DATA`|Instance Method|Public|Passer les infos en-tête du mvt MM.|
|`SET_MM_MVT_ITEM_DATA`|Instance Method|Public|Passer les infos poste du mvt MM.|
|`SET_MM_MVT_TRANSACTION`|Instance Method|Public|Passer le code transaction pour mvt MM.|
|`SET_QUANTITY`|Instance Method|Public|Passer la quantité|
|`SET_RECIPIENT`|Instance Method|Public|Passer le réceptionnaire|
|`SET_STORAGE_BIN`|Instance Method|Public|Passer l'emplacement prenant/cédant.|
|`SET_STORAGE_BIN_DEST`|Instance Method|Public|Passer l'emplacement prenant.|
|`SET_STORAGE_BIN_SOURCE`|Instance Method|Public|Passer l'emplacement cédant.|
|`SET_STORAGE_LOC`|Instance Method|Public|Passer l'emplacement de stockage prenant/cédant.|
|`SET_STORAGE_LOC_DEST`|Instance Method|Public|Passer l'emplacement de stockage prenant (LGORT_D).|
|`SET_STORAGE_LOC_SOURCE`|Instance Method|Public|Passer l'emplacement de stockage cédant (LGORT_D).|
|`SET_STORAGE_TYPE_DEST`|Instance Method|Public|Passer le type magasin prenant (NLTYP).|
|`SET_STORAGE_TYPE_SOURCE`|Instance Method|Public|Passer le type magasin cédant (VLTYP).|
|`SET_STORAGE_UNIT_DEST`|Instance Method|Public|Passer l'unité de stock prenante (LENUM).|
|`SET_STORAGE_UNIT_SOURCE`|Instance Method|Public|Passer l'unité de stock cédante (LENUM).|
|`SET_STORAGE_UNIT_TYPE`|Instance Method|Public|Passer le type d'unité de stock (LETYP)|
|`SET_SUBRC`|Instance Method|Public|Set return code for methods.|
|`SET_TRANSFER_REQUIREMENT`|Instance Method|Public|Passer la demande de transfert (DT).|
|`SET_WAREHOUSE`|Instance Method|Public|Passer l'entrepot ou magasin (LGNUM).|
|`SET_WERKS`|Instance Method|Public|Passer la division prenante/cédante.|
|`SET_WERKS_DEST`|Instance Method|Public|Passer la division prenante (WERKD_D)|
|`SET_WERKS_SOURCE`|Instance Method|Public|Passer la division cédante (WERKD_D)|
|`SET_WM_TO_DATA`|Instance Method|Public|Passer les infos pour création OT.|

