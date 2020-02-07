require 'rails_helper'

RSpec.describe "I visit the contestants index page" do
  before :each do
    @project1 = Project.create({
          name: "Litfit",
          material: "Lamp shade"
      })
    @project2 = Project.create({
          name: "High Heels",
          material: "Silk"
      })

    @contestant1 = Contestant.create({
          name: "Mark Prada",
          age: "21",
          hometown: "Des Moines",
          years_of_experience: "2"
      })

    @contestant2 = Contestant.create({
          name: "Dennis Gucci",
          age: "25",
          hometown: "Pueblo",
          years_of_experience: "5"
      })
    @contestant3 = Contestant.create({
          name: "Louis vton",
          age: "28",
          hometown: "Cleveland",
          years_of_experience: "15"
      })
    @challenge1 = Challenge.create({
          theme: "Flamenco",
          project_budget: "1000"
      })

    @challenge2 = Challenge.create({
          theme: "WW2",
          project_budget: "500"
      })

    @challenge1.projects << [@project1]
    @challenge2.projects << [@project2]

    @contestant1.projects << [@project1, @project2]
    @contestant2.projects << [@project1]
    @contestant3.projects << [@project1, @project2]
  end

  it "I see list of names of contestants and their projects" do
    visit '/contestants'

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.projects.name)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.projects.name)
    expect(page).to have_content(@contestant3.name)
    expect(page).to have_content(@contestant3.projects.name)
  end
end
