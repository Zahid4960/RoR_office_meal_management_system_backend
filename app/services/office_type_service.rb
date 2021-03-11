class OfficeTypeService

  require_relative '../repositories/office_type_repository'
  require_relative '../models/office_type'

  @@model = OfficeType

  def index
      office_type_repo.get_all(@@model)
  end

  def create(payload)
    office_type_repo.save_data(@@model, payload)
  end

  def show(id)
    office_type_repo.find_by_id(@@model, id)
  end

  def update(id, payload)
    office_type_repo.update_data(@@model, id, payload)
  end

  def destroy(id)
    office_type_repo.delete_data(@@model, id)
  end

  def last_inserted
    office_type_repo.last_inserted(@@model)
  end

  private
  def office_type_repo
    @repo = OfficeTypeRepository.new
  end

end