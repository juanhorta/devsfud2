public with sharing class CL015_AssetHistory {
    
    public static void upsertAssetHistory(Asset[] newAsset, Asset[] oldAsset){
   string assetID = newAsset[0].Id;
   system.debug('jddebugha: oldAsset: '+oldAsset);
   system.debug('jddebugha: newasset: '+newAsset);
   
   if(oldAsset == NULL){
        string message = 'Creado';
        insHistory(message,assetID,'Etapa');
   }else{
    
        if(newAsset[0].Status != oldAsset[0].Status && newAsset[0].UsageEndDate != oldAsset[0].UsageEndDate ){
        	insHistory('El estado ha cambiado de '+oldAsset[0].Status+' a '+ newAsset[0].Status,assetID, 'Etapa');
        }else
        {
        	if(newAsset[0].Status != oldAsset[0].Status){
	       		insHistory('El estado ha cambiado de '+oldAsset[0].Status+' a '+ newAsset[0].Status,assetID, 'Etapa');
        	}
        	
        	if(newAsset[0].UsageEndDate != oldAsset[0].UsageEndDate){
        		insHistory('La fecha final de vigencia ha cambiado de '+oldAsset[0].UsageEndDate+' a '+ newAsset[0].UsageEndDate,assetID, 'Fecha Vigencia');
        	}  
        }
            
        	string nivel_O = '';	  
	        string nivel_N = '';     
	        string etapa_O = '';
	        string etapa_N = '';	        
	        string areaCausal_O = '';
	        string areaCausal_N = '';	
	        string causal_O = '';	
	        string causal_N = '';	        
	        	         	
	        if(oldAsset[0].Nivel_de_Satisfaccion__c != null){
	        	nivel_O = oldAsset[0].Nivel_de_Satisfaccion__c;
	        }
	        if(newAsset[0].Nivel_de_Satisfaccion__c != null){
	        	nivel_N = newAsset[0].Nivel_de_Satisfaccion__c;
	        }
	        	        
	        if(oldAsset[0].Etapa__c != null){
	        	etapa_O = oldAsset[0].Etapa__c;
	        }
	        if(newAsset[0].Etapa__c != null){
	        	etapa_N = newAsset[0].Etapa__c;
	        }
	        	        	
	        if(oldAsset[0].Area_Causal__c != null){
	        	areaCausal_O = oldAsset[0].Area_Causal__c;
	        }
	        if(newAsset[0].Area_Causal__c != null){
	        	areaCausal_N = newAsset[0].Area_Causal__c;
	        }	
	        
	        if(oldAsset[0].Causal__c != null){
	        	causal_O = oldAsset[0].Causal__c;
	        }
	        if(newAsset[0].Causal__c != null){
	        	causal_N = newAsset[0].Causal__c;
	        }	
                  
		if(newAsset[0].Identificador__c == 'MES1' ){
	        if(newAsset[0].Identificador__c != oldAsset[0].Identificador__c ||
	           newAsset[0].Nivel_de_Satisfaccion__c != oldAsset[0].Nivel_de_Satisfaccion__c ||
	           newAsset[0].Etapa__c!= oldAsset[0].Etapa__c||
	           newAsset[0].Area_Causal__c != oldAsset[0].Area_Causal__c ||
	           newAsset[0].Causal__c != oldAsset[0].Causal__c
	        ){
	        	      
	        
	        insHistory('Antes 1: ' + oldAsset[0].Identificador__c  
	        + ' , ' + nivel_O
	        + ' , ' + etapa_O
	        + ' , ' + areaCausal_O
	        + ' , ' + causal_O
	        + ' /Despues 1: '+ newAsset[0].Identificador__c
	        + ' , ' + nivel_N
	        + ' , ' + etapa_N
	        + ' , ' + areaCausal_N
	        + ' , ' + causal_N
	        ,assetID, 'Postventa');
	        }
		}else{
			if(newAsset[0].Identificador__c != oldAsset[0].Identificador__c){
		        insHistory('Antes 2: ' + oldAsset[0].Identificador__c  
		        + ' , ' + nivel_O
		        + ' , ' + etapa_O
		        + ' , ' + areaCausal_O
		        + ' , ' + causal_O
		        + ' /Despues 2: '+ newAsset[0].Identificador__c
		        + ' , ' + nivel_N
		        + ' , ' + etapa_N
		        + ' , ' + areaCausal_N
		        + ' , ' + causal_N
		        ,assetID, 'Postventa');
		        }
		}

/*                
        if(newAsset[0].Nivel_de_Satisfaccion__c != oldAsset[0].Nivel_de_Satisfaccion__c){
        insHistory('El nivel de satisfacción ha cambiado de '+oldAsset[0].Nivel_de_Satisfaccion__c+' a '+ newAsset[0].Nivel_de_Satisfaccion__c,assetID);
        }
        if(newAsset[0].Etapa_postventa__c != oldAsset[0].Etapa_postventa__c){
        insHistory('La etapa postventa ha cambiado de '+oldAsset[0].Etapa_postventa__c+' a '+ newAsset[0].Etapa_postventa__c,assetID);
        }        
        if(newAsset[0].Area_Causal__c != oldAsset[0].Area_Causal__c){
        insHistory('El area causal ha cambiado de '+oldAsset[0].Area_Causal__c+' a '+ newAsset[0].Area_Causal__c,assetID);
        }
        if(newAsset[0].Causal__c != oldAsset[0].Causal__c){
        insHistory('El causal ha cambiado de '+oldAsset[0].Causal__c+' a '+ newAsset[0].Causal__c,assetID);
        }   
    
  
        if(newAsset[0].AccountId != oldAsset[0].AccountId){
        insHistory('La cuenta ha cambiado de '+oldAsset[0].AccountId+' a '+ newAsset[0].AccountId,assetID);
        }
        if(newAsset[0].Activo_relacionado__c != oldAsset[0].Activo_relacionado__c){
        insHistory('El activo relacionado ha cambiado de '+oldAsset[0].Activo_relacionado__c+' a '+ newAsset[0].Activo_relacionado__c,assetID);
        }
        if(newAsset[0].Activo_Upselling__c != oldAsset[0].Activo_Upselling__c){
        insHistory('La cuenta ha cambiado de '+oldAsset[0].AccountId+' a '+ newAsset[0].AccountId,assetID);
        }
        if(newAsset[0].Ano_Fiscal__c != oldAsset[0].Ano_Fiscal__c){
        insHistory('El año fiscal ha cambiado de '+oldAsset[0].Ano_Fiscal__c+' a '+ newAsset[0].Ano_Fiscal__c,assetID);
        }
        if(newAsset[0].Codigo_activo__c != oldAsset[0].Codigo_activo__c){
        insHistory('El código de activo ha cambiado de '+oldAsset[0].Codigo_activo__c+' a '+ newAsset[0].Codigo_activo__c,assetID);
        }
        if(newAsset[0].Codigo_internet__c != oldAsset[0].Codigo_internet__c){
        insHistory('El código de internet ha cambiado de '+oldAsset[0].Codigo_internet__c+' a '+ newAsset[0].Codigo_internet__c,assetID);
        }
        if(newAsset[0].ContactId != oldAsset[0].ContactId){
        insHistory('El contacto ha cambiado de '+oldAsset[0].ContactId+' a '+ newAsset[0].ContactId,assetID);
        }
        if(newAsset[0].CreatedById != oldAsset[0].CreatedById){
        insHistory('El campo creado por ha cambiado de '+oldAsset[0].CreatedById+' a '+ newAsset[0].CreatedById,assetID);
        }
        if(newAsset[0].CreatedDate != oldAsset[0].CreatedDate){
        insHistory('La fecha de creación ha cambiado de '+oldAsset[0].CreatedDate+' a '+ newAsset[0].CreatedDate,assetID);
        }
        if(newAsset[0].Description != oldAsset[0].Description){
        insHistory('La deescripción ha cambiado de '+oldAsset[0].Description+' a '+ newAsset[0].Description,assetID);
        }
        if(newAsset[0].Etapa__c != oldAsset[0].Etapa__c){
        insHistory('La etapa ha cambiado de '+oldAsset[0].Etapa__c+' a '+ newAsset[0].Etapa__c,assetID);
        }

        if(newAsset[0].Facturado__c != oldAsset[0].Facturado__c){
        insHistory('El campo facturado ha cambiado de '+oldAsset[0].Facturado__c+' a '+ newAsset[0].Facturado__c,assetID);
        }
        if(newAsset[0].Fecha_anulacion__c != oldAsset[0].Fecha_anulacion__c){
        insHistory('La fecha de anulación ha cambiado de '+oldAsset[0].Fecha_anulacion__c+' a '+ newAsset[0].Fecha_anulacion__c,assetID);
        }
        if(newAsset[0].Fecha_Desactivacion__c != oldAsset[0].Fecha_Desactivacion__c){
        insHistory('La fecha de desactivación ha cambiado de '+oldAsset[0].Fecha_Desactivacion__c+' a '+ newAsset[0].Fecha_Desactivacion__c,assetID);
        }
        if(newAsset[0].Fecha_facturacion__c != oldAsset[0].Fecha_facturacion__c){
        insHistory('La fecha de facturación ha cambiado de '+oldAsset[0].Fecha_facturacion__c+' a '+ newAsset[0].Fecha_facturacion__c,assetID);
        }
        if(newAsset[0].Fecha_primera_activacion__c != oldAsset[0].Fecha_primera_activacion__c){
        insHistory('La fecha de primera activación ha cambiado de '+oldAsset[0].Fecha_primera_activacion__c+' a '+ newAsset[0].Fecha_primera_activacion__c,assetID);
        }
        if(newAsset[0].Fecha_vencimiento_anterior__c != oldAsset[0].Fecha_vencimiento_anterior__c){
        insHistory('La fecha de vencimiento anterior ha cambiado de '+oldAsset[0].Fecha_vencimiento_anterior__c+' a '+ newAsset[0].Fecha_vencimiento_anterior__c,assetID);
        }
        if(newAsset[0].InstallDate != oldAsset[0].InstallDate){
        insHistory('La fecha de instalación ha cambiado de '+oldAsset[0].InstallDate+' a '+ newAsset[0].InstallDate,assetID);
        }
        if(newAsset[0].IsCompetitorProduct != oldAsset[0].IsCompetitorProduct){
        insHistory('El campo producto competidor ha cambiado de '+oldAsset[0].IsCompetitorProduct+' a '+ newAsset[0].IsCompetitorProduct,assetID);
        }
        if(newAsset[0].IsDeleted != oldAsset[0].IsDeleted){
        insHistory('El campo borrado ha cambiado de '+oldAsset[0].IsDeleted+' a '+ newAsset[0].IsDeleted,assetID);
        }
        if(newAsset[0].Linea_de_negocio__c != oldAsset[0].Linea_de_negocio__c){
        insHistory('La linea de negocio ha cambiado de '+oldAsset[0].Linea_de_negocio__c+' a '+ newAsset[0].Linea_de_negocio__c,assetID);
        }
        if(newAsset[0].Localidad_venta__c != oldAsset[0].Localidad_venta__c){
        insHistory('La localidad de venta ha cambiado de '+oldAsset[0].Localidad_venta__c+' a '+ newAsset[0].Localidad_venta__c,assetID);
        }
        if(newAsset[0].Linea_de_produccion__c != oldAsset[0].Linea_de_produccion__c){
        insHistory('La linea de producción ha cambiado de '+oldAsset[0].Linea_de_produccion__c+' a '+ newAsset[0].Linea_de_produccion__c,assetID);
        }
        if(newAsset[0].migrado__c != oldAsset[0].migrado__c){
        insHistory('El campo migrado ha cambiado de '+oldAsset[0].migrado__c+' a '+ newAsset[0].migrado__c,assetID);
        }
        if(newAsset[0].Name != oldAsset[0].Name){
        insHistory('El nombre ha cambiado de '+oldAsset[0].Name+' a '+ newAsset[0].Name,assetID);
        }
        if(newAsset[0].Oportunidad_relacionada__c != oldAsset[0].Oportunidad_relacionada__c){
        insHistory('La oportunidad relacionada ha cambiado de '+oldAsset[0].Oportunidad_relacionada__c+' a '+ newAsset[0].Oportunidad_relacionada__c,assetID);
        }
        if(newAsset[0].Partida_de_presupuesto__c != oldAsset[0].Partida_de_presupuesto__c){
        insHistory('La partida de presupuesto ha cambiado de '+oldAsset[0].Partida_de_presupuesto__c+' a '+ newAsset[0].Partida_de_presupuesto__c,assetID);
        }
        if(newAsset[0].Porcentaje_Administracion__c != oldAsset[0].Porcentaje_Administracion__c){
        insHistory('El porcentaje de administración ha cambiado de '+oldAsset[0].Porcentaje_Administracion__c+' a '+ newAsset[0].Porcentaje_Administracion__c,assetID);
        }
        if(newAsset[0].Price != oldAsset[0].Price){
        insHistory('El precio ha cambiado de '+oldAsset[0].Price+' a '+ newAsset[0].Price,assetID);
        }
        if(newAsset[0].Product2Id != oldAsset[0].Product2Id){
        insHistory('El producto ha cambiado de '+oldAsset[0].Product2Id+' a '+ newAsset[0].Product2Id,assetID);
        }
        if(newAsset[0].PurchaseDate != oldAsset[0].PurchaseDate){
        insHistory('La fecha de venta ha cambiado de '+oldAsset[0].PurchaseDate+' a '+ newAsset[0].PurchaseDate,assetID);
        }
        if(newAsset[0].Quantity != oldAsset[0].Quantity){
        insHistory('La cantidad ha cambiado de '+oldAsset[0].Quantity+' a '+ newAsset[0].Quantity,assetID);
        }
        if(newAsset[0].Responsable_del_activo__c != oldAsset[0].Responsable_del_activo__c){
        insHistory('El responsable del activo ha cambiado de '+oldAsset[0].Responsable_del_activo__c+' a '+ newAsset[0].Responsable_del_activo__c,assetID);
        }
        if(newAsset[0].SerialNumber != oldAsset[0].SerialNumber){
        insHistory('El número de serie ha cambiado de '+oldAsset[0].SerialNumber+' a '+ newAsset[0].SerialNumber,assetID);
        }

        //if(newAsset[0].SystemModstamp != oldAsset[0].SystemModstamp){
        //insHistory('El systemModStamp ha cambiado de '+oldAsset[0].SystemModstamp+' a '+ newAsset[0].SystemModstamp,assetID);
        //}
        if(newAsset[0].Tipo_venta__c != oldAsset[0].Tipo_venta__c){
        insHistory('El tipo de venta ha cambiado de '+oldAsset[0].Tipo_venta__c+' a '+ newAsset[0].Tipo_venta__c,assetID);
        }
*/
     }
   }
   
   public static void insHistory(string message, string assetid, string Categoria){
        AssetHistory__c Historial = new AssetHistory__c();
        Historial.Asset__c= assetid;
        Historial.Fecha__c= System.now();
        Historial.Usuario__c= UserInfo.getUserId();
        Historial.Accion__c = message;
        Historial.Categoria__c = Categoria;
        insert Historial;
   }
}