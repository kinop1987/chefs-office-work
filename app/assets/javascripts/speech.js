$( function() {
    const speech = new webkitSpeechRecognition();
    speech.lang = 'ja-JP';

    const content = document.getElementById('content');
    $('#btn').on('click', function(){
        speech.start();
    })

    speech.onresult = function(e) {
         speech.stop();
         if(e.results[0].isFinal){
             var autotext =  e.results[0][0].transcript
             content.value += autotext + '\n';
          }
     }

     speech.onend = () => { 
        speech.start() 
     };
    });