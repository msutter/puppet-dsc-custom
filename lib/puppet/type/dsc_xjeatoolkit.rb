begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  $:.unshift("../puppet-dsc/lib")
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xjeatoolkit) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xJeaToolKit resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit-wave-6/xJea/DSCResources/MSFT_xJeaToolkit/MSFT_xJeaToolkit.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xJeaToolKit"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xJeaToolkit"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xJea"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.2.16.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    desc "Name of the JEA toolkit to be generated"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CommandSpecs
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_commandspecs) do
    desc "CSV formated list of command specifications"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ScriptDirectory
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scriptdirectory, :array_matching => :all) do
    desc "array of script directories that can be run"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         Applications
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applications, :array_matching => :all) do
    desc "Array of executables that are allowed to run"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end


end
