require 'rails_helper'

RSpec.describe "I visit a projects show page" do
  before :each do
    @project1 = Project.create({
          name: "Litfit",
          material: "Lamp shade"
      })
    @project2 = Project.create({
          name: "High Heels",
          material: "Silk"
      })

    @challenge1 = Challenge.create({
          theme: "Flamenco",
          project_budget: "1000"
      })

    @challenge2 = Challenge.create({
          theme: "WW2",
          project_budget: "500"
      })
      @contestant1 = Contestant.create({
            name: "Mark Prada",
            age: "21",
            hometown: "Des Moines",
            years_of_experience: "3"
        })

      @contestant2 = Contestant.create({
            name: "Dennis Gucci",
            age: "25",
            hometown: "Pueblo",
            years_of_experience: "5"
        })

    @challenge1.projects << [@project1]
    @challenge2.projects << [@project2]

    @contestant1.projects << [@project1, @project2]
    @contestant2.projects << [@project1]
  end

  it "shows project name and material and theme of challenge" do
    visit "/projects/#{@project1.id}"

  expect(page).to have_content(@project1.name)
  expect(page).to have_content(@project1.material)
  expect(page).to have_content(@challenge1.theme)
  end

  it "I see the number of contestants on a project" do
    visit "/projects/#{@project1.id}"

    expect(page).to have_content(@project1.name)
    expect(page).to have_content(@project1.material)
    expect(page).to have_content(@challenge1.theme)
    expect(page).to have_content("Number of Contestants: 2")
  end
  it "I see the average age on a project" do
    visit "/projects/#{@project1.id}"

    expect(page).to have_content(@project1.name)
    expect(page).to have_content(@project1.material)
    expect(page).to have_content(@challenge1.theme)
    expect(page).to have_content("Number of Contestants: 2")
    expect(page).to have_content("Average Contestant Experience: 4")
  end 
end
