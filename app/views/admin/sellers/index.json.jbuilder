json.array!(@admin_sellers) do |admin_seller|
  json.extract! admin_seller, :id, :name, :corporate, :cnpj
  json.url admin_seller_url(admin_seller, format: :json)
end
