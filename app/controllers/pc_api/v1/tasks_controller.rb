class PcApi::V1::TasksController < ApplicationController

  def index
    render json: {}, status: 200
  end

  def get_processing_units
    @processing_units = ProcessingUnit.all

    render json: @processing_units
  end

  def get_motherboards
    @motherboards = Motherboard.all

    render json: @motherboards
  end

  def get_ram_memories
    @ram_memories = RamMemory.all

    render json: @ram_memories
  end

  def get_video_cards
    @video_cards = VideoCard.all

    render json: @video_cards
  end

  def get_assembly_pc_requests
    array_search = []
    array_search << "assembly_pc_requests.customer_document = '#{params["customer_document"]}'" if params["customer_document"].present?
    array_search << "assembly_pc_requests.customer_name = '#{params["customer_name"]}'" if params["customer_name"].present?
    search_params = array_search.join(" AND ")

    @assembly_pc_requests = AssemblyPcRequest.where(search_params).all.order('created_at')

    render json: @assembly_pc_requests.to_json(:include => { :personal_computer => { :include => :ram_memories}})
  end

  def post_assembly_pc_request
    assembly_pc_request = AssemblyPcRequest.new(assembly_pc_request_params)

    if assembly_pc_request.save
      render json: {status: 'SUCCESS', message:'Request Saved Successfully.', data: assembly_pc_request}, status: :ok
    else
      render json: {status: 'ERROR', message:'Request Failed. Check the errors.', data: assembly_pc_request.errors.messages},status: :unprocessable_entity
    end
    byebug
  end

  private
  def assembly_pc_request_params
    params.permit(:id, :customer_document, :customer_name,
      personal_computer_attributes: [:motherboard_id, :processing_unit_id, :video_card_id, :assembly_pc_request_id,
        personal_computer_ram_memories_attributes: [:id, :personal_computer_id, :ram_memory_id]] )
  end
end
