require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulgalaxies'
)

get '/' do
  @galaxy = Galaxy.new
  @galaxy.name = 'Milky Way'
  @galaxy.stars = '200-400 billion'
  @galaxy.distance = '100,000 light years'
  @galaxy.save
  @galaxy.to_json
end


get '/api/galaxies' do
  Galaxy.all.to_json
end

get'/api/galaxies/:id' do
  puts params
  Galaxy.find(params[:id]).to_json
end

post '/api/galaxies' do
puts params
Galaxy.create({
  :name => params[:name],
  :stars => params[:artist],
  :distance => params[:distance]
}).to_json
end

patch '/api/galaxies/:id' do
  galaxy_args = { :name => params[:name], :stars => params[:stars], :distance => params[:distance] }
  @galaxy = Galaxy.find(params[:id])
  @galaxy.update(galaxy_args)
  @galaxy.to_json
end

delete '/api/galaxies/:id' do
  Galaxy.destroy(params[:id]).to_json
end
