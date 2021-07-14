defmodule CoverflexApiWeb.ProductView do
  use CoverflexApiWeb, :view
  alias CoverflexApiWeb.ProductView

  def render("index.json", %{products: products}) do
    %{products: render_many(products, ProductView, "product.json")}
  end

  # def render("index.json", %{products: products}) do
  #   %{products: render_many(products, ProductView, "product.json")}
  # end

  # def render("show.json", %{product: product}) do
  #   %{data: render_one(product, ProductView, "product.json")}
  # end

  def render("product.json", %{product: product}) do
    %{product_id: String.downcase(product.name), name: product.name, price: product.price}
  end
end
