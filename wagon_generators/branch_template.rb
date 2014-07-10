# encoding: utf-8
require 'json'

class BranchTemplate < Locomotive::Wagon::Generators::Site::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'branch_template')
  end

  def copy_sources
  	websites = JSON.load(File.open(File.join(File.dirname(__FILE__), '..', 'config/sites.json')).read)
	site = websites.detect{|site| site['name']==name}
	if site
		@title = site['title'].force_encoding("ASCII-8BIT")
		@short_title = site['short_title']
		@branch_id = site['branch_id']
		@fb_page_name = site['fb_page_name']
	else
		@title = ask('Název webu? (např. Svobodní Praha 9)')
		@short_title = ask('Název pobočky? (např. Praha 9)')
	    @branch_id = ask('ID pobočky v registru Svobodných?')
	    @branch_id = ask('Název FB stránky? (např. svobodni.praha)')
	end
    super
    File.symlink('../../../config/deploy.yml', File.join(destination,'config/deploy.yml')) unless File.exist?(File.join(destination,'config/deploy.yml'))
  end

end

Locomotive::Wagon::Generators::Site.register(:branch_template, BranchTemplate, %{
  Generátor pobočkových webů Svobodných.
})
