class Item < ActiveRecord::Base
  attr_accessible :about, :brand_id, :hidden, :image, :in_stock, :original_name, :price, :russian_name, :sex_cd, :sex
  attr_accessible :family_id, :top_notes, :middle_notes, :lower_notes
  attr_accessible :index

  has_many :volumes
  belongs_to :family
  belongs_to :brand
  after_create :create_default_volumes
  after_create :create_index

  as_enum :sex, [:unisex, :male, :female], prefix: true
  mount_uploader :image, ItemImageUploader




  def create_default_volumes
    default_volumes = YAML.load_file "#{Rails.root}/config/default_volumes.yml"
    montale_volumes = default_volumes['montale']

    %w( v1 v2 v3).each do |v|
      volume = self.volumes.build
      volume.volume = montale_volumes[v]['volume']
      volume.price = montale_volumes[v]['price']
      volume.save
    end
  end


  def create_index
    self.index = self.original_name.downcase.grep(' ', '-').grep('&','-and-').grep('\'', '')
    self.save
  end
end
