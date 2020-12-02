namespace :load do
  desc "TODO"
  task professors: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "professors.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      c = Professor.new
      c.name = row["name"].to_s
      c.save
    end
    
    puts "There are now #{Professor.count} rows in the courses table"

  end

end
