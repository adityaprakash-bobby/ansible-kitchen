require 'spec_helper'

describe 'nginx_installation' do
    context package('nginx') do
        
        it { should be_installed }
        
        context port(80) do
            it { should be_listening }
        end

        context command('curl http://localhost/') do
            its(:stdout) do
                should contain 'Welcome to nginx'
            end
        end

    end
end