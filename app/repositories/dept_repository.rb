class DeptRepository < BaseRepository

  require_relative '../models/department'

  def dept_with_office(page, limit)
    if limit.to_i == -1
      query
    else
      query.paginate(page: page, :per_page => limit)
    end
  end

  def find_by_id_with_office(id)
    query.find(id)
  end

  def query
    Department.select(
      "departments.id as id",
      "departments.department_name as department_name",
      "departments.office_id as office_id",
      "offices.office_name"
    ).joins(:office)
  end
end