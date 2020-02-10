#! /usr/local/bin/ruby
# frozen_string_literal: true

require 'yaml'
require 'fileutils'
require 'active_support/core_ext/hash/deep_merge'

template_override_config_file = './template_override_config.yaml'
out_dir = './out'
template_dir = '/workdir'
config = YAML.load_file(['/workdir', template_override_config_file].join('/'))
ROOT_KEYS = [
  'AWSTemplateFormatVersion',
  'Description',
  'Metadata',
  'Parameters',
  'Mappings',
  'Conditions',
  'Transform',
  'Resources',
  'Outputs'
]

Dir.glob('**/*.y*ml', base: template_dir) { |template_file|
  template = YAML.load_file([template_dir, template_file].join('/'))
  overriding_object = config.dig(*template_file.split('/'))
  next if overriding_object.nil?

  template.deep_merge!(overriding_object)
  overridden = ROOT_KEYS.clone
                         .map { |e| { e => template[e] } }
                         .reduce { |result, e| result.merge(e) }
                         .compact

  dirname = FileUtils.mkdir_p([out_dir, File.dirname(template_file)].join('/'))
  out_file = File.open([dirname, File.basename(template_file)].join('/'), 'w')

  YAML.dump(overridden, out_file)
}
