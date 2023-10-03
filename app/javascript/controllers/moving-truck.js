<script>
  // Get references to the tab buttons and the truck element
  const outgoingTabButton = document.getElementById("out-tab");
  const truckElement = document.getElementById("truck");

  // Add an event listener to the 'Outgoing items' tab button
  outgoingTabButton.addEventListener("click", function () {

// Check if the tab is active and add or remove the animation class accordingly
    const isActive = this.getAttribute("aria-selected") === "true";
    if (isActive) {
      truckElement.classList.add("animated-truck");
    } else {
      truckElement.classList.remove("animated-truck");
    }
  });
</script>
