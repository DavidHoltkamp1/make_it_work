require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "methods" do
    it "contestant count" do
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
              years_of_experience: "2"
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

      expect(@project1.count_contestants).to eq(2)
    end
  end
  describe "methods" do
    it "contestant experience" do
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
              years_of_experience: "2"
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

      expect(@project1.contestant_experience).to eq(4)
    end
  end 
end
