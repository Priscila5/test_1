view: comercio {
  derived_table: {
    sql:
    -- EU
    SELECT 'EU' AS partner,
    Year AS year,
    Month_ID AS month_id,
    PARSE_DATE('%Y%m', CAST(Month_ID AS STRING)) AS month_date,
    Chapter_4_Digit_ID AS chapter_id,
    Chapter_4_Digit AS chapter_name,
    HS2_4_Digit_ID AS hs2_id,
    HS2_4_Digit AS hs2_name,
    HS4_4_Digit_ID AS hs4_id,
    HS4_4_Digit AS hs4_name,
    Trade_Value AS trade_value,
    Share AS share
    FROM `mercadoseeuuvschina100.Compras_internacionales_EU`
    UNION ALL
    --CH
    SELECT 'CH' AS partner,
    Year, Month_ID,
    PARSE_DATE('%Y%m', CAST(Month_ID AS STRING)) AS month_date,
    Chapter_4_Digit_ID, Chapter_4_Digit, HS2_4_Digit, HS2_4_Digit, HS4_4_Digit_ID, HS4_4_Digit,
    Trade_Value, Share
    FROM `mercadoseeuuvschina100.Compras_internacionales_CH`;;
  }

  parameter: p_partner { label: "Socio" default_value: "ALL"
    allowed_value: {label: "Todos" value: "ALL"}
    allowed_value: {label: "EE.UU." value: "EU"}
    allowed_value: {label: "China"  value: "CH"}
  }


  dimension: es_partner_sel {
    type: yesno
    hidden: yes
    sql: {% if p_partner._parameter_value == 'ALL' %} TRUE
      {% else %} ${partner} = {% parameter p_partner %} {% endif %} ;;
  }

  dimension: partner        { type: string sql: ${TABLE}.partner ;; }
  dimension: year           { type: number sql: ${TABLE}.year ;; }
  dimension: month_id           { type: number sql: ${TABLE}.month_id ;; }
  dimension_group: month_date {
    type: time
    timeframes: [date, month, quarter, year]
    convert_tz: no
    sql: ${TABLE}.month_date;;
  }
  dimension: chapter_id           { type: number sql: ${TABLE}.chapter_id ;; }
  dimension: chapter_name           { type: string sql: ${TABLE}.chapter_name ;; }
  dimension: hs2_id           { type: number sql: ${TABLE}.hs2_id ;; }
  dimension: hs2_name     { type: string sql: ${TABLE}.hs2_name     ;; }
  dimension: hs4_id       { type: number sql: ${TABLE}.hs4_id       ;; }
  dimension: hs4_name     { type: string sql: ${TABLE}.hs4_name     ;; }

  dimension: share        { type: number sql: ${TABLE}.share        ;; }
  dimension: trade_value  { type: number sql: ${TABLE}.trade_value  ;; }

  measure: total_valor { type: sum sql: ${trade_value} ;; value_format: "#,##0" }
  measure: total_share { type: sum sql: ${share}       ;; value_format: "#,##0.00" }
}
