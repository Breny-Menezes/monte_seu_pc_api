require 'rails_helper'

RSpec.describe "PcApi::V1::Tasks", type: :request do
  describe "GET /get_processing_units" do
    it 'should return status ok' do
      get pc_api_v1_get_processing_units_path

      expect(response).to have_http_status(200)
    end
  end

  describe "GET /get_motherboards" do
    it 'should return status ok' do
      get pc_api_v1_get_motherboards_path

      expect(response).to have_http_status(200)
    end
  end

  describe "GET /get_ram_memories" do
    it 'should return status ok' do
      get pc_api_v1_get_ram_memories_path

      expect(response).to have_http_status(200)
    end
  end

  describe "GET /get_video_cards" do
    it 'should return status ok' do
      get pc_api_v1_get_video_cards_path

      expect(response).to have_http_status(200)
    end
  end

  describe "GET /get_assembly_pc_requests" do
    it 'should return status ok' do
      get pc_api_v1_get_assembly_pc_requests_path

      expect(response).to have_http_status(200)
    end
  end

  describe "POST /post_assembly_pc_request" do
    load File.expand_path('seeds.rb', Rails.root.to_s + '/db')

    it 'should return status ok' do
      data_json = JSON.parse('{
          "customer_document": "12345678",
          "customer_name":"teste",
          "personal_computer_attributes": {
              "motherboard_id": 1,
              "processing_unit_id": 2,
              "video_card_id": 1,
              "personal_computer_ram_memories_attributes": [
                  { "ram_memory_id": 1 },
                  { "ram_memory_id": 2 }
              ]
          }
        }'
      )

      post pc_api_v1_post_assembly_pc_request_path(data_json)

      expect(response).to have_http_status(200)
    end

    it 'should return status invalid argument exception' do
      post pc_api_v1_post_assembly_pc_request_path

      expect(response).to have_http_status(422)
    end
  end
end
