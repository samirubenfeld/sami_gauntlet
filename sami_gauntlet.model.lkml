connection: "crunchbase"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: acquisitions {}

explore: companies {}

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
