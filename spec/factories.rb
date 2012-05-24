FactoryGirl.define do 
	factory :user do
		name					"Michael Hearn"
		email					"michael.hearn@gmail.com"
		password				"testing"
		password_confirmation	"testing"
	end
end