class PartsController < ApplicationController
  respond_to :json

  def index
    @parts = Part.where(document: params[:document_id])

    respond_with @parts, part_options
  end

  def show
    @part = Part.find(params[:id])

    respond_with @part, part_options
  end

  private
  # What to output from a part
  def part_options
    {
      :only => [:id, :name, :metadata, :content, :next_id, :previous_id, :document_id],
    }
  end
end
