let modalState = "closed";

const toggleModal = () => {
  let modal = document.getElementById("modal");
  if (modalState === "closed") {
    modal.style.display = "block";
    modal.style.animation = "open-modal 0.7s ease-out";
    modalState = "open"
  } else {
    modal.style.animation = "close-modal 0.7s ease-out";

    setTimeout(() => {
      modal.style.display = "none";
    }, 700);

    modalState = "closed";
  }
};
