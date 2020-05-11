module RailwayJp
  module Equality
    def hash
      id.hash
    end

    def eql?(other)
      self == other
    end

    def ==(other)
      id == other.id
    end
  end
end

