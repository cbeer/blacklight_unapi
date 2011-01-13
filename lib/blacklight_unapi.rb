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

     unless omit_inject[:helper_mixin]
        CatalogController.add_template_helper(BlacklightUnapi::CatalogHelperOverride) unless CatalogController.master_helper_module.include?(BlacklightUnapi::CatalogHelperOverride)
      end

     unless omit_inject[:autodiscovery_link]
       CatalogController.before_filter :only => [:index, :show] do |controller|
         safe_arr_add(controller.extra_head_content, controller.send(:render_to_string, :partial => 'unapi/autodiscovery_link'))
       end
     end

    end
  end

  def self.safe_arr_add(array, element)
    array << element unless array.include?(element)
  end
end
