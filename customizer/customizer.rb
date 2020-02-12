#! /usr/local/bin/ruby
# frozen_string_literal: true

require 'yaml'
require 'fileutils'
require 'active_support/core_ext/hash/deep_merge'

template_override_config_file = './template_override_config.yaml'
out_dir = './out'
template_dir = '/workdir'
config = YAML.load_file(File.join(['/workdir', template_override_config_file]))

Dir.glob('**/*.y*ml', base: template_dir) do |template_file|
  overriding_object = config.dig(*template_file.split('/'))
  next if overriding_object.nil?

  template = File.read(template_file)
  # YAML.load only loads first document separated by '---'
  # Splitting template body for its intrinsic functions to be eliminated.
  # ex) !Ref will be eliminated as it's loaded in YAML.load
  template_head = YAML.load(template)
  overridden = template_head.deep_merge!(overriding_object)
  dirname = FileUtils.mkdir_p(File.join(out_dir, File.dirname(template_file)))
  output_path = File.join(dirname, File.basename(template_file))
  File.write(output_path, YAML.dump(overridden))
  lines = template.lines
  File.open(output_path, 'a') do |f|
    lines[lines.index("---\n")..-1].each { |line| f.print line }
  end
end
