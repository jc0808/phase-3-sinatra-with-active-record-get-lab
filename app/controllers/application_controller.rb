class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    bake_good = BakedGood.by_price.order(price: :desc)
    bake_good.to_json
  end

  get '/baked_goods/most_expensive' do
     baked_good = BakedGood.most_expensive
    baked_good.to_json
  end
end
