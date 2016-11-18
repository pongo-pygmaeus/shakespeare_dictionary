class Work < ApplicationRecord
  has_many :words_works
  has_many :words, through: :words_works

  def interpolate_definition_links
    
  end
end
