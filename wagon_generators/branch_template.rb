class BranchTemplate < Locomotive::Wagon::Generators::Site::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'branch_template')
  end
end

Locomotive::Wagon::Generators::Site.register(:branch_template, BranchTemplate, %{
  Generátor pobočkových webů Svobodných.
})
