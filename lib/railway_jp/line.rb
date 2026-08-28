# frozen_string_literal: true

require 'csv'

module RailwayJp
  # A railway line, such as a JR or subway line.
  class Line
    MAPPINGS = {
      id: 'line_cd',
      name: 'line_name',
      color: 'line_color_c'
    }.freeze

    include RailwayJp::Equality

    class << self
      def all
        @all ||= data.map { |row| new(row) }
      end

      def find(id)
        row = data_index_by_id[id.to_s]
        row ? new(row) : nil
      end

      private

      # @return [CSV::Table]
      def data
        @data ||= CSV.parse(File.open(File.join(__dir__, '../data', 'line.csv')), headers: true)
      end

      def data_index_by_id
        @data_index_by_id ||= data.to_h { |cur| [cur['line_cd'], cur] }
      end
    end

    private_class_method :new
    attr_reader(*MAPPINGS.keys)

    def initialize(row)
      MAPPINGS.each do |attr, column_name|
        instance_variable_set("@#{attr}", row[column_name])
      end
    end
  end
end
