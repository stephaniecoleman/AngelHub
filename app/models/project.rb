class Project < ActiveRecord::Base
  using SerializeSymbol

  before_save :initialize_status

  validates_presence_of :title, :repository, :description, :status
  validates :status, :inclusion => [ :requested, :in_progress, :finished ]

  serialize :status, Symbol

  def status= new_stat
    super(new_stat.to_sym)
  end
  
  private

    def initialize_status
      self.status = :requested
    end

end
