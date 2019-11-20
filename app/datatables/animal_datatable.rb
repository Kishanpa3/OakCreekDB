class AnimalDatatable < ApplicationDatatable
  
private
  def data
    animals.map do |animal|
      [].tap do |column|
        column << link_to(animal.tag, "/animals/#{animal.id}")
        column << link_to(animal.name, "/animals/#{animal.id}")
        column << link_to(animal.common_name, "/animals/#{animal.id}")
        column << link_to(animal.habitat_num, "/animals/#{animal.id}")
      end
    end
  end

  def count
    Animal.count
  end

  def total_entries
    animals.total_entries
  end

  def animals
    @animals ||= fetch_animals
  end

  def fetch_animals
    search_string = []
    columns.each do |term|
      search_string << "lower(CAST(#{term} AS TEXT)) like lower(:search)"
    end

    animals = Animal.order("#{sort_column} #{sort_direction}")
    animals = animals.page(page).per_page(per_page)
    animals = animals.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    %w(tag name common_name habitat_num)
  end
end