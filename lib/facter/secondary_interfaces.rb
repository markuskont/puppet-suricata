Facter.add(:secondary_interfaces) do
  confine :kernel => 'Linux'
  networking = Facter.value(:networking)
  secondary_interfaces = []
  networking['interfaces'].each do |interface,details|
    if (interface !~ /lo/ && interface != networking['primary'] && interface !~ /(?:tun|tap)\d+/ && interface !~ /.+:.+/)
      secondary_interfaces << interface unless details['bindings'].nil?
    end
  end
  setcode do
    secondary_interfaces
  end
end
