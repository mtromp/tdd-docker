# spec/Dockerfile_spec.rb

require 'spec_helper.rb'

describe 'Dockerfile' do
    before(:all) do
        @image = Docker::Image.build_from_dir('.')

        set :os, family: :debian
        set :backend, :docker
        set :docker_image, @image.id
    end

    context 'Verifies that correct operating system is installed' do
        it 'installs the right version of Ubuntu' do
            expect(os_version).to include('Ubuntu 14')
        end
    end

    context 'Verify correct packages are installed' do
        it 'install and run apache' do
            expect(package('apache2')).to be_installed
            expect(service('apache2')).to be_running
        end

        it 'install php5' do
            expect(package('php5')).to be_installed
        end
    end
    def os_version
        command('lsb_release -a').stdout
    end

       it 'should expose the default port 80' do
         expect(@image.json['ContainerConfig']['ExposedPorts']).to include("80/tcp")
   end
end
