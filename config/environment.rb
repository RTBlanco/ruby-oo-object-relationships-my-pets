Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}
# this requires all the ruby file in the lib folder 