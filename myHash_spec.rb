require_relative 'myHash.rb'
require 'active_support/core_ext/kernel/reporting'

describe MyHash do
	let(:myHash) {MyHash.new}

	describe "#initialize" do
        context "when default value has been specified" do
            it "uses default value when accessing on non-existing key" do
                default = "oops!"
                myHash = MyHash.new(default)
                expect(myHash[:a]).to eq default
            end
        end
        context "when default value wasn't specified" do
            it "returns nil when accessing on non-existing key" do
                myHash = MyHash.new
                expect(myHash[:a]).to eq nil
            end
        end
    end

	describe "#[key]" do
		before {
			myHash.push(:qwe, "rty")
			myHash.push(:a, 1)
		}

		it "return 'rty'" do
			expect(myHash[:qwe]).to eq "rty"
		end

		it "return 1" do
			expect(myHash[:a]).to eq 1
		end

		context "getting value by non-existing key" do
			it "return nil" do
				expect(myHash[:h]).to eq nil
			end
		end
	end

	describe "#[key] = value" do
		before {
			myHash.push(:qwe, "rty")
			myHash.push(:a, 1)
			myHash[:qwe] = "asd"
			myHash[:a] = 5
		}

		it "return 'asd'" do
			expect(myHash[:qwe]).to eq "asd"
		end

		it "return 5" do
			expect(myHash[:a]).to eq 5
		end

		context "setting value by non-existing key" do
			it "raises" do
				expect {myHash[:b] = "asd"}.to raise_error(ArgumentError, 'There\'s no such key in the hash')
	  		end
	  	end
	end

	describe "#push(key,value)" do
		context "pushing new pair of key and value" do
            it "return 1" do
                myHash.push(:a, 1)
                expect(myHash[:a]).to eq 1
            end
        end
	end

	describe "#to_s" do
		context "hash is empty" do
            it "puts {}" do
            	expect(STDOUT).to receive(:puts).with("{}")
            	myHash.to_s
            end
        end

        context "hash's not empty" do
        	before {
				myHash.push(:qwe, "rty")
				myHash.push(:a, 1)
			}
            it "prints each key and value pair" do 
                output = capture(:stdout) do
			    	myHash.to_s
			    end
			    expect(output).to include "qwe => rty\n"
			    expect(output).to include "a => 1\n"
            end
        end
	end

	describe "#print_keys" do
		context "hash is empty" do
            it "puts {}" do
            	expect(STDOUT).to receive(:puts).with("{}")
            	myHash.print_keys
            end
        end
        context "hash's not empty" do
			before {
				myHash.push(:qwe, "rty")
				myHash.push(:a, 1)
			}
			it "prints keys" do 
	            output = capture(:stdout) do
				   	myHash.print_keys
				end
				expect(output).to include "qwe\n"
				expect(output).to include "a\n"
	        end
	    end
	end

	describe "#print_values" do
		context "hash is empty" do
            it "puts {}" do
            	expect(STDOUT).to receive(:puts).with("{}")
            	myHash.print_values
            end
        end
        context "hash's not empty" do
			before {
				myHash.push(:qwe, "rty")
				myHash.push(:a, 1)
			}
			it "prints values" do 
	            output = capture(:stdout) do
				   	myHash.print_values
				end
				expect(output).to include "rty\n"
				expect(output).to include "1\n"
	        end
	    end
	end

	describe "#size" do
		context "hash is empty" do
            it "prints 0" do
            	expect(myHash.size).to eq 0
        	end
        end

        context "hash is not empty" do
			before {
				myHash.push(:qwe, "rty")
				myHash.push(:a, 1)
			}
	        it "prints number of pair of key and values" do 
				expect(myHash.size).to eq 2
	        end
	    end
	end

	describe "#delete_at" do
		before {
			myHash.push(:qwe, "rty")
			myHash.push(:a, 1)
		}

		context "key exists" do
			it "deletes" do
				myHash.delete_at(:qwe)
				expect(myHash[:qwe]).to eq nil
			end
		end

		context "key doesn't exists" do
			it "raises" do
				expect {myHash.delete_at("aaa")}.to raise_error(ArgumentError, 'There\'s no such key in the hash')
			end
		end
	end

end