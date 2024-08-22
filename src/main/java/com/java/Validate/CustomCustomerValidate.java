package com.java.Validate;

import com.java.model.Customer;
import com.java.repo.CustomerRepo;
import com.java.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.List;

@Component
public class CustomCustomerValidate implements Validator {

    @Autowired
    CustomerRepo customerRepo;

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

//    @Autowired
//    private CustomerService customerService;

    @Override
    public void validate(Object obj, Errors errors) {

        if ((obj instanceof Customer)) {
            Customer customer = (Customer) obj; // ép kiểu về customer
            int dem = 0;
            List<Customer> customerList = customerRepo.findAll();
            // --> List<Customer>
            for (Customer item : customerList) {
                if (item.getPhone() != null) {
                    if (item.getPhone().equals(customer.getPhone())) {
                        dem = dem + 1;
                    }
                }
            }
//            Customer dbCustomer = customerRepo.findByPhone(customer.getPhone()); // kiểm tra db đã có phone chưa
            if (customer.getPhone() == null || customer.getPhone().isEmpty()) {
                errors.rejectValue("phone", "empty", "empty");
            } else if (!customer.getPhone().matches("^(09|03)[0-9]{8}$")) {
                errors.rejectValue("phone", "empty", "Vui lòng nhập đúng định dạng");
            } else if (dem != 0) {
                errors.rejectValue("phone", "phone is exist", "Sdt da tonn tai");
            }


            String name = customer.getName();
            if (name == null || name.isEmpty()) {
                errors.rejectValue("name", "empty", "empty");
            } else if (name.length() < 5 || name.length() > 10) {
                errors.rejectValue("name", "name length", "Chiều dài phải lớn hơn 5");
            }
        }
    }

}