            //Ajusta el tamaño de un iframe al de su contenido interior para evitar scroll
            function autofitIframe(id){
                if (!window.opera && document.all && document.getElementById){
                    frame.style.height=frame.contentWindow.document.body.scrollHeight;
                } else if(document.getElementById) {
                    frame.style.height=frame.contentDocument.body.scrollHeight+"px";
                }
            }