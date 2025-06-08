// case_study_animations.js
export function initAnimations() {
  const text = "British Fencing Redesign";
  const target = document.getElementById("typewriter");
  if (target && target.innerHTML.trim() === "") {
    let i = 0;
    const type = () => {
      if (i < text.length) {
        target.innerHTML += text.charAt(i);
        i++;
        setTimeout(type, 70);
      }
    };
    type();
  }

  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("show");
      }
    });
  }, { threshold: 0.1 });

  document.querySelectorAll(".fade-in-up").forEach(el => observer.observe(el));
};
