@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_04_lgl
  as select from /dmo/travel
{
  key travel_id                  as TravelId,
      cast('' as abap.numc( 4 )) as BookingId
}

union select distinct from /dmo/booking

{
  key travel_id  as TravelId,
      booking_id as BookingId
}
