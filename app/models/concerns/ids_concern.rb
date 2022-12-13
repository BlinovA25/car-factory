# frozen_string_literal: true

# IDs module allows you to use all ancestors methods
module IdsConcern
  extend ActiveSupport::Concern

  class_methods do
    def next_id
      ActiveRecord::Base.connection.execute("select last_value from #{table_name}_id_seq").first["last_value"].to_i
    end
  end
end
