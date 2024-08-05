function validateForm(event) {
    event.preventDefault(); 

    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    var emailPattern = /^[^@\s]+@[^@\s]+\.[^@\s]+$/; 

    if (!email || !emailPattern.test(email)) {
        alert('Please enter a valid email address.');
        return false;
    }

    if (!password) {
        alert('Please enter your password.');
        return false;
    }

    document.getElementById('loginForm').submit();
}