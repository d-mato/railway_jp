# frozen_string_literal: true

module RailwayJp
  # Compares records by id, so the same record loaded twice is equal.
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
