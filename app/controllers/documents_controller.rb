class DocumentsController < ApplicationController
  respond_to :json

  def index
    @documents = Document.includes(:author)

    respond_with @documents, document_options
  end

  def show
    @document = Document.find(params[:id])

    respond_with @document, document_options
  end

  private
  # What to output from a document
  def document_options
    {
      :only => [:id, :name, :first_part_id, :parts_ids],
      :include => {
        :author => { :only => [:id, :author_name] }
      }
    }
  end
end
