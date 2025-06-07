@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Case'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #C,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z363_01_lgl
  as select from /dmo/customer
{
  key customer_id as CustomerId,
      first_name  as FirstName,
      last_name   as LastName,
      title       as Title,
      street      as Street,

      case country_code
        when 'US' then concat( 'United States of America -  ', concat( first_name, last_name ) )
        when 'DE' then concat( 'Germany -  ', first_name )
        when 'ES' then case title
                         when 'Mr.' then concat( 'Spain -  Mr. ', first_name )
                         when 'Mrs.' then concat( 'Spain -  Mrs. ', first_name )
                         else 'ES - Different Title'
                       end
        else 'Another Country Code'
      end         as ElementCase
}
