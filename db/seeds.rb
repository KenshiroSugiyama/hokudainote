#学部＆学科作成------------------------------------------------------------------------------
require "csv"
["工学部"].each do |fac_item|
  faculty = Faculty.find_by(name: fac_item)
  faculty = Faculty.create(name: fac_item) unless faculty

  ["応用理工学科","環境社会工学科","情報エレクトロニクス工学科","機械知能工学科"].each do |dep_item|
    dep = faculty.departments.find_by(name: dep_item)
    faculty.departments.create(name: dep_item) unless dep
  end
end

["理学部","薬学部","獣医学部","農学部","医学部","歯学部","水産学部","経済学部","法学部","文学部","教育学部"].each do |fac_item|
  faculty = Faculty.find_by(name: fac_item)
  faculty = Faculty.create(name: fac_item) unless faculty
end

["化学科","数学科","生物科学科","物理学科","地球惑星科学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "理学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["薬科学科","薬学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "薬学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["獣医学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "獣医学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["医学科","保健学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "医学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["生物資源科学科","応用生命科学科","生物機能化学科","森林科学科","畜産科学科","生物環境工学科","農業経済学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "農学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["歯学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "歯学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["海洋生命科学科","海洋資源科学科","増殖生命科学科","資源機能化学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "水産学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["経済学科","経営学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "経済学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["法学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "法学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["文学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "文学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end

["教育学科"].each do |dep_item|
  faculty = Faculty.find_by(name: "教育学部")
  dep = faculty.departments.find_by(name: dep_item)
  faculty.departments.create(name: dep_item) unless dep
end
#教授作成-------------------------------------------------------------------------------------------
CSV.foreach('db/応用理工教授.csv').each do |row|
  last, first = row[0].split(' ')
  educator = Educator.find_by(last_name: last, first_name: first)
  educator = Educator.create(last_name: last, first_name: first) unless educator
  department = Department.find_by(name: "応用理工学科")
  unless educator.departments.find_by_id(department.id)
    educator.departments << department
  end
end

#授業作成-----------------------------------------------------------------------------------------------
CSV.foreach('db/応用理工授業.csv').each do |row|
  lecture = Lecture.find_by(name: row[0])
  Lecture.create(name: row[0]) unless lecture
end

#授業と教授紐付け(応用理工ver)--------------------------------------------------------------------------------------------
CSV.foreach('db/応用理工授業＆教授.csv').each do |row|
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

#授業と教授紐付け(環境社会ver)-----------------------------------------------------------------------
CSV.foreach('db/環境社会教授＆授業.csv').each do |row|
  lecture = Lecture.find_by(name: row[1])
  Lecture.create(name: row[1]) unless lecture
  last, first = row[0].split(' ')
  educator = Educator.find_by(first_name: first, last_name: last)
  educator = Educator.create(last_name: last, first_name: first) unless educator
  department = Department.find_by(name: "環境社会工学科")
  unless educator.departments.find_by_id(department.id)
    educator.departments << department
  end
  if lecture.present? && educator.present?
    begin
      lecture.educators << educator
    rescue => e
      print("skip")
    end
  end
end

CSV.foreach('db/機械知能工学科.csv').each do |row|
  if row[0].present? && row[1].present?
    lecture = Lecture.find_by(name: row[0])
    Lecture.create(name: row[0]) unless lecture
  
    last, first = row[1].split(' ')
    educator = Educator.find_by(first_name: first, last_name: last)
    educator = Educator.create(last_name: last, first_name: first) unless educator
    department = Department.find_by(name: "機械知能工学科")
    unless educator.departments.find_by_id(department.id)
      educator.departments << department
    end
  end
  if lecture.present? && educator.present?
    begin
      lecture.educators << educator
    rescue => e
      print("skip")
    end
  end
end

#------------------------------------------------------------------
CSV.foreach('db/情エレ.csv').each do |row|
  if row[0].present?
    lecture = Lecture.find_by(name: row[0])
    Lecture.create(name: row[0]) unless lecture
  end
  if row[1].present?
    last, first = row[1].split('　')
    educator = Educator.find_by(first_name: first, last_name: last)
    educator = Educator.create(last_name: last, first_name: first) unless educator
  end
  department = Department.find_by(name: "情報エレクトロニクス工学科")
  if educator.present?
    unless educator.departments.find_by_id(department.id)
      educator.departments << department
    end
  end
  if lecture.present? && educator.present?
    begin
      lecture.educators << educator
    rescue => e
      print("skip")
    end
  end
end
#銀行作成-------------------------------------------------------------------------------------------
["北洋銀行", "北海道銀行", "ゆうちょ銀行"].each do |bank|
  unless Bank.exists?(name: bank)
    Bank.create(name: bank)
  end
end



#銀行作成-------------------------------------------------------------------------------------------
["北洋銀行", "北海道銀行", "ゆうちょ銀行"].each do |bank|
  unless Bank.exists?(name: bank)
    Bank.create(name: bank)
  end
end

# csv定義-----------------------------------------------------------------------------------------
  CSV.foreach('db/化学科.csv').each do |row|
    if row[0].present? && row[1].present?
      lecture = Lecture.find_by(name: row[0])
      Lecture.create(name: row[0]) unless lecture
    
      last, first = row[1].split(' ')
      educator = Educator.find_by(first_name: first, last_name: last)
      educator = Educator.create(last_name: last, first_name: first) unless educator
      department = Department.find_by(name: "化学科")
      unless educator.departments.find_by_id(department.id)
        educator.departments << department
      end
    end
    if lecture.present? && educator.present?
      begin
        lecture.educators << educator
      rescue => e
        print("skip")
      end
    end
  end

  CSV.foreach('db/地球惑星科学科.csv').each do |row|
    if row[0].present? && row[1].present?
      lecture = Lecture.find_by(name: row[0])
      Lecture.create(name: row[0]) unless lecture
    
      last, first = row[1].split(' ')
      educator = Educator.find_by(first_name: first, last_name: last)
      educator = Educator.create(last_name: last, first_name: first) unless educator
      department = Department.find_by(name: "地球惑星科学科")
      unless educator.departments.find_by_id(department.id)
        educator.departments << department
      end
    end
    if lecture.present? && educator.present?
      begin
        lecture.educators << educator
      rescue => e
        print("skip")
      end
    end
  end

  CSV.foreach('db/経済学科.csv').each do |row|
    if row[0].present? && row[1].present?
      lecture = Lecture.find_by(name: row[0])
      Lecture.create(name: row[0]) unless lecture
    
      last, first = row[1].split(' ')
      educator = Educator.find_by(first_name: first, last_name: last)
      educator = Educator.create(last_name: last, first_name: first) unless educator
      department = Department.find_by(name: "経済学科")
      unless educator.departments.find_by_id(department.id)
        educator.departments << department
      end
    end
    if lecture.present? && educator.present?
      begin
        lecture.educators << educator
      rescue => e
        print("skip")
      end
    end
  end

  CSV.foreach('db/経営学科.csv').each do |row|
    if row[0].present? && row[1].present?
      lecture = Lecture.find_by(name: row[0])
      Lecture.create(name: row[0]) unless lecture
    
      last, first = row[1].split(' ')
      educator = Educator.find_by(first_name: first, last_name: last)
      educator = Educator.create(last_name: last, first_name: first) unless educator
      department = Department.find_by(name: "経営学科")
      unless educator.departments.find_by_id(department.id)
        educator.departments << department
      end
    end
    if lecture.present? && educator.present?
      begin
        lecture.educators << educator
      rescue => e
        print("skip")
      end
    end
  end

  CSV.foreach('db/法学科.csv').each do |row|
    if row[0].present? && row[1].present?
      lecture = Lecture.find_by(name: row[0])
      Lecture.create(name: row[0]) unless lecture
    
      last, first = row[1].split(' ')
      educator = Educator.find_by(first_name: first, last_name: last)
      educator = Educator.create(last_name: last, first_name: first) unless educator
      department = Department.find_by(name: "法学科")
      unless educator.departments.find_by_id(department.id)
        educator.departments << department
      end
    end
    if lecture.present? && educator.present?
      begin
        lecture.educators << educator
      rescue => e
        print("skip")
      end
    end
  end

#------------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------------


