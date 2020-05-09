require 'csv'

module RailwayJp
  class Station
    MAPPINGS = {
      id: 'station_cd',
      name: 'station_name',
      name_kanji: 'station_name_k',
      line_id: 'line_cd',
      prefecture_id: 'pref_cd',
      postcode: 'post',
      address: 'address',
      longitude: 'lon',
      latitude: 'lat',
    }.freeze

    private_class_method :new
    attr_reader *MAPPINGS.keys

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
        @data ||= CSV.parse(File.open(File.join(__dir__, '../data','station.csv')), headers: true)
      end

      def data_index_by_id
        @data_index_by_id ||= data.each_with_object({}) { |cur, obj| obj[cur['station_cd']] = cur }
      end
    end

    def initialize(row)
      MAPPINGS.each do |attr, column_name|
        instance_variable_set("@#{attr}", row[column_name])
      end
    end

    # TODO
    # def line
    # end
  end
end
