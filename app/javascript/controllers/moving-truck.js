 <script>
document.addEventListener("DOMContentLoaded", function() {
  const confirmDeliveryButton = document.getElementById("confirm-delivery-button");
  const movingTruckIcon = document.querySelector(".moving-truck i");

  confirmDeliveryButton.addEventListener("click", function() {
    // Add a CSS class to trigger the animation
    movingTruckIcon.style.animationName = "speed";
    movingTruckIcon.style.animationDuration = "5s";
    movingTruckIcon.style.animationTimingFunction = "linear";
    movingTruckIcon.style.animationIterationCount = "1"; // Play the animation only once
    movingTruckIcon.style.animationFillMode = "forwards";

    // Adjust the starting and ending positions if needed
    movingTruckIcon.style.left = "60%"; // Starting position
    setTimeout(function() {
      movingTruckIcon.style.left = "105%"; // Ending position (move off-screen to the right)
    }, 0); // Delay is set to 0 to ensure the animation starts immediately
  });
});
</script> %>
