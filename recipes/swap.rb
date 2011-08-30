
#############################################################################
# Create swapfile since only small instances have swap by default
unless node[:ec2][:instance_type] == "m1.small"
  swapfile = "/mnt/swapfile"

  execute "create swapfile" do
    command "dd if=/dev/zero of=#{swapfile} bs=1024 count=#{node[:memory][:total].to_i}" # swap equal to system memory
    creates swapfile
  end

  # make sure its not world readable
  execute "chmod 640 #{swapfile}" do
    not_if { File.stat(swapfile).mode == 0100640 } # don't run if already has 0600 mode
  end

  # make it a swapfile
  execute "mkswap #{swapfile}" do
    not_if { swap_exists?(swapfile) }
  end

  # turn on swap
  execute "swapon #{swapfile}" do
    not_if { swap_exists?(swapfile) }
  end
end
