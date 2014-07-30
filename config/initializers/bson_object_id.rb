# See: http://artsy.github.io/blog/2013/11/07/upgrading-to-mongoid4/
module BSON
  class ObjectId
    def as_json(options = {})
      to_s
    end
  end
end