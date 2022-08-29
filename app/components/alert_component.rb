# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def self.rails_flash_to_kind(flash)
    return :info if flash === :notice
    return :danger if flash === :alert
  end

  # @param [Symbol] kind one of the following, `:info`, `:warning`, `:success`, `:danger`
  def initialize(kind: :info)
    @kind = kind
  end

  private

  def kind
    return @kind if %i[info danger warning success].include? @kind

    :info
  end

  def color
    case kind
    when :info
      'text-blue-700 bg-blue-100 dark:bg-blue-200 dark:text-blue-800'
    when :warning
      'text-yellow-700 bg-yellow-100 dark:bg-yellow-200 dark:text-yellow-800'
    when :success
      'text-green-700 bg-green-100 dark:bg-green-200 dark:text-green-800'
    when :danger
      'text-red-700 bg-red-100 dark:bg-red-200 dark:text-red-800'
    else
      'text-neutral-700 bg-neutral-100 dark:bg-neutral-200 dark:text-neutral-800'
    end
  end
end
