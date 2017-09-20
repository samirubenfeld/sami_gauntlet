view: companies {
  sql_table_name: crunchbase.companies ;;

  dimension: blog_url {
    type: string
    sql: ${TABLE}.blog_url ;;
  }

  dimension: category_code {
    type: string
    sql: ${TABLE}.category_code ;;
  }


  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }


  dimension: crunchbase_url {
    type: string
    sql: ${TABLE}.crunchbase_url ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension_group: founded {
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
    sql: ${TABLE}.founded_at ;;
  }

  dimension: full_record {
    type: yesno
    sql: ${TABLE}.full_record ;;
  }

  dimension: homepage_url {
    type: string
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: overview {
    type: string
    sql: ${TABLE}.overview ;;
  }

  dimension: permalink {
    primary_key: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: twitter_username {
    type: string
    sql: ${TABLE}.twitter_username ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [name, twitter_username]
  }
}
