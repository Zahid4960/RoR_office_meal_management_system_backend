class OfficeService

  require_relative '../repositories/office_repository'
  require_relative '../models/office'

  @@model = Office

  def index(page, limit)
    office_repo.office_with_type(page, limit)
  end

  def create(payload)
    office_repo.save_data(@@model, payload)
  end

  def show(id)
    office_repo.find_specific_office_with_type(id)
  end

  def update(id, payload)
    office_repo.update_data(@@model, id, payload)
  end

  def destroy(id)
    office_repo.delete_data(@@model, id)
  end

  def last_inserted
    office_repo.last_inserted(@@model)
  end

  private
  def office_repo
    @repo = OfficeRepository.new
  end
end