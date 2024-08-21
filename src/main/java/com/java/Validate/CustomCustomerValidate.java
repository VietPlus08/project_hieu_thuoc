package com.java.Validate;

import com.java.model.Customer;
import com.java.repo.CustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class CustomCustomerValidate implements Validator {

    @Autowired
    CustomerRepo customerRepo;

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

    @Override
    public void validate(Object obj, Errors errors) {
        if((obj instanceof Customer)){
            Customer customer = (Customer) obj;

            // --> List<Customer>
            Customer dbCustomer = customerRepo.findByPhone(customer.getPhone());

            if (dbCustomer != null){
                errors.rejectValue("phone","phone","Sdt da tonn tai");
            }
        }

    }
}
