require "calculator"

describe Calculator do

  let(:calc){ Calculator.new }

  describe "#add" do
    it "returns an integer" do
      expect(calc.add 1, 1).to be_an Integer
    end

    context "when adding zero to an integer" do
      it "returns the integer" do
        expect(calc.add 4, 0).to eq 4
      end
    end

    it "is not dependent on the operation order" do
      expect(calc.add 1, 2).to eq calc.add(2, 1)
    end

    it "accepts more than 2 arguments" do
      expect(calc.add 2, 4, 3).to eq 9
    end
  end
  
  describe "#subtract" do
    it "returns an integer" do
      expect(calc.subtract 1, 1).to be_an Integer
    end
    
    it "is dependent on oeration order" do
      expect(calc.subtract 1, 2).not_to eq calc.subtract(2, 1)
    end
    
    context "when subtracting zero from an integer" do
      it "returns the integer" do
        expect(calc.subtract 4, 0).to eq 4
      end
    end
    
    context "when subtracting an integer from itself" do
      it "returns zero" do
        expect(calc.subtract 5, 5).to eq 0
      end
    end
    
    it "accepts more than 2 arguments" do
      expect(calc.subtract 10, 4, 3).to eq 3
    end   
   end
  
  describe "#multiply" do
    it "returns an integer" do
      expect(calc.multiply 1, 1).to be_an Integer
    end
    
    it "is not dependent on the operation order" do
      expect(calc.multiply 1, 2).to eq calc.multiply(2, 1)
    end
    
    context "when multiplying an integer by one" do
      it "returns the integer" do
        expect(calc.multiply 9, 1).to eq 9
      end
    end
    
    context "when multiplyingan integer by zero" do
      it "returns zero" do
        expect(calc.multiply 3, 0).to eq 0
      end
    end
    
    it "accepts more than 2 arguments" do
      expect(calc.multiply 10, 4, 2).to eq 80
    end   
  end
  
  describe "#divide" do
    it "returns an integer" do
      expect(calc.divide 5, 3).to be_an Integer
    end
    
    it "is dependent on oeration order" do
      expect(calc.divide 1, 2).not_to eq calc.divide(2, 1)
    end
    
    context "when dividing an integer by one" do
      it "returns the integer" do
        expect(calc.divide 9, 1).to eq 9
      end
    end
    
    context "when dividing zero by an integer" do
      it "returns zero" do
        expect(calc.divide 0, 8).to eq 0
      end
    end
    
    context "when dividing an integer by zero" do
      it "returns an error" do
        expect { calc.divide 4, 0 }.to raise_error(ZeroDivisionError)
      end
    end
    
    it "accepts more than 2 arguments" do
      expect(calc.divide 20, 2, 5).to eq 2
    end    
    
  end  
end
