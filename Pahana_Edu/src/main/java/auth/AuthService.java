package auth;

public class AuthService {
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin123";

    public boolean authenticate(String username, String password) {
        if (username == null || password == null) {
            return false;
        }
        return USERNAME.equals(username) && PASSWORD.equals(password);
    }
}
