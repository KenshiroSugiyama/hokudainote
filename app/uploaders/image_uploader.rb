class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  def store_dir
    "hokudainote-image/#{model.id}"
  end

  process resize_to_fit: [400, 300]

  #JPGで保存
    #process :convert => 'jpg'
  
  
  # jpg,jpeg,gif,pngのみ
    def extension_white_list
      %w(jpg jpeg)
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
