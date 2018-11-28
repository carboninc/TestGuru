document.addEventListener('turbolinks:load', function() {
  let timer = document.querySelector('.timer');

  if (timer) {
    let minutes = document.querySelector('.minutes');
    let seconds = document.querySelector('.seconds');
    let time = parseInt(timer.dataset.time);

    setInterval(function() {
      if (!time) {
        let button = document.querySelector('.btn[type="submit"]');
        button.click()
      } else {
        minutes.textContent = Math.floor(time / 60);
        seconds.textContent = time % 60;
      }
      time -= 1;
    },1000);
  }
});