connection: "crunchbase"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: acquisitions {}

explore: companies {
  join: company_buyer {
  from: acquisitions
  type: left_outer
  sql_on:${companies.permalink} = ${company_buyer.acquired_by_permalink};;
  relationship: one_to_one
}
  join: acquisitioned {
    from: acquisitions
    type: left_outer
    sql_on:${companies.permalink} = ${acquisitioned.acquired_permalink};;
    relationship: one_to_one
  }
  join: investments {
    type: left_outer
    sql_on:${investments.investor_permalink} = ${companies.permalink};;
    relationship: one_to_one
  }
  join: funding {
    type: left_outer
    sql_on: ${investments.funding_id} = ${funding.id} ;;
    relationship: many_to_one
  }
  join: people {
    type: left_outer
    sql_on:${investments.investor_permalink} = ${people.permalink};;
    relationship: many_to_one
  }
  join: employment {
    type: left_outer
    sql_on:${employment.permalink} = ${people.permalink} AND ${employment.company_permalink} = ${companies.permalink} ;;
    relationship: many_to_one
  }
}

explore: companies_to_update {}

explore: competitions {}

explore: employment {}

explore: funding {}

explore: investments {
  join: funding {
    type: left_outer
    sql_on: ${investments.funding_id} = ${funding.id} ;;
    relationship: many_to_one
  }
}

explore: ipo {}

explore: offices {}

explore: people {}

explore: runs {}

explore: tags {}
