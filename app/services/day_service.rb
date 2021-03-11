class DayService

  require_relative '../repositories/day_repository'
  require_relative '../models/day'

  @@model = Day

  def index
    day_repo.get_all(@@model)
  end

  def create(payload)
    day_repo.save_data(@@model, payload)
  end

  def show(id)
    day_repo.find_by_id(@@model, id)
  end

  def update(id, payload)
    day_repo.update_data(@@model, id, payload)
  end

  def destroy(id)
    day_repo.delete_data(@@model, id)
  end

  def last_inserted
    day_repo.last_inserted(@@model)
  end

  private
  def day_repo
    @repo = DayRepository.new
  end
end