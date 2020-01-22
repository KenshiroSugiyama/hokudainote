class Lecture < ApplicationRecord
    has_many :notes
    has_many :lectures_educators
    has_many :educators, through: :lectures_educators
    
    def self.import(file)
        csv_text = File.read(Rails.root + 'app/lecture1.csv', encoding: 'encoding')
        changed_csv_text = csv_text.gsub /^$\n/, ''
        @csv = CSV.parse(changed_csv_text, headers: true)
        @csv.each do |row|
            # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
            lecture = find_by(id: row["id"]) || new
            # CSVからデータを取得し、設定する
            lecture.attributes = row.to_hash.slice(*updatable_attributes)
            # 保存する
            lecture.save
        end
    end

    def self.updatable_attributes
        ["id", "name", "educator_id", "educators_educator_position_id"]
    end
end
