view: funding {
  sql_table_name: crunchbase.funding ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: funded {
    type: time
    timeframes: [
      raw,
      hour,
      day_of_month,
      day_of_week,
      day_of_week_index,
      day_of_year,
      hour_of_day,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year,
      time,
      date,
      week,
      minute,
      month,
      month_name,
      month_num,
      quarter,
      quarter_of_year,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.funded_at ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: raised_amount {
    type: number
    sql: ${TABLE}.raised_amount ;;
  }

  dimension: raised_currency_code {
    type: string
    sql: ${TABLE}.raised_currency_code ;;
  }

  dimension: round_code {
    type: string
    sql: ${TABLE}.round_code ;;
  }

  dimension: source_description {
    type: string
    sql: ${TABLE}.source_description ;;
  }

  #MEASURES

  measure: sum_raised_amount_USD {
    type: sum
    sql: ${TABLE}.raised_amount ;;
    value_format_name: usd
    filters: {
      field: raised_currency_code
      value : "USD"
    }
  }

  measure: sum_raised_amount_EUR {
    type: sum
    sql: ${TABLE}.raised_amount ;;
    value_format_name: eur
    filters: {
      field: raised_currency_code
      value : "EUR"
    }
  }

  measure: sum_raised_amount_GBP {
    type: sum
    sql: ${TABLE}.raised_amount ;;
    value_format_name: gbp
    filters: {
      field: raised_currency_code
      value : "GBP"
    }
  }

  measure: average_raised_amount_USD {
    type: average
    sql: ${TABLE}.raised_amount ;;
    value_format_name: usd
    filters: {
      field: raised_currency_code
      value : "USD"
    }
  }

  measure: average_raised_amount_EUR {
    type: average
    sql: ${TABLE}.raised_amount ;;
    value_format_name: eur
    filters: {
      field: raised_currency_code
      value : "EUR"
    }
  }

  measure: average_raised_amount_GBP {
    type: average
    sql: ${TABLE}.raised_amount ;;
    value_format_name: gbp
    filters: {
      field: raised_currency_code
      value : "GBP"
    }
  }

  measure: average_raised_amount {
    type: average
    sql: ${TABLE}.raised_amount ;;
  }


  measure: count {
    type: count
    drill_fields: [id, investments.count]
  }
}
