@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS for Hierarchy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z363_13_LGL_c
  as select from zemployee_lgl
  association [0..1] to Z363_13_LGL_c as _Manager on _Manager.Employee = $projection.Manager
{
  key employee as Employee,
      manager  as Manager,
      name     as Name,
      _Manager
}
