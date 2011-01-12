# BlacklightUnapi

module BlacklightUnapi
  @omit_inject = {}
  def self.omit_inject=(value)
    value = Hash.new(true) if value == true
    @omit_inject = value      
  end
  def self.omit_inject ; @omit_inject ; end
  
  def self.inject!
    Dispatcher.to_prepare do

     unless omit_inject[:controller_mixin]
        CatalogController.send(:include, BlacklightUnapi::ControllerOverride) unless CatalogController.include?(BlacklightUnapi::ControllerOverride)
      end

    end
  end
end
