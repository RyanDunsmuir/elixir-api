# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds/product_seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CoverflexApi.Repo.insert!(%CoverflexApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CoverflexApi.Repo
alias CoverflexApi.Benefits.Product

Repo.insert! %Product{
  name: "Netflix",
  price: 74.95
}

Repo.insert! %Product{
  name: "Dental",
  price: 199.99
}

Repo.insert! %Product{
  name: "Subway",
  price: 39.95
}

Repo.insert! %Product{
  name: "Apple",
  price: 350.00
}

Repo.insert! %Product{
  name: "Spotify",
  price: 8.95
}

Repo.insert! %Product{
  name: "Uber",
  price: 49.95
}

