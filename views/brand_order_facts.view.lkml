# If necessary, uncomment the line below to include explore_source.
# include: "yairrobledoliquid.model.lkml"

view: add_a_unique_name_1655852952 {
  derived_table: {
    explore_source: order_items {
      column: brand { field: products.brand }
      column: total_sale_price {}
    }
  }
  dimension: brand {}
  dimension: total_sale_price {
    type: number
  }
}
