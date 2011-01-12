xml.instruct!
xml.formats do
  unapi_config do |shortname, meta|
    xml.format :name => shortname, :type => meta[:content_type]
  end

end
