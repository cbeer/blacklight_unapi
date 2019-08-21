# Meant to be applied on top of a controller that implements
# Blacklight::SolrHelper. 
module BlacklightUnapi::ControllerExtension
  extend ActiveSupport::Concern

  included do
    helper BlacklightUnapiHelper
  end

  def unapi
    @export_formats = blacklight_config.unapi
    @format = params[:format]

    if params[:id]
      @response, @document = search_service.fetch(params[:id])
      @export_formats = @document.export_formats
    end

    if params[:format]
      respond_to do |format|
        format.all do
          if @document.will_export_as @format
            send_data @document.export_as(@format), type: @document.export_formats[@format][:content_type], disposition: 'inline'
          end
        end
      end
    else
      render template: 'catalog/formats.xml'
    end
  end
end
