#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xservice) do

  let :dsc_xservice do
    Puppet::Type.type(:dsc_xservice).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xservice.to_s).to eq("Dsc_xservice[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xservice[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xservice[:dsc_name]
    expect { Puppet::Type.type(:dsc_xservice).new(
      :name     => 'foo',
      :dsc_state => 'Running',
      :dsc_startuptype => 'Automatic',
      :dsc_builtinaccount => 'LocalSystem',
      :dsc_credential => 'foo',
      :dsc_status => 'foo',
      :dsc_displayname => 'foo',
      :dsc_description => 'foo',
      :dsc_path => 'foo',
      :dsc_dependencies => ["foo", "bar", "spec"],
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xservice[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xservice[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xservice[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xservice[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Running' do
    dsc_xservice[:dsc_state] = 'Running'
    expect(dsc_xservice[:dsc_state]).to eq('Running')
  end

  it 'should accept dsc_state predefined value running' do
    dsc_xservice[:dsc_state] = 'running'
    expect(dsc_xservice[:dsc_state]).to eq('running')
  end

  it 'should accept dsc_state predefined value Stopped' do
    dsc_xservice[:dsc_state] = 'Stopped'
    expect(dsc_xservice[:dsc_state]).to eq('Stopped')
  end

  it 'should accept dsc_state predefined value stopped' do
    dsc_xservice[:dsc_state] = 'stopped'
    expect(dsc_xservice[:dsc_state]).to eq('stopped')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xservice[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xservice[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xservice[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xservice[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xservice[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_startuptype predefined value Automatic' do
    dsc_xservice[:dsc_startuptype] = 'Automatic'
    expect(dsc_xservice[:dsc_startuptype]).to eq('Automatic')
  end

  it 'should accept dsc_startuptype predefined value automatic' do
    dsc_xservice[:dsc_startuptype] = 'automatic'
    expect(dsc_xservice[:dsc_startuptype]).to eq('automatic')
  end

  it 'should accept dsc_startuptype predefined value Manual' do
    dsc_xservice[:dsc_startuptype] = 'Manual'
    expect(dsc_xservice[:dsc_startuptype]).to eq('Manual')
  end

  it 'should accept dsc_startuptype predefined value manual' do
    dsc_xservice[:dsc_startuptype] = 'manual'
    expect(dsc_xservice[:dsc_startuptype]).to eq('manual')
  end

  it 'should accept dsc_startuptype predefined value Disabled' do
    dsc_xservice[:dsc_startuptype] = 'Disabled'
    expect(dsc_xservice[:dsc_startuptype]).to eq('Disabled')
  end

  it 'should accept dsc_startuptype predefined value disabled' do
    dsc_xservice[:dsc_startuptype] = 'disabled'
    expect(dsc_xservice[:dsc_startuptype]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xservice[:dsc_startuptype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startuptype' do
    expect{dsc_xservice[:dsc_startuptype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startuptype' do
    expect{dsc_xservice[:dsc_startuptype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startuptype' do
    expect{dsc_xservice[:dsc_startuptype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startuptype' do
    expect{dsc_xservice[:dsc_startuptype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_builtinaccount predefined value LocalSystem' do
    dsc_xservice[:dsc_builtinaccount] = 'LocalSystem'
    expect(dsc_xservice[:dsc_builtinaccount]).to eq('LocalSystem')
  end

  it 'should accept dsc_builtinaccount predefined value localsystem' do
    dsc_xservice[:dsc_builtinaccount] = 'localsystem'
    expect(dsc_xservice[:dsc_builtinaccount]).to eq('localsystem')
  end

  it 'should accept dsc_builtinaccount predefined value LocalService' do
    dsc_xservice[:dsc_builtinaccount] = 'LocalService'
    expect(dsc_xservice[:dsc_builtinaccount]).to eq('LocalService')
  end

  it 'should accept dsc_builtinaccount predefined value localservice' do
    dsc_xservice[:dsc_builtinaccount] = 'localservice'
    expect(dsc_xservice[:dsc_builtinaccount]).to eq('localservice')
  end

  it 'should accept dsc_builtinaccount predefined value NetworkService' do
    dsc_xservice[:dsc_builtinaccount] = 'NetworkService'
    expect(dsc_xservice[:dsc_builtinaccount]).to eq('NetworkService')
  end

  it 'should accept dsc_builtinaccount predefined value networkservice' do
    dsc_xservice[:dsc_builtinaccount] = 'networkservice'
    expect(dsc_xservice[:dsc_builtinaccount]).to eq('networkservice')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xservice[:dsc_builtinaccount] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_builtinaccount' do
    expect{dsc_xservice[:dsc_builtinaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_builtinaccount' do
    expect{dsc_xservice[:dsc_builtinaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_builtinaccount' do
    expect{dsc_xservice[:dsc_builtinaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_builtinaccount' do
    expect{dsc_xservice[:dsc_builtinaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xservice[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xservice[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xservice[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xservice[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_status' do
    expect{dsc_xservice[:dsc_status] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_status' do
    expect{dsc_xservice[:dsc_status] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_status' do
    expect{dsc_xservice[:dsc_status] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_status' do
    expect{dsc_xservice[:dsc_status] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xservice[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xservice[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xservice[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xservice[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xservice[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xservice[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xservice[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xservice[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xservice[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xservice[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xservice[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xservice[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_dependencies' do
    dsc_xservice[:dsc_dependencies] = ["foo", "bar", "spec"]
    expect(dsc_xservice[:dsc_dependencies]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_dependencies' do
    expect{dsc_xservice[:dsc_dependencies] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dependencies' do
    expect{dsc_xservice[:dsc_dependencies] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dependencies' do
    expect{dsc_xservice[:dsc_dependencies] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xservice[:dsc_ensure] = 'Present'
    expect(dsc_xservice[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xservice[:dsc_ensure] = 'present'
    expect(dsc_xservice[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xservice[:dsc_ensure] = 'present'
    expect(dsc_xservice[:ensure]).to eq(dsc_xservice[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xservice[:dsc_ensure] = 'Absent'
    expect(dsc_xservice[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xservice[:dsc_ensure] = 'absent'
    expect(dsc_xservice[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xservice[:dsc_ensure] = 'absent'
    expect(dsc_xservice[:ensure]).to eq(dsc_xservice[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xservice[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xservice[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xservice[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xservice[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xservice[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xservice)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xservice)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xservice[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xservice[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xservice.original_parameters[:dsc_ensure] = 'present'
        dsc_xservice[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xservice)
      end

      it "should update :ensure to :present" do
        expect(dsc_xservice[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xservice.original_parameters[:dsc_ensure] = 'absent'
        dsc_xservice[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xservice)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xservice[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xservice)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xservice)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xServiceResource as $MSFT_xServiceResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xServiceResource/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xservice[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xservice)
      end

      it "should update :ensure to :present" do
        expect(dsc_xservice[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xservice[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xservice)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xservice[:ensure]).to eq(:absent)
      end

    end

  end
end
