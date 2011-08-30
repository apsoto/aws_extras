cookbook_file "/usr/local/bin/ec2-metadata" do
  source "ec2-metadata"
  mode 0755
  owner "root"
  group "root"
end

