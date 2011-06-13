require 'spec_helper'

describe MenuItem do
  #before {reset_database}
  describe "when configuring ordered_tree" do
    # After we run the tests, reset the ordered tree changes we may have made
    after { MenuItem.class_eval {
      ordered_tree # set ordered_tree with no args
      def scope_condition; "1"; end # this is the default scope condition in ordered_tree gem
    } }

    it "should allow overriding of ordered_tree's scope_condition" do
      MenuItem.class_eval do
        def scope_condition
          "site_id = #{site_id}"
        end
      end
      MenuItem.create(:site_id => 1)
      MenuItem.create(:site_id => 2)
      menu_item = MenuItem.create(:site_id => 1)
      menu_item.position.should == 2
    end

    it "should allow reconfiguration of ordered_tree" do
      MenuItem.class_eval do
        ordered_tree :scope => :site
      end
      MenuItem.create(:site_id => 3)
      MenuItem.create(:site_id => 4)
      menu_item = MenuItem.create(:site_id => 3)
      menu_item.position.should == 2
    end
  end

  describe "#label" do
    it "should return the database entry when it exists" do
      MenuItem.new(:label => "Samba").label.should == "Samba"
    end

    describe "when label field is nil" do
      describe "and there is a navigable model" do
        describe "and there is a specified field" do
          it "should default to the specified field in the navigable model" do
            navigable Category, :label => :nombre do
              c = Category.create :nombre => "Banana"
              nav_item = MenuItem.new(:navigable => c)
              nav_item.label.should == "Banana"
            end
          end
        end

        describe "and there is no specified field" do
          it "should return nil" do
            c = Category.create
            nav_item = MenuItem.new(:navigable => c)
            nav_item.label.should be_nil
          end
        end
      end
      
      describe "and there is no navigable model" do
        it "should return nil" do
          MenuItem.new.label.should == nil
        end
      end
    end
  end

  describe "#title," do
    describe "when the title field is not nil," do
      it "should return the value in the db" do
        MenuItem.new(:title => "Mambo").title.should == "Mambo"
      end
    end

    describe "when the title field is nil," do
      describe "and there is a navigable," do
        describe "and :title is set to a string," do
          it "should return the string" do
            navigable Category, :title => "Hola" do
              c = Category.create
              MenuItem.new(:navigable => c).title.should == "Hola"
            end
          end
        end

        describe "and :title is set to a Symbol," do
          it "should look for the db column and return the value" do
            navigable Category, :title => :nombre do
              c = Category.create :nombre => "Mi nombre"
              MenuItem.new(:navigable => c).title.should == "Mi nombre"
            end
          end
        end

        describe "and :title is set to a Proc," do
          it "should execute the proc and return the value" do
            navigable Category, :title => Proc.new {|x| "hi_#{x.name}"} do
              c = Category.create :name => "there"
              nav_item = MenuItem.new :navigable => c
              nav_item.title.should == "hi_there"
            end
          end
        end

        describe "and :title is not set," do
          it "should default to the value of the nav_item's link" do
            c = Category.create
            nav_item = MenuItem.new(:navigable => c)
            nav_item.should_receive(:label).once
            nav_item.title
          end
        end
      end
    end
  end

  describe "#link" do
    describe "when the link field is not nil," do
      it "should return the value" do
        MenuItem.new(:link => "/holy/moly").link.should == "/holy/moly"
      end
    end

    describe "when the link field is nil," do
      describe "and there is a nav_item," do
        it "should return the nav_item" do
          # by returning the nav_item we can leave it up to the renderer to convert it to a URL
          c = Category.create
          MenuItem.new(:navigable => c).link.should == c
        end
      end

      describe "and there is no nav_item," do
        it "should return nil" do
          MenuItem.new.link.should be_nil
        end
      end
    end
  end

  describe "#highlights_on," do
    describe "when the link field is not nil" do
      it "should return the value converted to regex" do
        MenuItem.new(:highlights_on => "holy").highlights_on.should == /holy/
      end
    end

    describe "when the link field is nil," do
      it "should return the same value as link" do
        c = Category.create
        nav_item = MenuItem.new(:navigable => c)
        nav_item.highlights_on.should == c
      end

      describe "and there is a navigable," do
        describe "and the :highlights_on option is set to a string," do
          it "should return that string" do
            navigable Category, :highlights_on => "foobar" do
              c = Category.create
              nav_item = MenuItem.new :navigable => c
              nav_item.highlights_on.should == "foobar"
            end
          end
        end

        describe "and the :highlights_on option is set to a regexp," do
          it "should return the regexp" do
            navigable Category, :highlights_on => /foobar/ do
              c = Category.create
              nav_item = MenuItem.new :navigable => c
              nav_item.highlights_on.should == /foobar/
            end
          end
        end

        describe "and the :highlights_on is set to a Proc," do
          it "should execute the Proc on the navigable item and return the value" do
            navigable Category, :highlights_on => Proc.new {|c| "hi_#{c.name}" } do
              c = Category.create :name => "there"
              nav_item = MenuItem.new :navigable => c
              nav_item.highlights_on.should == "hi_there"
            end
          end
        end

        describe "and the :highlights_on is not set," do
          it "should return the same value as the link" do
            c = Category.create
            nav_item = MenuItem.new(:navigable => c)
            nav_item.highlights_on.should == nav_item.link
          end
        end
      end

      describe "and there is no navigable," do
        it "should return nil" do
          MenuItem.new.link.should be_nil
        end
      end
    end

  end
end