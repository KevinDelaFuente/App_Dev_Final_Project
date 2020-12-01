namespace :load_skillsets do
  desc "TODO"
  task reference: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "skillsets.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      keys = row.to_hash.keys
      c = Skillset.new
      c.careerpath_id = row.to_hash.fetch(keys.first)
      c.course_id = row["course_id"].to_i
      c.save
    end
    
    puts "There are now #{Skillset.count} rows in the courses table"

  end

end
