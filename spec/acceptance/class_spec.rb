if ENV['BEAKER'] == 'true'
  # running in BEAKER test environment
  require 'spec_helper_acceptance'
else
  # running in non BEAKER environment
  require 'serverspec'
  set :backend, :exec
end

describe 'suricata class' do

  context 'monitor_interface eth0' do
    if ENV['BEAKER'] == 'true'
      # Using puppet_apply as a helper
      it 'should work idempotently with no errors' do
        pp = <<-EOS
        class { 'suricata': monitor_interface => 'eth0' }
        EOS

        apply_manifest(pp, :catch_failures => true, :future_parser => true)
      end
    end


    # default module tests
    describe package('suricata') do
      it { is_expected.to be_installed }
    end

    describe service('suricata') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

  end
end
