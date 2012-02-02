package twitter.bootstrap.scaffolding

class Address {

	String address1
	String address2
	String city
	String postCode
	
	@Override
	String toString() {
		[address1, address2, city, postCode].findAll { it }.join(', ')
	}

}
