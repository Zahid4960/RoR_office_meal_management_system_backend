class DesignationRepository < BaseRepository

  require_relative '../models/designation'

  def designation_with_office(page, limit)
    if limit.to_i == -1
      query
    else
      query.paginate(page: page, :per_page => limit)
    end
  end

  def find_designation_with_office(id)
    query.find(id)
  end

  def query
    Designation.select(
      "designations.id as id",
      "designations.designation_name as designation_name",
      "designations.office_id as office_id",
      "offices.office_name"
    ).joins(:office)
  end

end