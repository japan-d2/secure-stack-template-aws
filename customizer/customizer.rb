#! /usr/local/bin/ruby
# frozen_string_literal: true

require 'yaml'
require 'fileutils'
require 'active_support/core_ext/hash/deep_merge'

template_override_config_file = 'template_override_config.yaml'
out_dir = 'out'
template_dir = '/workdir'
config = YAML.load_file(File.join(['/workdir', template_override_config_file]))

Dir.glob('**/*.y*ml', base: template_dir)
   .grep_v(%r{#{out_dir}/})
   .grep_v(template_override_config_file).each do |template_file|
  overriding_object = config.dig(*template_file.split('/'))
  if overriding_object.nil?
    dirname = FileUtils.mkdir_p(File.join(out_dir, File.dirname(template_file)))
    output_path = File.join(dirname, File.basename(template_file))
    FileUtils.copy(template_file, output_path)
    next
  end
  template = File.read(template_file)
  # YAML.load only loads first document separated by '---'
  # Splitting template body for its intrinsic functions not to be eliminated.
  # ex) !Ref will be eliminated as it's loaded in YAML.load
  #
  # Though this separator should really be inserted in the template,
  # it's impossibel to suppress E0000 error in cfn-lint because of a bug.
  # cf) https://github.com/aws-cloudformation/cfn-python-lint/issues/1133
  # Therefore seprator is inserted here dynamically.
  separater_index = 0
  template.each_line.with_index do |line, index|
    if /^(Conditions|Resources):/ =~ line
      separater_index = index
      break
    end
  end
  template = template.lines.insert(separater_index, "---\n").join
  template_head = YAML.load(template)
  overridden = template_head.deep_merge!(overriding_object)
  dirname = FileUtils.mkdir_p(File.join(out_dir, File.dirname(template_file)))
  output_path = File.join(dirname, File.basename(template_file))
  File.write(output_path, YAML.dump(overridden).gsub(/---\R/, ''))
  File.open(output_path, 'a') do |f|
    template.lines[separater_index + 1..-1].each { |line| f.print line }
  end
end
