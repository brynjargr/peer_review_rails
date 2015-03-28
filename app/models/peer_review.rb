class PeerReview < ActiveRecord::Base

  scope :same_person, ->(name) { where(name: name) }
  scope :before, ->(year, month) { where('(year < ?) OR (year = ? AND month < ?)', year, year, month) }
  scope :after, ->(year, month) { where('(year > ?) OR (year = ? AND month > ?)', year, year, month) }
  scope :time_descending, -> { order('year DESC, month DESC') }
  scope :time_ascending, -> { order('year ASC, month ASC') }


  def previous
    self.class.same_person(self.name).before(self.year, self.month).time_descending.first
  end

  def next
    self.class.same_person(self.name).after(self.year, self.month).time_ascending.first
  end
end
