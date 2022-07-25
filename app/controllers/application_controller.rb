class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do 
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakery = Bakery.all.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goodies = BakedGood.order(price: :desc)
    goodies.to_json
  end

  get '/baked_goods/most_expensive' do
    goodie = BakedGood.order(price: :desc).first
    goodie.to_json
  end

end
