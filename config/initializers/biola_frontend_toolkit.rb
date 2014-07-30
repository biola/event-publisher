BiolaFrontendToolkit.configure do |config|
  config.app_name = Settings.app.name
  config.relative_root = Settings.app.relative_url_root
  config.app_links = [
    {title: Settings.app.name, url: Settings.app.relative_url_root, icon: 'home'},
    {title: 'Timecard', url: 'http://timecard.biola.edu', icon: 'calendar'},
    {title: 'Gmail', url: 'http://mail.biola.edu', icon: 'envelope-o'},
    {title: 'Forms', url: 'http://forms.biola.edu', icon: 'check-square-o'},
  ]
end
