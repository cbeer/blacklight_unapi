xml.instruct!
xml.formats(:id => @document.id) do
  @document.export_formats.each do |shortname, meta|
    xml.format :name => shortname, :type => meta[:content_type]
  end

end
