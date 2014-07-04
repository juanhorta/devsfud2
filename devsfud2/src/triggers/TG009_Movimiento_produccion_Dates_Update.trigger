trigger TG009_Movimiento_produccion_Dates_Update on Movimiento_produccion__c (before update) {

  System.debug('\n\n****  Queries_antes_de_TG004_Movimiento_produccion_ActualizationActivo: ' + Limits.getQueries()); 
     set<Id> mov_prod = new Set<Id>();
  // Set<Id> synquedQuote = new Set<Id>();
  for (Movimiento_produccion__c oMovprod : Trigger.new){ 
  	mov_prod.add(oMovprod.Id);
  }
    
  integer size = mov_prod.size();
  system.debug('JDDEBUG2: size: '+size);
  
   if(size==1){
 /*JAAR 27-03-2014 Se depreca para reducir querys consumidos durante el proceso
 Movimiento_produccion__c[] movprodOld = 
        [select id 
        		,Etapa__c
        		,Activo__c
                from Movimiento_produccion__c 
         where id in :mov_prod];
 */        

 
   System.debug('\n\n****  Queries_invocando_TG009_Movimiento_produccion_ActualizationActivo: ' + Limits.getQueries());  
    //CL002_AssetsProcessing.UpsertStatus(movprodOld);
    CL002_AssetsProcessing.MovProdDates(Trigger.new,Trigger.Old);
 }

}