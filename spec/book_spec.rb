require '../book.rb'
require "../person.rb"

describe Book do
	let (:b1) { Book.new(title: "The Dark Night")}
	it { b1.should respond_to :title}
	it { b1.like?.should == false }
end

describe "a person can like a book" do
	let (:p1) { Person.new(first: "Tim", last: "Hickey")}
	let (:b1) { Book.new(title: "The Dark Night")}

	it "p1 likes b1" do
		p1.likes(b1)
		b1.like?.should == true
	end

	describe "book tracks who likes it" do
		before { p1.likes(b1) }
		it { b1.is_liked_by?(p1).should == true }
	end

	describe "book can have an author" do
		before { b1.author = p1 }
		it { b1.author.first.should == "Tim" }
	end

end