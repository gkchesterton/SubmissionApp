class Assignment < ActiveRecord::Base
  attr_accessible :info, :name

  has_many :assignment_course_memberships
  has_many :courses, :through => :assignment_course_memberships,
                         :source => :course

end