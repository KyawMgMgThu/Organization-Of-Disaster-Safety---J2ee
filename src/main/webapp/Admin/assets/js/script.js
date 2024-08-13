
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


    function editUser(button) {
        const row = button.closest('tr');
        const name = row.children[1].innerText;
        const email = row.children[2].innerText;

        document.getElementById('editName').value = name;
        document.getElementById('editEmail').value = email;
        
        var editModal = new bootstrap.Modal(document.getElementById('editModal'), {
            keyboard: false
        });
        editModal.show();
    }

    document.getElementById('editForm').addEventListener('submit', function(event) {
        event.preventDefault();
        
        const name = document.getElementById('editName').value;
        const email = document.getElementById('editEmail').value;
        const password = document.getElementById('editPassword').value;

        console.log('Updated Info:', { name, email, password });

        var editModal = bootstrap.Modal.getInstance(document.getElementById('editModal'));
        editModal.hide();
    });



    
