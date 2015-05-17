dir = File.dirname(File.expand_path(__FILE__))
if ENV['ENV']
  env = ENV['ENV']
else
  env = 'dev'
end

require 'yaml'
require "#{dir}/puphpet/ruby/deep_merge.rb"

configValues = YAML.load_file("#{dir}/puphpet/#{env}.yaml")

if File.file?("#{dir}/puphpet/#{env}.custom.yaml")
  custom = YAML.load_file("#{dir}/puphpet/#{env}.custom.yaml")
  configValues.deep_merge!(custom)
end

data = configValues['vagrantfile']

Vagrant.require_version '>= 1.6.0'

eval File.read("#{dir}/puphpet/vagrant/Vagrantfile-#{data['target']}")
