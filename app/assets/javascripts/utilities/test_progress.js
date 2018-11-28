document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.progress');
  var progressBar = document.querySelector('.progress-bar');

   if (progress) {
    var current =  progress.dataset.currentQuestion;
    var total =  progress.dataset.totalQuestions;
    var width = Math.round(current / (total / 100)) + '%';

    progressBar.style.width = width;
    progressBar.textContent = width;
  }
});
