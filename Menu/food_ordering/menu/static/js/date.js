function showDate() {
    const dateElement = document.getElementById('currentDate');
    const currentDate = new Date(); // Get the current date
    const options = { year: 'numeric', month: 'long', day: 'numeric' }; // Formatting options
    dateElement.textContent = currentDate.toLocaleDateString(undefined, options);
}

// Call the function when the page loads
window.onload = showDate;