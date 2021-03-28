class DayService

  require_relative '../repositories/day_repository'
  require_relative '../models/day'

  @@model = Day

  def index(page, limit)
    day_repo.get_all(@@model, page, limit)
  end

  private
  def day_repo
    @repo = DayRepository.new
  end
end