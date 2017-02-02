require 'tdd.rb'
require 'set'


describe "#my_uniq" do
  let(:arr) { [1, 2, 1, 3, 3] }
  subject(:uniq_arr) { my_uniq(arr) }

  it "only returns unique elements" do
    expect(uniq_arr).to eq(arr.uniq)
  end

  it "has no duplicates" do
    expect(uniq_arr.count(3) == 1).to be(true)
    expect(uniq_arr.count(1) == 1).to be(true)
  end

  it "elements are in the same order as oringinal array" do
    expect([uniq_arr.first]).to_not include(2, 3)
  end

end

describe "Array#two_sum" do
  let(:arr) { [-1, 0, 2, 1, -2, 1] }
  subject(:pairs) { arr.two_sum }

  it "all returned pairs sum to zero" do
    expect(pairs).to include([0, 3], [0, 5], [2, 4])
  end

  it "sorted descending with first index then second index" do
    expect(pairs).to eq([[0, 3], [0, 5], [2, 4]])
  end

  it "no duplicate indices are returned" do
    uniques = pairs.map(&:to_set)
    uniques.uniq!
    expect(uniques.length).to eq(pairs.length)
  end
end

describe '#my_transpose' do
  let(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  subject(:transposed) { my_transpose(matrix) }

  it "transposes 3x3 matrix" do
    answer = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    expect(transposed).to eq(answer)
  end

  it "does not modify the oringinal array" do
    expect(transposed).to_not eq(matrix)
  end

  it "raise an error if input is not an array" do
    expect { my_transpose(0) }.to raise_error(ArgumentError)
  end

end


describe '#stock_picker' do

  let(:profitables) { [3, 7, 9, 1, 5, 8] }
  let(:lossy) { [20, 9, 7, 5, 4, 2] }

  it "raise an error if input is not an array" do
    expect { stock_picker(0) }.to raise_error(ArgumentError)
  end

  it "Finds the correct days to buy and sell if profit is possible" do
    expect(stock_picker(profitables)).to eq([3, 5])
  end

  it "Finds the least loss days if only losses are possible" do
    expect(stock_picker(lossy)).to eq([3, 4])
  end

  it "Does not rely on the maximum value" do
    expect(stock_picker(profitables)).to_not include(2)
  end

  it "Does not rely on the minimum value" do
    expect(stock_picker(lossy)).to_not include(5)
  end


end
