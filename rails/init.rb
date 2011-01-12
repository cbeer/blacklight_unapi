require 'blacklight_unapi'

# We do our injection in after_initialize so an app can stop it or configure
# it in an initializer, using BlacklightUnapi.omit_inject .
config.after_initialize do 
  BlacklightUnapi.inject!
end
