package test;

import static org.junit.Assert.*;
import org.junit.Test;
import auth.LoginService;

public class LoginTestPass {

    @Test
    public void testLoginWithCorrectCredentials() {
        LoginService service = new LoginService();
        boolean result = service.login("admin", "1234");

        // This will PASS (GREEN LINE)
        assertTrue("Login should succeed", result);
    }
}
