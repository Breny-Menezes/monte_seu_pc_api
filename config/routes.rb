Rails.application.routes.draw do
  namespace 'pc_api' do

    namespace 'v1' do
      get '/get_processing_units', to: 'tasks#get_processing_units'
      get '/get_motherboards', to: 'tasks#get_motherboards'
      get '/get_ram_memories', to: 'tasks#get_ram_memories'
      get '/get_video_cards', to: 'tasks#get_video_cards'
      get '/get_assembly_pc_requests', to: 'tasks#get_assembly_pc_requests'
      post '/post_assembly_pc_request', to: 'tasks#post_assembly_pc_request'
    end
  end
end
