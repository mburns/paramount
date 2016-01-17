require 'chefspec'
require_relative 'spec_helper'

describe 'paramount::amavis' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge described_recipe }

  it 'installs amavisd-new' do
    expect(chef_run).to install_package 'amavisd-new'
  end

  it 'writes 01-basic config' do
    expect(chef_run).to render_file '/etc/amavis/conf.d/01-basic'
  end

  %w(
    01-debian
    05-domain_id
    05-node_id
    15-av_scanners
    15-content_filter_mode
    20-debian_defaults
    21-ubuntu_defaults
    25-amavis_helpers
    30-template_localization
    40-policy_banks
    50-user
  ).each do |filename|
    it "deletes #{filename}" do
      expect(chef_run).to delete_file("/etc/amavis/conf.d/#{filename}")
    end
  end
end
