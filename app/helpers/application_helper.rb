module ApplicationHelper
    def bootstrap_class_for(flash_type)
      case flash_type.to_sym
      when :notice
        "alert-success" # 緑色
      when :alert
        "alert-danger"  # 赤色
      when :error
        "alert-warning" # 黄色
      else
        "alert-info"    # 青色
      end
    end
  end