require 'spec_helper'

describe 'suricata' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir    => "/foo",
          })
        end

        context "suricata class with monitor_interface eth0 parameter" do
          let(:params) { {:monitor_interface => "eth0"} }

          # should compile
          it { is_expected.to compile.with_all_deps }

          # contain classes
          it { is_expected.to contain_class('suricata') }
          it { is_expected.to contain_class('suricata::params') }
          it { is_expected.to contain_class('suricata::install') }
          it { is_expected.to contain_class('suricata::config') }
          it { is_expected.to contain_class('suricata::service') }

          # contain packages
          it { is_expected.to contain_package('suricata') }
          it { is_expected.to contain_package('ethtool') }
          it { is_expected.to contain_package('libhtp1') }
          it { is_expected.to contain_package('python-pyinotify') }
          it { is_expected.to contain_package('python-software-properties') }
          it { is_expected.to contain_package('software-properties-common') }

          # contain files
          it { should contain_file('suricata.yaml') }
          it { should contain_file('suricataboot') }
          it { should contain_file('logdir') }
          it { should contain_file('suricata-default') }

          # contain exec
          it { should contain_exec('disable_gro') }
          it { should contain_exec('disable_gso') }
          it { should contain_exec('disable_rx') }
          it { should contain_exec('disable_rxvlan') }
          it { should contain_exec('disable_sg') }
          it { should contain_exec('set_enable') }
          it { should contain_exec('set_promisc') }

          # contain cron
          it { should contain_cron('suricataboot_cron') }

          # contain apt ppa
          it { is_expected.to contain_apt__ppa('ppa:oisf/suricata-stable') }

          # contain services
          it { is_expected.to contain_service('suricata') }
          it { is_expected.to contain_service('irqbalance').with_ensure('stopped') }

        end
      end
    end
  end
end
