# RailsAdmin config file. Generated on April 03, 2012 12:43
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_staff } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, Staff

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Staff

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Ghana Trains', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  config.included_models = %w[Train Ticket Customer Route Schedule ScheduleStop Stop Feedback]
  #config.excluded_models = %w[ScheduleStop]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  config.model Customer do
    create do
      include_all_fields
      exclude_fields :tickets, :feedbacks, :app_key
    end
    update do
      exclude_fields :tickets, :feedbacks
      field :app_key do
        read_only true
      end
    end
  end

  config.model Route do
    edit do
      include_all_fields
      exclude_fields :schedules, :schedule_stops
    end
  end

  config.model Schedule do
    object_label_method do
      :schedule_object_label
    end
    edit do
      include_all_fields
      exclude_fields :tickets
    end
  end

  config.model Train do
    object_label_method do
      :train_object_label
    end
    edit do
      include_all_fields
      exclude_fields :schedules
    end
  end

  config.model ScheduleStop do
    visible false
    object_label_method do
      :stop_object_label
    end
  end

  config.model Ticket do
    object_label_method do
      :ticket_object_label
    end
    create do
      include_all_fields
      exclude_fields :number, :status, :amount
    end
    update do
      include_all_fields
      field :number do
        read_only true
      end
      field :amount do
        read_only true
      end
      field :schedule do
        read_only true
      end
      field :customer do
        read_only true
      end
    end
  end

  config.model Feedback do
    object_label_method do
      :feedback_object_label
    end
    create do
      include_all_fields
      exclude_fields :status, :feedback_id
    end
    update do
      include_all_fields
      field :feedback_id do
        read_only true
      end
      field :customer do
        read_only true
      end
    end
  end

  def feedback_object_label
    "#{self.status}: #{self.created_at}" unless self.nil?
  end

  def schedule_object_label
    "#{self.departs_at.strftime("%I:%M%P")} #{self.route.name}" unless self.route.nil?
  end

  def stop_object_label
    "#{self.arrives_at.strftime("%I:%M%P")}" unless self.stop.nil?
  end

  def train_object_label
    self.number unless self.nil?
  end

  def ticket_object_label
    self.number unless self.nil?
  end

end
