# # encoding: utf-8

# Inspec test for recipe REAN-vault::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('vault') do
  it { should exist }
end

describe file('/var/log/vault.log') do
  it { should exist }
end

describe port(8200) do
  it { should be_listening }
end
