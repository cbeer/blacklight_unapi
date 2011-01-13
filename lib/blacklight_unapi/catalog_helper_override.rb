module BlacklightUnapi::CatalogHelperOverride
  def render_document_heading
    super + render(:partial =>'unapi/microformat')
  end
end
