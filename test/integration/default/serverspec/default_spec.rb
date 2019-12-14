require 'spec_helper'

describe 'nginx_installation' do
    context package('nginx') do
        it { should be_installed }
    end
end