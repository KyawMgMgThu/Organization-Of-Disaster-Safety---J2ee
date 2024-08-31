//Map Page start

var map = L.map('map').setView([16.8661, 96.1951], 6); // Initial view set to Myanmar

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 100,
        }).addTo(map);

        var marker;

        function updateMap(lat, lng) {
            if (marker) {
                marker.setLatLng([lat, lng]);
            } else {
                marker = L.marker([lat, lng]).addTo(map);
            }
            map.setView([lat, lng], 13);
        }

        function showPosition(position) {
            const lat = position.coords.latitude;
            const lng = position.coords.longitude;
            const phone = document.getElementById('phone').value;
            updateMap(lat, lng);
            sendLocation(phone, lat, lng);
        }

        document.getElementById('userForm').addEventListener('submit', function(event) {
            event.preventDefault();
            if (navigator.geolocation) {
                navigator.geolocation.watchPosition(
                    showPosition,
                    function(error) {
                        console.error("Geolocation error:", error);
                    },
                    { enableHighAccuracy: true }
                );
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        });


//Map Page end


