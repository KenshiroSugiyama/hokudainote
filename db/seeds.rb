require "csv"
["工学部"].each do |fac_item|
  faculty = Faculty.find_by(name: fac_item)
  faculty = Faculty.create(name: fac_item) unless faculty

  ["応用理工学科","環境社会工学科","情報エレクトロニクス工学科","機械知能工学科"].each do |dep_item|
    dep = faculty.departments.find_by(name: dep_item)
    faculty.departments.create(name: dep_item) unless dep
  end
end

CSV.foreach('db/a.csv').each do |row|
  educator = Educator.find_by(last_name: row[0], first_name: row[1])
  educator = Educator.create(last_name: row[0], first_name: row[1]) unless educator
  department = Department.find_by(name: "応用理工学科")
  unless educator.departments.find_by_id(department.id)
    educator.departments << department
  end
end

#<<<<<<< HEAD
#Bank.create(name: "北洋銀行")
#Bank.create(name: "北海道銀行")
#Bank.create(name: "ゆうちょ銀行")
#=======
CSV.foreach('db/e.csv').each do |row|
  lecture = Lecture.find_by(name: row[0])
  Lecture.create(name: row[0]) unless lecture
end

CSV.foreach('db/f.csv').each do |row|
  p row
  lecture = Lecture.find_by(name: row[0])
  last, first = row[1].split(' ')
  educator = Educator.find_by(first_name: first, last_name: last)
  if lecture.present? && educator.present?
    begin
      lecture.educators << educator
    rescue => e
      print("skip")
    end
  end
end

#
#
#CSV.foreach('db/d.csv').each do |row|
#    Department.find(1).educators.create(first_name: row[0])
#end
#
["北洋銀行", "北海道銀行", "ゆうちょ銀行"].each do |bank|
  unless Bank.exists?(name: bank)
    Bank.create(name: bank)
  end
end
#>>>>>>> kobayashi_review
