
module KnowsTheInterface
  class UserInterface
    include Capybara::DSL
    def add_minifigure(minifigure)
      Capybara.current_session.driver.header 'accept', 'text/html'
      Capybara.current_session.driver.header 'content-type', 'application/x-www-form-urlencoded'
      visit '/series/11'
      fill_in('minifigure_name', :with => minifigure.first["name"])
      click_button('add minifigure')
    end
  end

  def teller
    @teller ||= UserInterface.new
  end
end

World(KnowsTheInterface)
