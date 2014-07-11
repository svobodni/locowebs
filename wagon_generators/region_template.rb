class RegionTemplate < Locomotive::Wagon::Generators::Site::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'region_template')
  end

  def copy_sources
    @region_id = ask('ID kraje v registru Svobodných?')
    @fb_page_name = ask('Název stránky na facebooku? (např. svobodni.praha)')
    super
    File.symlink('../../../config/deploy.yml', File.join(destination,'config/deploy.yml')) unless File.exist?(File.join(destination,'config/deploy.yml'))
  end

end

Locomotive::Wagon::Generators::Site.register(:region_template, RegionTemplate, %{
  Generátor krajských webů Svobodných.
})
