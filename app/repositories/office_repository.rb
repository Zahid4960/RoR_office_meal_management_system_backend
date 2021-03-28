class OfficeRepository < BaseRepository

  require_relative '../models/office'

  def office_with_type(page, limit)
    if limit.to_i == -1
      query
    else
      query.paginate(page: page, :per_page => limit)
    end
  end

  def find_specific_office_with_type(id)
    query.find(id)
  end

  def query
    Office.select(
      "offices.id",
      "offices.office_name",
      "offices.office_address",
      "offices.office_contact",
      "offices.office_type_id",
      "office_types.type_name"
    ).joins(:office_type)
  end

end