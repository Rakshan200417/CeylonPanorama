// tourguide.js
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('tourGuideForm');

    form.addEventListener('submit', () => {
        let valid = true;
        const inputs = form.querySelectorAll('input, select');

        inputs.forEach(input => {
            if (!input.checkValidity()) {
                valid = false;
                input.classList.add('is-invalid');
            } else {
                input.classList.remove('is-invalid');
            }
        });

        if (!valid) {
            alert("Please fill all required fields correctly.");
        }
    });
});