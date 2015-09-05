# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |home_primary|
    home_primary.item :home, 'Home', '/' do |primary|
      primary.item :about_our_club, 'About Our Club', '/show/about_our_club' do |sub_nav|
        sub_nav.item :history, 'History', '/show/history'
        sub_nav.item :goal_objectives, 'Goal and Objectives', '/show/goal_objectives'
        sub_nav.item :leadership, 'Club Leadership', '/leaders/show'
        sub_nav.item :members, 'Club Members', '/members/show'
        sub_nav.item :meetings, 'Meetings', '/show/meetings'
        sub_nav.item :district_24_c, 'District 24-C', '/show/district_24_c' do |sub_sub_nav|
          sub_sub_nav.item :elkton_lions_club, 'Elkton Lions Club', '/show/elkton_lions_club'
          sub_sub_nav.item :broadway_lions_club, 'Broadway Lions Club', '/show/broadway_lions_club'
          sub_sub_nav.item :harrisonburg_lions_club, 'Harrisonburg Lions Club', '/show/harrisonburg_lions_club'
          sub_sub_nav.item :new_market_lions_club, 'New Market Lions Club', '/show/new_market_lions_club'
          sub_sub_nav.item :shenandoah_lions_club, 'Shenandoah Lions Club', '/show/shenandoah_lions_club'
          sub_sub_nav.item :timberville_lions_club, 'Timberville Lions Club', '/show/timberville_lions_club'
          sub_sub_nav.item :weyers_cave_lions_club, 'Weyers Cave Lions Club', '/show/weyers_cave_lions_club'
        end
      end
      primary.item :about_our_service, 'About Our Service', '/show/about_our_service' do |sub_nav|
        sub_nav.item :our_foundation, 'Our Foundation', '/show/our_foundation' do |sub_sub_nav|
          sub_sub_nav.item :lomfi_officers, 'LOMFI Officers and Directors', '/officers/show'
        end
        sub_nav.item :service_work, 'Service Work', '/show/service_work' do |sub_sub_nav|
          sub_sub_nav.item :safety_town, 'Safety Town', '/show/safety_town'
          sub_sub_nav.item :christmas_in_january, 'Christmas in January', '/show/christmas_in_january'
          sub_sub_nav.item :big_brothers_big_sisters_of_harrisonburg_rockingham_county, 'Big Brothers Big Sisters of Harrisonburg-Rockingham County', '/show/big_brothers_big_sisters_of_harrisonburg_rockingham_county'
          sub_sub_nav.item :valley_voice, 'Valley Voice', '/show/valley_voice'
          sub_sub_nav.item :sight_hearing_mobile_screening_unit, 'Sight & Hearing Mobile Screening Unit', '/show/sight_hearing_mobile_screening_unit'
          sub_sub_nav.item :eyeglass_recycling, 'Eyeglass Recycling', '/show/eyeglass_recycling'
        end
        sub_nav.item :fundraising_activities, 'Fundraising Activities', '/show/fundraising_activities' do |sub_sub_nav|
          sub_sub_nav.item :lomfi_bingo, 'LOMFI Bingo', '/show/lomfi_bingo'
          sub_sub_nav.item :lomfi_annual_charity_golf_tournament, 'LOMFI Annual Charity Golf Tournament', '/show/lomfi_annual_charity_golf_tournament' do |sub_sub_sub_nav|
            sub_sub_sub_nav.item :anual_massanutten_lions_club_charity_golf_tournament_details, 'Tournament Details', '/show/anual_massanutten_lions_club_charity_golf_tournament_details'
          end
          #sub_sub_nav.item :massanutten_lions_club_annual_charity_cruise_in, 'Massanutten Lions Club Annual Charity Cruise In', '/show/massanutten_lions_club_annual_charity_cruise_in'
          sub_sub_nav.item :massanutten_lions_club_raffle_of_lovf_tickets, 'Massanutten Lions Club Raffle of LOVF Tickets', '/show/massanutten_lions_club_raffle_of_lovf_tickets'
          sub_sub_nav.item :massanutten_lions_club_ski_concessions, 'Massanutten Lions Club Ski Concessions', '/show/massanutten_lions_club_ski_concessions'
          sub_sub_nav.item :massanutten_lions_club_recycling_program, 'Massanutten Lions Club Recycling Program', '/show/massanutten_lions_club_recycling_program'
        end


        sub_nav.item :charities_supported, 'Charities Supported', '/show/charities_supported' do |sub_sub_nav|
          sub_sub_nav.item :charities_christmas_in_january, 'Christmas In January', '/show/charities_christmas_in_january'
          sub_sub_nav.item :massanutten_lions_club_james_martin_memorial_scholarship, 'Massanutten Lions Club James Martin Memorial Scholarship', '/show/massanutten_lions_club_james_martin_memorial_scholarship'
          sub_sub_nav.item :blue_ridge_food_bank, 'Blue Ridge Food Bank', '/show/blue_ridge_food_bank'
          sub_sub_nav.item :elkton_area_united_services, 'Elkton Area United Services', '/show/elkton_area_united_services'
          sub_sub_nav.item :harrisonburg_rockingham_free_clinic, 'Harrisonburg-Rockingham Free Clinic', '/show/harrisonburg_rockingham_free_clinic'
          sub_sub_nav.item :harrisonburg_rockingham_free_dental_clinic, 'Harrisonburg-Rockingham Free Dental Clinic', '/show/harrisonburg_rockingham_free_dental_clinic'
          sub_sub_nav.item :project_healing_waters, 'Project Healing Waters', '/show/project_healing_waters'
          sub_sub_nav.item :elkton_family_childrens_medical_clinic, 'Elkton Family & Children’s Medical Clinic', '/show/elkton_family_childrens_medical_clinic'
          sub_sub_nav.item :healthy_families_of_the_blue_ridge, 'Healthy Families of the Blue Ridge', '/show/healthy_families_of_the_blue_ridge'
          sub_sub_nav.item :lions_clubs_international_sight_first_II, 'Lions Clubs International Sight First II', '/show/lions_clubs_international_sight_first_II'
          sub_sub_nav.item :district_24_c_sight_and_hearing_mobile_screening_unit, 'District 24-C Sight and Hearing Mobile Screening Unit', '/show/district_24_c_sight_and_hearing_mobile_screening_unit'
          sub_sub_nav.item :leader_dogs_for_the_blind, 'Leader Dogs for the Blind', '/show/leader_dogs_for_the_blind'
          sub_sub_nav.item :lions_sight_foundation_of_virginia, 'Lions Sight Foundation of Virginia', '/show/lions_sight_foundation_of_virginia'
          sub_sub_nav.item :va_lions_hearing_foundation_research_center, 'VA Lions Hearing Foundation & Research Center', '/show/va_lions_hearing_foundation_research_center'
          sub_sub_nav.item :united_way_way_to_go, 'United Way — Way to Go', '/show/united_way_way_to_go'
          sub_sub_nav.item :massanutten_lions_club_eye_and_hearing_exams, 'Massanutten Lions Club Eye and Hearing Exams', '/show/massanutten_lions_club_eye_and_hearing_exams'
          sub_sub_nav.item :peace_poster_contest, 'Peace Poster Contest', '/show/peace_poster_contest'
          sub_sub_nav.item :elementary_school_bookmark_project, 'Elementary School Bookmark Project', '/show/elementary_school_bookmark_project'
          sub_sub_nav.item :community_service_award, 'Community Service Award', '/show/community_service_award'
        end
        sub_nav.item :make_a_donation, 'Make A Donation', '/show/make_a_donation'
        sub_nav.item :applying_for_a_grant, 'Applying For A Grant', '/show/applying_for_a_grant'


      end
      primary.item :lions_world, 'Lions World', '/show/lions_world' do |sub_nav|

        sub_nav.item :lci_history, 'LCI History', '/show/lci_history'
        sub_nav.item :lci_mission_and_purposes, 'LCI Mission & Purposes', '/show/lci_mission_and_purposes'
        sub_nav.item :lci_code_of_ethics, 'LCI Code of Ethics', '/show/lci_code_of_ethics'
        sub_nav.item :helen_kellers_message, 'Helen Keller’s Message', '/show/helen_kellers_message'

      end
      primary.item :news_and_information, 'News And Information', '/show/news_and_information' do |sub_nav|
        sub_nav.item :club_newsletters, 'Club Newsletters', '/newsletters/index' do |sub_sub_nav|
          sub_sub_nav.item :archives, 'Archive', '/show/archive_of_newsletters' do |sub_sub_sub_nav|
            newsletters=Newsletter.order('newsletters.period DESC').where(:visible => true).offset(1)
            newsletters.each do |newsletter|
              sub_sub_sub_nav.item :"#{newsletter.period}", "Newsletter #{newsletter.period.strftime('%B %Y')}", "/newsletters/archive/#{newsletter.id}"
            end
          end
        end
        #sub_nav.item :newsroom, 'Newsroom', '/show/newsroom'
        sub_nav.item :conferences_and_forms, 'Forms', '/show/conferences_and_forms'
        sub_nav.item :how_to_become_a_club_member, 'Membership', '/show/how_to_become_a_club_member'
        sub_nav.item :faq, 'FAQ', '/show/faq'
        sub_nav.item :helpful_links, 'Helpful Links', '/show/helpful_links'
      end

      primary.item :for_club_members, 'For Club Members', '/show/for_club_members' do |sub_nav|
        sub_nav.item :calendar, 'Calendar', '/calendar'
        sub_nav.item :bingo_schedule, 'Bingo Schedule', '/show/bingo_schedule'
        #sub_nav.item :project_read_schedule, 'Project Read Schedule', '/show/project_read_schedule'
        sub_nav.item :phone_book, 'Phone Book', '/phone_book/show', :if => Proc.new { user_signed_in? }
        sub_nav.item :budget, 'Budget', '/show/budget', :if => Proc.new { user_signed_in? }
      end


      primary.item :contact_us, 'Contact Us', '/contacts/contact_us' do |sub_nav|
        sub_nav.item :club_president, 'Club President', '/contacts/president'
        sub_nav.item :webmaster, 'Webmaster', '/contacts/webmaster'
        # sub_nav.item :feedback, 'Feedback', '/contacts/feedback'

        #
        #subjects ||= []
        #subjects.each do |subject|
        #  subject.name
        #  subject.newsletters.visible.sorted.each do |page|
        #    link_to_unless_current(page.name, :action => 'show', :id => page.permalink)
        #  end
        #end

      end

      #primary.dom_id = 'top_navigation'
      primary.dom_class = 'nav'
      # You can turn off auto highlighting for a specific level
      # primary.auto_highlight = false
    end
  end


  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  # navigation.items do |primary|
  # Add an item to the primary navigation. The following params apply:
  # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
  # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
  # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
  # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
  #           some special options that can be set:
  #           :if - Specifies a proc to call to determine if the item should
  #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
  #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
  #           :unless - Specifies a proc to call to determine if the item should not
  #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
  #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
  #           :method - Specifies the http-method for the generated link - default is :get.
  #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
  #                            when the item should be highlighted, you can set a regexp which is matched
  #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>.
  #
  # primary.item :key_1, 'name', url, options

  # Add an item which has a sub navigation (same params, but with block)
  # primary.item :key_2, 'name', url, options do |sub_nav|
  # Add an item to the sub navigation (same params again)
  #     sub_nav.item :key_2_1, 'name', url, options
  #    end

  # You can also specify a condition-proc that needs to be fullfilled to display an item.
  # Conditions are part of the options. They are evaluated in the context of the views,
  # thus you can use all the methods and vars you have available in the views.
  #   primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
  #   primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

  # you can also specify a css id or class to attach to this particular level
  # works for all levels of the menu
  # primary.dom_id = 'menu-id'
  # primary.dom_class = 'menu-class'

  # You can turn off auto highlighting for a specific level
  # primary.auto_highlight = false

  #  end

end
