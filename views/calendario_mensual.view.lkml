view: calendario_mensual {
  derived_table: {
    sql: SELECT month_date FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE(2014,1,1), DATE(2035,12,1), INTERVAL 1 MONTH))
    AS month_date;;
  }

  dimension_group: month_date {
    type: time
    timeframes: [date, month, quarter, year]
    convert_tz: no
    sql: ${TABLE}.month_date;;
  }

  dimension: month_id {
    type: number
    sql: EXTRACT(YEAR FROM ${month_date_month})*100 + EXTRACT(MONTH FROM ${month_date_date}) ;;
  }

  measure: count {
    type: count
  }
}
