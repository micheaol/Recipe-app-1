const menuButton = document.getElementById('menuButton');
const menuCover = document.getElementById('mobileMenuCover');

function toggleMenu() {
    menuCover.style.display = 'block';
    menuCover.style.animation = "open-menu 0.7s ease-out";
  }
  
  function closeMenu() {
    
    menuCover.style.animation = "close-menu 0.7s ease-out";
    
    setTimeout(() => {
      menuCover.style.display = 'none';
    }, 700);

  }