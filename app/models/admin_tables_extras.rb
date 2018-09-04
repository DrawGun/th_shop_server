module AdminTablesExtras
  def money_column(column_name, args = {})
    column column_name, args.merge(class: 'col-money') do |o|
      if o.respond_to?(column_name)
        o.public_send(column_name).try(:format)
      else
        o.fetch(column_name).try(:format)
      end
    end
  end

  def money_row(column)
    row column.to_sym do |o|
      if o.respond_to?(column)
        o.public_send(column).try(:format)
      else
        o.fetch(column).try(:format)
      end
    end
  end

  def image_column(column, opts = {})
    column column do |object|
      image_tag(object.public_send(column).url, **opts) if object.public_send(column).present?
    end
  end

  def image_row(column, opts = {})
    row column do |object|
      image_tag(object.public_send(column).url, **opts) if object.public_send(column).present?
    end
  end

  def currencies_list
    %w(RUB USD EUR)
  end
end
