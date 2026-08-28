# frozen_string_literal: true

module RailwayJp
  # Compares records by id, so the same record loaded twice is equal.
  module Equality
    def hash
      [self.class, id].hash
    end

    def eql?(other)
      self == other
    end

    def ==(other)
      other.instance_of?(self.class) && id == other.id
    end
  end
end
