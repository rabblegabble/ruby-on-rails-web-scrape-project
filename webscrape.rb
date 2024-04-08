require 'mechanize' # run the command <gem install package_name> to manually install dependencies
require 'nokogiri'

class Scrape

    def initialize
        mechanize = Mechanize.new
        page = mechanize.get('https://facts.osu.edu/statistical-summary')

        @parsed_page = Nokogiri::HTML(page.content)
    end

    def get_enrollment
        enrollment = @parsed_page.css('#accordion--item--65-1--collapse').css('tbody')
    end
    
    def get_academicStructure
        academic_structure = @parsed_page.css('#accordion--item--65-2--collapse').css('tbody')
    end

    def get_tuitionAndFees
        tuitionAndFees = @parsed_page.css('#accordion--item--65-3--collapse').css('tbody')
    end

    def get_employees
        employees = @parsed_page.css('#accordion--item--65-4--collapse').css('tbody')
    end

    def get_research
        research = @parsed_page.css('#accordion--item--65-5--collapse').css('tbody')
    end

    def get_endowment
        endowment = @parsed_page.css('#accordion--item--65-6--collapse').css('tbody')
    end

    def get_budget
        budget = @parsed_page.css('#accordion--item--65-7--collapse').css('tbody')
    end

    def get_fundRaising
        fund_raising = @parsed_page.css('#accordion--item--65-8--collapse').css('tbody')
    end

    def get_payroll
        payroll = @parsed_page.css('#accordion--item--65-9--collapse').css('tbody')
    end

    def get_acreage
        acreage = @parsed_page.css('#accordion--item--65-10--collapse').css('tbody')
    end

    def get_buildings
        buildings = @parsed_page.css('#accordion--item--65-11--collapse').css('tbody')
    end

    def get_administration
        administration = @parsed_page.css('#accordion--item--65-12--collapse').css('tbody')
    end

    def get_trustees
        trustees = @parsed_page.css('#accordion--item--65-13--collapse').css('tbody')
    end

    def get_historicalInformation
        historical_information = @parsed_page.css('#accordion--item--65-14--collapse').css('tbody')
    end
end