class Word < ApplicationRecord
  has_many :words_works
  has_many :works, through: :words_works

  #Adding comment for fun
end