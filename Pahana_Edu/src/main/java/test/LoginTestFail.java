package test;

import static org.junit.Assert.*;
import org.junit.Test;
import auth.LoginService;

public class LoginTestFail {

    @Test
    public void testLoginWithWrongCredentials() {
        LoginService service = new LoginService();
        boolean result = service.login("user", "wrongpass");

        // We expect this to be true, but it will be false → FAIL (RED LINE)
        assertTrue("Login should succeed but failed", result);
    }
}

