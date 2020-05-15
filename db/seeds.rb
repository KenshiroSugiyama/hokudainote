#工学部＆学科作成------------------------------------------------------------------------------
require "csv"
["工学部"].each do |fac_item|
  faculty = Faculty.find_by(name: fac_item)
  faculty = Faculty.create(name: fac_item) unless faculty

  ["応用理工学科","環境社会工学科","情報エレクトロニクス工学科","機械知能工学科"].each do |dep_item|
    dep = faculty.departments.find_by(name: dep_item)
    faculty.departments.create(name: dep_item) unless dep
  end
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
#銀行作成-------------------------------------------------------------------------------------------
["北洋銀行", "北海道銀行", "ゆうちょ銀行"].each do |bank|
  unless Bank.exists?(name: bank)
    Bank.create(name: bank)
  end
end

#User(1)作成---------------------------------------------------------------------------------
#user = User.find(1)
#user = User.create(id: 1,email: sample@eis.hokudai.ac.jp,password: password) unless user
#user_profile = UserProfile.find_by(user_id: 1)
#user_profile = UserProfile.create(user_id: 1,department_id: 2,school_year: 3,name: kenshiro) unless user_profile

#ノートサンプル作成----------------------------------------------------------------------------
#note = Note.find(1)
#note = Note.create(user_id: 1,description: "5月1日(第2回)の授業の板書です",price: 0,grade: B+,year: 2020,exhibitor_id: 1,department_id: 2,lecture_id: 158,educator_id: 4) unless note
#image = Image.find_by(note_id: 1)
#image = Image.create(note_id: 1,sequence: 1,image: 'ans-455804827.jpg')

