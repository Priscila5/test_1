# The name of this view in Looker is "Destino Compras Eu"
view: destino_compras_eu {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mercadoseeuuvschina100.Destino_Compras_EU` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Month" in Explore.

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: month_id {
    type: number
    sql: ${TABLE}.Month_ID ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}.Quarter ;;
  }

  dimension: quarter_id {
    type: number
    sql: ${TABLE}.Quarter_ID ;;
  }

  dimension: share {
    type: number
    sql: ${TABLE}.Share ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.State_ID ;;
  }

  dimension: trade_value {
    type: number
    sql: ${TABLE}.Trade_Value ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }
  measure: count {
    type: count
  }
}
