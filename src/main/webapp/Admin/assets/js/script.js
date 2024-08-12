
    function previewPhoto() {
        const fileInput = document.getElementById('news-photo');
        const photoPreview = document.getElementById('photo-preview');
        

        if (fileInput.files && fileInput.files[0]) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
                photoPreview.src = e.target.result;
                photoPreview.style.display = 'block'; 
            }
            

            reader.readAsDataURL(fileInput.files[0]);
        } else {
            
            photoPreview.style.display = 'none';
        }
    }


    var map = L.map('map').setView([16.8661, 96.1951], 6); 

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { 
    maxZoom: 25,
    }).addTo(map);


    L.marker([16.8661, 96.1951])  
    .addTo(map)
    .bindPopup('<b>Hello!</b><br>This is Yangon, Myanmar.')
    .openPopup();



    
