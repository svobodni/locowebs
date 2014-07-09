class RegionTemplate < Locomotive::Wagon::Generators::Site::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'region_template')
  end

  def copy_sources
    @region_id = ask('ID kraje v registru Svobodných?')
    super
    File.symlink(File.join(File.dirname(__FILE__), '../config/deploy.yml'), File.join(destination,'config/deploy.yml'))
  end

end

Locomotive::Wagon::Generators::Site.register(:region_template, RegionTemplate, %{
  Generátor krajských webů Svobodných.
})
