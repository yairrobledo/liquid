view: user_facts {
  derived_table: {
    sql: SELECT order_items.id AS user_id
          ,COUNT(distinct order_items.id) AS lifetime_order_count
          ,SUM(order_items.sale_price) AS lifetime_revenue
          ,MIN(order_items.returned_at) AS first_order_date
          ,MAX(order_items.returned_at) AS latest_order_date
      FROM "public"."order_items"
      GROUP BY user_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_order_count {
    type: number
    sql: ${TABLE}.lifetime_order_count ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }

  dimension_group: first_order_date {
    type: time
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: latest_order_date {
    type: time
    sql: ${TABLE}.latest_order_date ;;
  }

  set: detail {
    fields: [user_id, lifetime_order_count, lifetime_revenue, first_order_date_time, latest_order_date_time]
  }
}
