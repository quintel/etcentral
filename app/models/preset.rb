class Preset < YmlReadOnlyRecord

  attr_accessor :key, :name, :function, :organization, :scenario_id, :event

  def has_scenario?
    !scenario_id.blank?
  end

  def self.all_for_event(event)
    all.select{ |p| p.event == event }
  end

end
