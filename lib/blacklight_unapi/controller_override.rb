# Meant to be applied on top of a controller that implements
# Blacklight::SolrHelper. 
module BlacklightUnapi::ControllerOverride
  def self.included(some_class)
    some_class.helper_method :unapi_config
  end

  def unapi
    render :file => 'unapi/info.xml.builder' and return if params[:id].blank?

    @id = params[:id]
    @response, @document = get_solr_response_for_doc_id(@id)

    render :file => 'unapi/formats.xml.builder' and return if params[:format].nil?

    @format = params[:format]

    respond_to do |format|
      format.all {
        if @document.will_export_as @format
          send_data @document.export_as(@format), :type => @document.export_formats[@format][:content_type], :disposition => 'inline' 
        end
      }
    end


  end

  # Uses Blacklight.config, needs to be modified when
  # that changes to be controller-based. This is the only method
  # in this plugin that accesses Blacklight.config, single point
  # of contact. 
  def unapi_config   
    Blacklight.config[:unapi] || {}
  end
end
