# spec/Dockerfile_spec.rb

require "serverspec"
require "docker"

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end
	
	context "Verifies that correct operating system is installed" do
		it "installs the right version of Ubuntu" do
			expect(os_version).to include("Ubuntu 14")
		end
  end

	context "Verify correct packages are installed" do
		it "install and run apache" do
			expect(package("apache2")).to be_installed
			expect(service("apache2")).to be_running 
		end
	end

  def os_version
    command("lsb_release -a").stdout
  end
end
	