require 'open-uri'
require 'csv'

class DataImporter
  CSV_FILE_URL = "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt"

  attr_accessor :logger

  def initialize
    @logger = Logger.new(STDOUT)
  end

  def run
    log "Downloading data..."
    data = download_data

    log "Import started..."
    n = 0
    CSV.parse data, headers: true do |row|
      import_record(row)
      n += 1
    end

    log "Import finished. #{n} records received."
  end

  private

  def import_record(csv_row)
    record = Earthquake.find_or_initialize_by(source_id: csv_row['Eqid'])
    record.src        = csv_row['Src']
    record.version    = csv_row['Version']
    record.datetime   = csv_row['Datetime']
    record.lat        = csv_row['Lat']
    record.lon        = csv_row['Lon']
    record.magnitude  = csv_row['Magnitude']
    record.depth      = csv_row['Depth']
    record.nst        = csv_row['NST']
    record.region     = csv_row['Region']
    record.save!
  end

  def download_data
    open(CSV_FILE_URL)
  end

  def log(message)
    @logger && @logger.info(message)
  end
end
