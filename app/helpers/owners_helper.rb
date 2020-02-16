module OwnersHelper

  def owner_name(owner)
    "#{owner.first_name} #{owner.last_name}"
  end
end
