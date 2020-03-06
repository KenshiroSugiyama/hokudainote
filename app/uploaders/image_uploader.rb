class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file



  process :resize_to_limit => [700, 700]

  #JPGで保存
    #process :convert => 'jpg'
  
  
  # jpg,jpeg,gif,pngのみ
    def extension_white_list
      %w(pdf)
    end
  
  #ファイル名を変更し拡張子を同じにする
    #def filename
      #super.chomp(File.extname(super)) + '.pdf' 
    #end
  
  #日付で保存
    #def filename
      #if original_filename.present?
        #time = Time.now
        #name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
        #name.downcase
      #end
    #end
end
