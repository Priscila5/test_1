# The name of this view in Looker is "Flujo Eu A M"
view: flujo_eu_a_m {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mercadoseeuuvschina100.Flujo_EU_a_M` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Continent" in Explore.

  dimension: continent {
    type: string
    sql: ${TABLE}.Continent ;;
  }

  dimension: continent_id {
    type: string
    sql: ${TABLE}.Continent_ID ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension: country_id {
    type: string
    sql: ${TABLE}.Country_ID ;;
  }

  dimension: investment__usd_ {
    type: number
    sql: ${TABLE}.Investment__USD_ ;;
  }

  dimension: time_id {
    type: number
    sql: ${TABLE}.Time_ID ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.Year ;;
  }
  measure: count {
    type: count
  }
}
