document.getElementById("signinForm").addEventListener("submit", function (e) {
    let valid = true;

    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();

    if (username.length < 3) {
        document.getElementById("username-error").textContent = "Username must be at least 3 characters";
        valid = false;
    } else {
        document.getElementById("username-error").textContent = "";
    }

    if (password.length < 6) {
        document.getElementById("password-error").textContent = "Password must be at least 6 characters";
        valid = false;
    } else {
        document.getElementById("password-error").textContent = "";
    }

    if (!valid) e.preventDefault();
});
