view: destino_union {
  derived_table: {
    sql:
      -- EU
      SELECT
        'EU' AS partner,
        Year AS year,
        Month_ID AS month_id,
        PARSE_DATE('%Y%m', CAST(Month_ID AS STRING)) AS month_date,
        State_ID AS state_id,
        State    AS state,
        Trade_Value AS trade_value,
        Share       AS share
      FROM `mercadoseeuuvschina100.Destino_Compras_EU`
      UNION ALL
      -- CH
      SELECT
        'CH' AS partner,
        Year, Month_ID,
        PARSE_DATE('%Y%m', CAST(Month_ID AS STRING)) AS month_date,
        State_ID, State, Trade_Value, Share
      FROM `mercadoseeuuvschina100.Destino_Compras_CH` ;;
  }

  parameter: p_partner {
    label: "Socio"
    type: string
    default_value: "ALL"
    allowed_value: {label: "Todos" value: "ALL"}
    allowed_value: {label: "EE.UU." value: "EU"}
    allowed_value: {label: "China"  value: "CH"}
  }

  dimension: es_partner_sel {
    type: yesno
    hidden: yes
    sql: CASE WHEN {% parameter p_partner %} = 'ALL' OR ${partner} = {% parameter p_partner %} THEN TRUE ELSE FALSE END ;;
  }

  dimension: partner  { type: string sql: ${TABLE}.partner  ;; }
  dimension: year     { type: number sql: ${TABLE}.year     ;; }
  dimension: month_id { type: number sql: ${TABLE}.month_id ;; }

  dimension_group: month_date {
    type: time
    timeframes: [date, month, quarter, year]
    convert_tz: no
    sql: ${TABLE}.month_date ;;
  }

  dimension: state_id     { type: number sql: ${TABLE}.state_id     ;; }
  dimension: state        { type: string sql: ${TABLE}.state        ;; }
  dimension: trade_value  { type: number sql: ${TABLE}.trade_value  ;; }
  dimension: share        { type: number sql: ${TABLE}.share        ;; }

  measure: total_valor { type: sum sql: ${trade_value} ;; value_format: "#,##0" }
}
