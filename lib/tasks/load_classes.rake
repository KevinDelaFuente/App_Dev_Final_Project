namespace :load_classes do
  desc "TODO"
  task curriculum: :environment do
    
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "appdev_courses.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      c = Course.new
      c.title = row["title"].to_s
      c.description = row["description"].to_s
      c.professor_id = row["professor_id"]
      c.skill_id = row["skill_id"]
      c.rating = row["rating"]
      c.hours_required = row["hours_required"]
      c.likes_count = row["likes_count"]
      c.save
    end
    
    puts "There are now #{Course.count} rows in the courses table"

  end

  

end
