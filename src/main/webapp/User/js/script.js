document.addEventListener('DOMContentLoaded', function() {
    if (!localStorage.getItem('alertShown')) {
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
            localStorage.setItem('alertShown', 'true');
        });
    }
});

function handleResponse(response) {
    if (response === 'yes') {
        Swal.fire({
            icon: 'warning',
            title: 'Emergency!',
            confirmButtonText: 'OK'
        }).then(() => {
            window.location.href = 'inDanger.jsp'; 
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

(function(window) {
    'use strict';

    function classReg(className) {
        return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
    }

    var hasClass, addClass, removeClass;

    if ('classList' in document.documentElement) {
        hasClass = function(elem, c) {
            return elem.classList.contains(c);
        };
        addClass = function(elem, c) {
            elem.classList.add(c);
        };
        removeClass = function(elem, c) {
            elem.classList.remove(c);
        };
    } else {
        hasClass = function(elem, c) {
            return classReg(c).test(elem.className);
        };
        addClass = function(elem, c) {
            if (!hasClass(elem, c)) {
                elem.className = elem.className + ' ' + c;
            }
        };
        removeClass = function(elem, c) {
            elem.className = elem.className.replace(classReg(c), ' ');
        };
    }

    function toggleClass(elem, c) {
        var fn = hasClass(elem, c) ? removeClass : addClass;
        fn(elem, c);
    }

    var classie = {
        hasClass: hasClass,
        addClass: addClass,
        removeClass: removeClass,
        toggleClass: toggleClass,
        has: hasClass,
        add: addClass,
        remove: removeClass,
        toggle: toggleClass
    };

    // transport
    if (typeof define === 'function' && define.amd) {
        // AMD
        define(classie);
    } else {
        // browser global
        window.classie = classie;
    }

})(window);

var cbpAnimatedHeader = (function() {
    var docElem = document.documentElement,
        header = document.querySelector('.navbar-default'),
        didScroll = false,
        changeHeaderOn = 100;

    function init() {
        window.addEventListener('scroll', function(event) {
            if (!didScroll) {
                didScroll = true;
                setTimeout(scrollPage, 250);
            }
        }, false);
    }

    function scrollPage() {
        var sy = scrollY();
        if (sy >= changeHeaderOn) {
            classie.add(header, 'navbar-shrink');
        } else {
            classie.remove(header, 'navbar-shrink');
        }
        didScroll = false;
    }

    function scrollY() {
        return window.pageYOffset || docElem.scrollTop;
    }

    init();

})();
