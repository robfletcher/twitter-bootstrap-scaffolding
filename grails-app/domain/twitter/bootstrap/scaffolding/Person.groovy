package twitter.bootstrap.scaffolding

import org.joda.time.LocalDate

class Person {
	
	String firstName
	String lastName
	String email
	LocalDate dateOfBirth
	Address address
	
	static embedded = ["address"]

    static constraints = {
		firstName blank: false
		lastName blank: false
		email nullable: true, email: true
		dateOfBirth nullable: true
    }
}

