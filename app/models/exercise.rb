class Exercise < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :dependencies, class_name: "Exercise", foreign_key: "dependency_id"
end
