class DocumentsController < ApplicationController
  respond_to :json

  def index
    @documents = Document.joins(:author)

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
      :only => [:id, :name],
      :include => {
        :author => { :only => [:id, :author_name] }
      }
    }
  end
end
