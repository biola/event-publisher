String.class_eval do
  def short_url
    self.sub(/^https?\:\/\//, '').sub(/^www./,'')
  end
end