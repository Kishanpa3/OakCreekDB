class UserDatatable < ApplicationDatatable
  
private
  def data
    users.map do |user|
      [].tap do |column|
        column << user.id
        if params[:approved] === "false"
          column << user.approved
        else 
          column << user.admin
        end
        column << user.first_name
        column << user.last_name
        column << user.email
        column << user.can_view
        column << user.can_edit
        column << user.can_add
        column << user.can_delete
        column << user.created_at
      end
    end
  end

  def count
    if params[:approved] === "false"
      User.where("approved = ? AND confirmed_at IS NOT NULL", false).count
    else 
      User.where(approved: true).count
    end
  end

  def total_entries
    users.total_entries
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    search_string = []
    columns.each do |term|
      search_string << "lower(CAST(#{term} AS TEXT)) like lower(:search)"
    end
    
    if params[:approved] === "false"
      users = User.where("approved = ? AND confirmed_at IS NOT NULL", false)
    else 
      users = User.where(approved: true)
    end
    
    users = users.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    users = users.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  end

  def columns
    if params[:approved] === "false"
      %w(id approved first_name last_name email can_view can_edit can_add can_delete created_at)
    else
      %w(id admin first_name last_name email can_view can_edit can_add can_delete created_at)
    end
  end
end