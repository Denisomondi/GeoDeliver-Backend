# controllers/products_controller.rb
class ProductsController < Sinatra::Base
    # GET /products
    get '/products' do
      products = Product.all
      products.to_json
    end
  
    # GET /products/:id
    get '/products/:id' do
      product = Product.find(params[:id])
      product.to_json
    end
  
    # POST /products
    post '/products' do
      product = Product.create(name: params[:name], price: params[:price], description: params[:description])
      product.to_json
    end
  
    # PUT /products/:id
    put '/products/:id' do
      product = Product.find(params[:id])
      product.update(name: params[:name], price: params[:price], description: params[:description])
      product.to_json
    end
  
    # DELETE /products/:id
    delete '/products/:id' do
      product = Product.find(params[:id])
      product.destroy
      status 204
    end
  end
  