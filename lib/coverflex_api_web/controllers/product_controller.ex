defmodule CoverflexApiWeb.ProductController do
  use CoverflexApiWeb, :controller

  alias CoverflexApi.Benefits
  alias CoverflexApi.Benefits.Product

  action_fallback CoverflexApiWeb.FallbackController

  def index(conn, _params) do
    products = Benefits.list_products()
    render(conn, "index.json", products: products)
  end
end
