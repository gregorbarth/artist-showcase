RailsAdmin.config do |config|

  #############################################################
  #MSP You'll have to restart the server after config edit here
  #############################################################

  config.included_models = ["Asset", "Category", "ContentArea", "Page", "User"]

  config.models do
    list do
      sort_by :updated_at
    end
  end

  #############
  # Asset
  #############
  config.model Asset do
    edit do
      field :name
      field :description

      field :asset do
        label "File"
        thumb_method :thumb # for images. Will default to full size image, which might break the layout
                            # delete_method :delete_asset # actually not needed in this case: default is "delete_#{field_name}" if the object responds to it
      end
    end

    list do
      field :name
      field :description

      field :asset do
        formatted_value do # used in form views
          bindings[:view].tag(:img, {:src => bindings[:object].asset.url(:thumb)})
        end
        thumb_method :thumb # for images. Will default to full size image, which might break the layout
      end
      field :created_at
      field :updated_at
    end
  end

  #############
  # Page
  #############
  config.model Page do
    list do
      field :id
      field :name

      field :slug do
        formatted_value do
          bindings[:view].link_to value, "/#{value}"
        end
      end

      #field :tag_list do
      #  label "Tags"
      #end


      field :content_areas
      field :assets
      field :categories do
        #formatted_value do
        #  page = bindings[:object]
        #  page.categories.collect { |r| "MSP"+r.name }.join(', ')
        #end
      end

      field :created_at
      field :updated_at

    end

    show do
      field :id
      field :name
      field :slug

      #field :tag_list do
      #  label "Tags"
      #end

      # field :website_url do
      #   formatted_value do
      #     if value.blank?
      #       "EMPTY"
      #     else
      #       bindings[:view].link_to value, value
      #     end
      #   end
      # end

      field :content_areas
      field :assets, :has_and_belongs_to_many_association
      field :categories, :has_and_belongs_to_many_association

      field :created_at
      field :updated_at

    end

    edit do
      field :name
      field :slug

      #field :tag_list do
      #  label "Tags"
      #end
      #
      #fields_of_type :tag_list do
      #  partial 'cenatus_tag_list'
      #end

      field :parent_id, :enum do
        enum do
          Page.all.map{|p| [p.name, p.id]}
        end
      end

      field :content_areas
      field :assets, :has_and_belongs_to_many_association
      field :categories, :has_and_belongs_to_many_association

    end
  end


end