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

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('suricata') }
 
          it { is_expected.to contain_class('suricata::params') }
          it { is_expected.to contain_class('suricata::install') }
          it { is_expected.to contain_class('suricata::config') }
          it { is_expected.to contain_class('suricata::service') }

          it { is_expected.to contain_service('suricata') }
          it { is_expected.to contain_service('irqbalance').with_ensure('stopped') }

          it { is_expected.to contain_package('suricata').with_ensure('installed') }
          it { is_expected.to contain_package('ethtool').with_ensure('installed') }
          it { is_expected.to contain_package('libhtp1').with_ensure('installed') }

          it { is_expected.to contain_apt__ppa('ppa:oisf/suricata-stable') }

          it { should contain_file('suricata.yaml') }
          it { should contain_file('suricataboot') }

          it { should contain_cron('suricataboot_cron') }


        end
      end
    end
  end
end
