module Ec2Helper
  def swap_exists?(device)
    return system("swapon -s | grep #{device}")
  end
end

class Chef::Resource
  include Ec2Helper
end

class Chef::Recipe
  include Ec2Helper
end
