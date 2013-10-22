# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :hotels, I18n.t("menu.main"), root_url

    primary.dom_class = 'nav navbar-nav'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end