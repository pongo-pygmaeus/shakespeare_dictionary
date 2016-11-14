class Work < ApplicationRecord
  has_many :words_works
  has_many :words, through: :words_works
end
