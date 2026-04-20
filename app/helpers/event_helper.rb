module EventHelper
  def filters_active?(params)
    params.slice(:name, :start_date, :end_date, :user_id).values.any?(&:present?)
  end
end
