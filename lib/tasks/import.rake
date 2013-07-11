require 'data_importer'

task :import => :environment do
  DataImporter.new.run
end
