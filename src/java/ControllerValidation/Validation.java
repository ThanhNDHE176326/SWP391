/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ControllerValidation;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Validation {
    public static List<String> validatePassword(String password) {
        List<String> errorMessages = new ArrayList<>();
        // Kiểm tra mật khẩu
        String passwordPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        if (!password.matches(passwordPattern)) {
            errorMessages.add("Invalid password. Password must have at least 8 characters, including at least one uppercase letter, one lowercase letter, one number and one special character.");
        }
        return errorMessages;
    }

    public static List<String> validatePhoneNumber(String phone) {
        List<String> errorMessages = new ArrayList<>();
        // Kiểm tra số điện thoại
        String phonePattern = "^0\\d{9}$";
        if (!phone.matches(phonePattern)) {
            errorMessages.add("Invalid phone number. The phone number must start at 0 and have exactly 10 digits.");
        }
        return errorMessages;
    }
}
