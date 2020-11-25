namespace :load_classes do
  desc "TODO"
  task curriculum: :environment do
    
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "appdev_courses.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      c = Course.new
      c.title = row["Class"]
      c.description = row["Decription"]
      c.professor_id = row["Professor_ID"]
      c.skill_id = row["Skill"]
      c.rating = row["Rating"]
      c.hours_required = row["Hours Required"]
      c.save
    end
    
    puts "There are now #{Course.count} rows in the courses table"

  end

  

end
