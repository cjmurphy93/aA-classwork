
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

dogLinkCreator = function(dogs) {

  const links = [];
  const types = Object.keys(dogs);
  types.forEach(dog =>{
    const a = document.createElement("a");
    a.innerHTML = dog;
    a.href = dogs[dog];

    const li = document.createElement("li");
    li.classList.add("dog-link");
    li.append(a);
    links.push(li);
  })
  return links;
}

attachDogLinks = function() {
  const dogLinks = dogLinkCreator(dogs);
  const dropDown = document.getElementsByClassName("drop-down-dog-list");
  dogLinks.forEach(dog => {
    dropDown[0].append(dog);
  });
};


handleEnter = function() {
  const nav = document.querySelector(".drop-down-dog-nav");
  nav.addEventListener("mouseenter", e => {

    const dogLinks = document.querySelectorAll(".dog-link");
      dogLinks.forEach(link =>{
        link.classList.add("enter")
      })
  })

}

handleLeave = function() {
  const nav = document.querySelector(".drop-down-dog-nav");
  nav.addEventListener("mouseleave", e => {

    const dogLinks = document.querySelectorAll(".dog-link");
    dogLinks.forEach(link => {
      link.classList.remove("enter")
    })
  })

}


attachDogLinks();
handleEnter()
handleLeave()