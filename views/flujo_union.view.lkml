view: flujo_union {
  derived_table: {
    sql: SELECT 'EU' AS partner, Year AS year, Time_ID AS time_id, 'Investment (USD)' AS investment_usd
    FROM `mercadoseeuuvschina100.Flujo_EU_a_M`
    UNION ALL
    SELECT 'CH' AS partner, Year, Time_ID, 'Investment (USD)' AS investment_usd
    FROM `mercadoseeuuvschina100.Flujo_China_a_M`
    ;;
  }

  dimension: partner {
    type: string
    sql: ${TABLE}.partner;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: time_id {
    type: number
    sql: ${TABLE}.time_id;;
  }

  dimension: investment_usd {
    type: number
    sql: ${TABLE}.investment_usd ;;
  }

  parameter: p_partner {
    label: "Socio"
    default_value: "ALL"
    allowed_value: {label: "Todos" value: "ALL"}
    allowed_value: {label: "EE.UU" value: "EU"}
    allowed_value: {label: "China" value: "CH"}
  }

  dimension:  es_partner_sel{
    type: yesno
    hidden: yes
    sql: CASE WHEN {% parameter p_partner %} = 'ALL' OR ${partner} = {% parameter p_partner %} THEN TRUE
    ELSE FALSE
    END;;
  }

  dimension_group: anio {
    type: time
    timeframes: [year]
    convert_tz: no
    sql: DATE(CAST(${TABLE}.year AS INT64), 1, 1) ;;
  }

  measure: inv_total {
    type: sum
    sql: CAST(${investment_usd} AS INT64) ;;
    value_format: "#,##0"
  }

}
