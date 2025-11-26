# The name of this view in Looker is "Compras Internacionales Ch"
view: compras_internacionales_ch {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `mercadoseeuuvschina100.Compras_internacionales_CH` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Chapter 4 Digit" in Explore.

  dimension: chapter_4_digit {
    type: string
    sql: ${TABLE}.Chapter_4_Digit ;;
  }

  dimension: chapter_4_digit_id {
    type: number
    sql: ${TABLE}.Chapter_4_Digit_ID ;;
  }

  dimension: hs2_4_digit {
    type: string
    sql: ${TABLE}.HS2_4_Digit ;;
  }

  dimension: hs2_4_digit_id {
    type: number
    sql: ${TABLE}.HS2_4_Digit_ID ;;
  }

  dimension: hs4_4_digit {
    type: string
    sql: ${TABLE}.HS4_4_Digit ;;
  }

  dimension: hs4_4_digit_id {
    type: number
    sql: ${TABLE}.HS4_4_Digit_ID ;;
  }

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
