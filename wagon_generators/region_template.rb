class RegionTemplate < Locomotive::Wagon::Generators::Site::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'region_template')
  end
end

Locomotive::Wagon::Generators::Site.register(:region_template, RegionTemplate, %{
  Generátor krajských webů Svobodných.
})
