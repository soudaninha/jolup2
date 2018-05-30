module ApplicationHelper
    def bootstrap_msg(msg)
        result = case msg
                    when 'sucess' then 'sucess'
                    when 'alert' then 'warning'
                    when 'error' then 'danger'
                    else 'info'
                 end
    end
end
