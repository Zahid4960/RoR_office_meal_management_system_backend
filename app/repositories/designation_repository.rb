class DesignationRepository < BaseRepository

  require_relative '../models/designation'

  def designation_with_office
    query.active
  end

  def find_designation_with_office(id)
    query.active.find(id)
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