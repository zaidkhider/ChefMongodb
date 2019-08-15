# InSpec test for recipe mongo::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end


describe port(80), :skip do
  it { should_not be_listening }
end


describe package "mongodb-org" do
  it { should be_installed }
  its('version'){ should match /3\./}
end

describe service 'mongod' do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
