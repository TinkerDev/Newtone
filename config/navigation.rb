# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :hotels, I18n.t("menu.main"), root_url
    primary.item :about, I18n.t("menu.about"), about_url
    primary.item :presentation, I18n.t("menu.presentation"), 'https://docs.google.com/presentation/d/1lveF-PYY2Q87uDXKPFhMI5Xyh03KQ2AvEqXzkJCBNWo', :link => {:target => :_blank}
    primary.dom_class = 'nav navbar-nav'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end