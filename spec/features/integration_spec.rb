require 'spec_helper'

describe "Unapi", type: :feature do
  
  it "should have an abbr tag for the unapi id" do
    visit catalog_index_path(q: 'medicine')

    expect(page).to have_selector 'abbr.unapi-id'
  end

  it "should have an autodiscovery link" do
    visit catalog_index_path(q: 'medicine')
    expect(page).to have_selector 'link[rel="unapi-server"]', visible: false
  end
  
  it "should have unapi formats content" do
    visit unapi_path
    expect(page).to have_selector "format[name='oai_dc_xml']"
  end
  
  it "should have unapi document-specific formats content" do
    visit unapi_path id: 2008308201
    expect(page).to have_selector "format[name='oai_dc_xml']"
    expect(page).to have_selector "format[name='dc_xml']"
    expect(page).to have_selector "format[name='xml']"
  end
  
  it "should deliver the document format" do
    visit unapi_path id: 2008308201, format: 'xml'
    expect(page).to have_selector 'dc'
  end
end
