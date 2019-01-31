FactoryBot.define do
  factory :point do
    transient do
      latitude { 53.3465781 }
      longitude  { -6.2717992 }
    end

    initialize_with { Point.new(latitude, longitude) }
  end
end
