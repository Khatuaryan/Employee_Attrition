document.addEventListener('DOMContentLoaded', function() {
    const newUserBtn = document.getElementById('newUserBtn');
    const existingUserBtn = document.getElementById('existingUserBtn');
  
    newUserBtn.addEventListener('click', function() {
      // Reload the page to display the user form
      window.location.href = 'login.html'; // Change to the URL of your login page
      
    });
  
    existingUserBtn.addEventListener('click', function() {
        window.location.href = 'userloginandpass.html'; 
    });
  });
  