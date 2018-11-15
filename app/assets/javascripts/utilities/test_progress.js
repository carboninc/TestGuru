document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.progress');
  var progressBar = document.querySelector('.progress-bar');

   if (progress) {
    var current =  progress.dataset.currentProgress;
    var common =  progress.dataset.commonProgress;
    var width = Math.round(current / (common / 100)) + '%';

    progressBar.style.width = width;
    progressBar.textContent = width;
  }
})