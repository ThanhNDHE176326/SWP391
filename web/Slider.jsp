<%-- 
    Document   : Slider
    Created on : 24 May 2024, 3:09:22 pm
    Author     : dat ngo huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Slider in CSS</title>
<style>

body{
    background-color: rgb(58, 58, 58);
    margin-top: 100px;
}
.carousel-container {
  width: 600px;
  height: 400px;
  position: relative;
  margin: 0 auto;

}

.navigation-buttons .previous {
  position: absolute;
  z-index: 10;
  font-size: 25px;
  top: 40%;
  left: 10px;
  font-weight: 700;
}

.navigation-buttons .next {
  right: 10px;
  position: absolute;
  font-size: 25px;
  z-index: 10;
  top: 40%;
}

.navigation-buttons .nav-btn {
  background: rgba(255, 255, 255, 0.55);
  cursor: pointer;
  border-radius: 50%;
  width: 30px;
  height: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 5px;
  box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.4);
}

.navigation .nav-btn:hover {
  background: white;
}

.slider-carousel {
  display: flex;
  justify-content: center; 
 
  margin-top: 20px;
  transition: all 2s ease;

}
.slider-carousel img {
    
  width: 1200px;
  height: 500px;
  transition: all 2s ease;
  border:8px solid white;
}

.images {
  position: absolute;
  display: none;
}

.main {
  display: block;
}

.image-text {
  position: absolute;
  bottom: 0;
  width: 103%;
  display: flex;
  font-size: 20px;
  justify-content: center;
  align-items: center;
  color: rgb(255, 255, 255);
  background: rgba(0, 0, 0, 0.3);
  height: 35px;
}

</style>
</head>
<body>
    <form action="slider" method="post">
<div id="parent-container">

<div class="navigation-buttons">
  <div class="previous nav-btn"><</div>
  <div class="next nav-btn">></div>
</div>

<div class="slider-carousel">
  <div class="images main">
    <img src="${data}" alt="flower 1" />
    <div class="image-text">Sale off 20%</div>
  </div>
<div class="images">
    <img src="${data}" alt="flower 2" />
    <div class="image-text">New Event</div>
  </div>
  <div class="images">
    <img src="${data}" alt="flower 3" />
    <div class="image-text">Image 3</div>
  </div>      
</div>

</div>
        
</form> 
    
<script>

    const previous = document.querySelector('.previous');
    const next = document.querySelector('.next');
    const images = document.querySelector('.slider-carousel').children;
    const totalImages = images.length;
    let currentIndex = 0;


	// Event Listeners to previous and next buttons
    previous.addEventListener('click', () => {
      previousImage();
    });

    next.addEventListener('click', () => {
      nextImage();
    });
    
    setInterval(()=>{
    	nextImage();
    },4000);
    
    // Function to go to next Image
    function nextImage(){

      images[currentIndex].classList.remove('main');
    	if(currentIndex == totalImages-1){
        	currentIndex = 0;
        }
        else{
        	currentIndex++;
        }

      images[currentIndex].classList.add('main');
      
    }
    
    // Function to go to previous Image
    function previousImage(){

      images[currentIndex].classList.remove('main');
    	if(currentIndex == 0){
        	currentIndex = totalImages-1;
        }
        else{
        	currentIndex--;
        }
    
      images[currentIndex].classList.add('main');

    }
    
</script>

</body>
</html>


