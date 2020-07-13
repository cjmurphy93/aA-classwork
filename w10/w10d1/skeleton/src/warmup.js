
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const children = Array.from(htmlElement.children);

  children.forEach(child=>{
    htmlElement.removeChild(child);
  })
  const p = document.createElement("p");
  p.innerHTML = string;
  htmlElement.append(p);
};

htmlGenerator('Party Time.', partyHeader);