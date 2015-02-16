require 'spec_helper'

describe "Creating todo lists" do
	it "displays error when title is too short" do 
		expect (TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")
	
		fill_in "Title", with: "Hi"
		fill_in "Description", with: "Here's what list contains."
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)


		visit "/todo_lists"
		expect(page).to_not have_content ("this is blah blah bullshit")

	end

end