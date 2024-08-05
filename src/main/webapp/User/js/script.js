function handleResponse(response) {
    if (response === 'yes') {
        Swal.fire({
            icon: 'warning',
            title: 'Emergency!',
            confirmButtonText: 'OK'
        }).then(() => {
            window.location.href = 'inDanger.html'; 
        });
    } else {
        Swal.fire({
            icon: 'info',
            title: 'Stay Safe!',
            text: 'Stay safe and follow safety guidelines.',
            confirmButtonText: 'OK'
        });
    }
}

document.addEventListener('DOMContentLoaded', function() {
    Swal.fire({
        title: 'In danger?',
        text: 'Are you in immediate need of help?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Yes',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            handleResponse('yes');
        } else {
            handleResponse('no');
        }
    });
});





( function( window ) {

    'use strict';
    
    
    function classReg( className ) {
      return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
    }
    
    var hasClass, addClass, removeClass;
    
    if ( 'classList' in document.documentElement ) {
      hasClass = function( elem, c ) {
        return elem.classList.contains( c );
      };
      addClass = function( elem, c ) {
        elem.classList.add( c );
      };
      removeClass = function( elem, c ) {
        elem.classList.remove( c );
      };
    }
    else {
      hasClass = function( elem, c ) {
        return classReg( c ).test( elem.className );
      };
      addClass = function( elem, c ) {
        if ( !hasClass( elem, c ) ) {
          elem.className = elem.className + ' ' + c;
        }
      };
      removeClass = function( elem, c ) {
        elem.className = elem.className.replace( classReg( c ), ' ' );
      };
    }
    
    function toggleClass( elem, c ) {
      var fn = hasClass( elem, c ) ? removeClass : addClass;
      fn( elem, c );
    }
    
    var classie = {
      // full names
      hasClass: hasClass,
      addClass: addClass,
      removeClass: removeClass,
      toggleClass: toggleClass,
      // short names
      has: hasClass,
      add: addClass,
      remove: removeClass,
      toggle: toggleClass
    };
    
    // transport
    if ( typeof define === 'function' && define.amd ) {
      // AMD
      define( classie );
    } else {
      // browser global
      window.classie = classie;
    }
    
    })( window );
  
    
    var cbpAnimatedHeader = (function() {

        var docElem = document.documentElement,
            header = document.querySelector( '.navbar-default' ),
            didScroll = false,
            changeHeaderOn = 100;
    
        function init() {
            window.addEventListener( 'scroll', function( event ) {
                if( !didScroll ) {
                    didScroll = true;
                    setTimeout( scrollPage, 250 );
                }
            }, false );
        }
    
        function scrollPage() {
            var sy = scrollY();
            if ( sy >= changeHeaderOn ) {
                classie.add( header, 'navbar-shrink' );
            }
            else {
                classie.remove( header, 'navbar-shrink' );
            }
            didScroll = false;
        }
    
        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }
    
        init();
    
    })();


//Map Page start

var map = L.map('map').setView([16.8661, 96.1951], 6); // Initial view set to Myanmar

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 25,
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
            const username = document.getElementById('username').value;

            alert(`Name: ${username}\nLatitude: ${lat}\nLongitude: ${lng}`);
            updateMap(lat, lng);
            sendLocation(username, lat, lng);
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

        function sendLocation(username, lat, lng) {
    fetch('/location', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username: username, latitude: lat, longitude: lng })
    })
    .then(response => response.text()) 
    .then(text => {
        try {
            const data = JSON.parse(text); 
            console.log(data);
        } catch (error) {
            console.error('Invalid JSON response:', text);
        }
    })
    .catch(error => console.error('Error:', error));
}


//Map Page end


    