// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.crmco.crm.controller;

import com.crmco.crm.controller.CustomerController;
import com.crmco.crm.domain.Customer;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CustomerController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CustomerController.create(@Valid Customer customer, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, customer);
            return "customers/create";
        }
        uiModel.asMap().clear();
        customer.persist();
        return "redirect:/customers/" + encodeUrlPathSegment(customer.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CustomerController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Customer());
        return "customers/create";
    }
    
    @RequestMapping(value = "/{id_}", produces = "text/html")
    public String CustomerController.show(@PathVariable("id_") Long id_, Model uiModel) {
        uiModel.addAttribute("customer", Customer.findCustomer(id_));
        uiModel.addAttribute("itemId", id_);
        return "customers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CustomerController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("customers", Customer.findCustomerEntries(firstResult, sizeNo));
            float nrOfPages = (float) Customer.countCustomers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("customers", Customer.findAllCustomers());
        }
        return "customers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CustomerController.update(@Valid Customer customer, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, customer);
            return "customers/update";
        }
        uiModel.asMap().clear();
        customer.merge();
        return "redirect:/customers/" + encodeUrlPathSegment(customer.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id_}", params = "form", produces = "text/html")
    public String CustomerController.updateForm(@PathVariable("id_") Long id_, Model uiModel) {
        populateEditForm(uiModel, Customer.findCustomer(id_));
        return "customers/update";
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, produces = "text/html")
    public String CustomerController.delete(@PathVariable("id_") Long id_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Customer customer = Customer.findCustomer(id_);
        customer.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/customers";
    }
    
    void CustomerController.populateEditForm(Model uiModel, Customer customer) {
        uiModel.addAttribute("customer", customer);
    }
    
    String CustomerController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
