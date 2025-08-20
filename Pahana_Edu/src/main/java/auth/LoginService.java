package auth;

public class LoginService {
    public boolean login(String username, String password) {
        // simple hardcoded check (replace with DB check later)
        return "admin".equals(username) && "1234".equals(password);
    }
}