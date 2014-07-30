Dir[Rails.root.join("app", "extensions", "*.rb")].each do |path|
  require path
end