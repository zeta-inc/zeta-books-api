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

  def create
    document = Document.find(params[:document_id])

    @part = Part.new(parts_params)
    @part.document = document

    if document.first_part.nil?
      @part.save
      document.first_part = @part
    else
      @part.previous_id = document.parts_ids[-1]
      @part.save
    end

    document.parts_ids << @part.id
    document.save

    respond_with @part, part_options
  end

  private
  # What to output from a part
  def part_options
    {
      :only => [:id, :name, :metadata, :content, :next_id, :previous_id, :document_id],
    }
  end

  def parts_params
    params.require(:part).permit(:name, :metadata, :content)
  end
end
