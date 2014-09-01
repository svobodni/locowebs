# encoding: utf-8
require 'json'

class CandidateTemplate < Locomotive::Wagon::Generators::Site::Base
  def self.source_root
    File.join(File.dirname(__FILE__), 'candidate_template')
  end

  def copy_sources
  	websites = JSON.load(File.open(File.join(File.dirname(__FILE__), '..', 'config/sites.json')).read)
	site = websites.detect{|site| site['name']==name}
	if site
		@title = site['title'].force_encoding("ASCII-8BIT")
		@short_title = site['short_title'].force_encoding("ASCII-8BIT")
		@constituency = site['constituency'].force_encoding("ASCII-8BIT")
		@voting_number = site['voting_number']
		@fb_page_name = site['fb_page_name'].force_encoding("ASCII-8BIT")
		@region_name = site['region_name'].force_encoding("ASCII-8BIT")
		@region_url = site['region_url']
	else
		@title = ask('Název webu? (např. Ing. Vladimír Gregor - Děčín)')
		@short_title = ask('Jméno kandidáta? (např. Vladimír Gregor)')
	    @constituency = ask('Název volebního obvodu?')
	    @voting_number = ask('Vylosované volební číslo?')
	    @fb_page_name = ask('Název FB stránky? (např. svobodni.praha)')
	    @region_name = ask('Název kraje? (např. Středočeský kraj)')
	    @region_url = ask('Url adresa kraje? (např. http://praha.svobodni.cz)')
	end
    super
    File.symlink('../../../config/deploy.yml', File.join(destination,'config/deploy.yml')) unless File.exist?(File.join(destination,'config/deploy.yml'))
  end

end

Locomotive::Wagon::Generators::Site.register(:candidate_template, CandidateTemplate, %{
  Generátor webů kandidátů Svobodných.
})
