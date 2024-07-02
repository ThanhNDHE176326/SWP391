//package Filter;
//
//import Utils.AdminAccessConfig;
//import Utils.CustomerAccessConfig;
//import Utils.MarketingAccessConfig;
//import Utils.SaleAccessConfig;
//import Utils.SaleAdminAccessConfig;
//import java.io.IOException;
//import java.util.List;
//import java.util.stream.Collectors;
//import java.util.stream.Stream;
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebFilter("/*")
//public class AuthorizationFilter implements Filter {
//
//    private List<String> adminUrls;
//    private List<String> marketingUrls;
//    private List<String> saleUrls;
//    private List<String> saleAdminUrls;
//    private List<String> customerUrls;
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        adminUrls = AdminAccessConfig.getAdminUrls();
//        marketingUrls = MarketingAccessConfig.getMarketingUrls();
//        saleUrls = SaleAccessConfig.getSaleUrls();
//        saleAdminUrls = SaleAdminAccessConfig.getSaleAdminUrls();
//        customerUrls = CustomerAccessConfig.getCustomerUrls();
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        HttpSession session = httpRequest.getSession(false);
//
//        String userRole = (session != null) ? (String) session.getAttribute("userRole") : null;
//        String contextPath = httpRequest.getContextPath();
//        String requestURI = httpRequest.getRequestURI().substring(contextPath.length());
//
//        // Bypass static resources
//        if (requestURI.startsWith("/css/") || requestURI.startsWith("/js/") || requestURI.startsWith("/images/") || requestURI.startsWith("/fonts/") || requestURI.startsWith("/vendor/") || requestURI.startsWith("/scss/")) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        // Allow access to login pages without authentication
//        if (requestURI.startsWith("/view/customer/logincustomer.jsp")
//                || requestURI.startsWith("/view/staff/loginstaff.jsp") || requestURI.startsWith("/loginstaff")
//                || requestURI.startsWith("/view/staff/forgotpasswordstaff.jsp") || requestURI.startsWith("/forgotpasswordstaff")
//                || requestURI.startsWith("/view/staff/verifyresetpasswordstaff.jsp") || requestURI.startsWith("/confirmresetpwdstaff")
//                || requestURI.startsWith("/view/staff/resetpasswordstaff.jsp") || requestURI.startsWith("/resetpasswordstaff")) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        // Determine allowed URLs based on user role
//        List<String> allowedUrls;
//        if (userRole == null || "customer".equals(userRole)) {
//            // Allow only customer URLs for guests or customers
//            allowedUrls = customerUrls;
//        } else if ("3".equals(userRole)) {
//            allowedUrls = Stream.concat(customerUrls.stream(), saleUrls.stream())
//                    .collect(Collectors.toList());
//        } else if ("4".equals(userRole)) {
//            allowedUrls = Stream.concat(customerUrls.stream(), marketingUrls.stream())
//                    .collect(Collectors.toList());
//        } else if ("2".equals(userRole)) {
//            allowedUrls = Stream.concat(customerUrls.stream(), saleAdminUrls.stream())
//                    .collect(Collectors.toList());
//        } else if ("1".equals(userRole)) {
//            allowedUrls = Stream.concat(Stream.concat(customerUrls.stream(), saleUrls.stream()),
//                    Stream.concat(saleAdminUrls.stream(), Stream.concat(marketingUrls.stream(), adminUrls.stream())))
//                    .collect(Collectors.toList());
//        } else {
//            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have permission to access this page.");
//            return;
//        }
//
//        // Check if the requested URI is in the allowed URLs for the user's role
//        boolean accessGranted = allowedUrls.stream().anyMatch(requestURI::matches);
//
//        if (!accessGranted) {
//            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "You do not have permission to access this page.");
//            return;
//        }
//
//        // Allow the request to proceed
//        chain.doFilter(request, response);
//    }
//
//    @Override
//    public void destroy() {
//        // Cleanup code if needed
//    }
//}
