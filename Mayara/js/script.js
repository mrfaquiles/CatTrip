/*AVALIAÇÃO CLIENTE*/


let currentIndex = 0;
const items = document.querySelectorAll('.avaliacao-item');
const totalItems = items.length;

document.querySelector('.next-btn').addEventListener('click', () => {
    items[currentIndex].style.transform = 'translateX(-100%)';
    currentIndex = (currentIndex + 1) % totalItems;
    items[currentIndex].style.transform = 'translateX(0)';
});

document.querySelector('.prev-btn').addEventListener('click', () => {
    items[currentIndex].style.transform = 'translateX(100%)';
    currentIndex = (currentIndex - 1 + totalItems) % totalItems;
    items[currentIndex].style.transform = 'translateX(0)';
});


/* CADASTRO IMOVEL*/
document.getElementById('property-images').addEventListener('change', function (event) {
    const imagePreview = document.getElementById('image-preview');
    imagePreview.innerHTML = '';
    const files = event.target.files;
    for (const file of files) {
        if (file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const img = document.createElement('img');
                img.src = e.target.result;
                imagePreview.appendChild(img);
            };
            reader.readAsDataURL(file);
        }
    }
});




/*login*/

document.addEventListener('DOMContentLoaded', () => {
    const loginIcon = document.getElementById('loginIcon');
    const loginForm = document.getElementById('loginForm');

    loginIcon.addEventListener('mouseover', () => {
        loginForm.style.display = 'block';
    });

    loginIcon.addEventListener('mouseleave', () => {
        setTimeout(() => {
            if (!loginForm.matches(':hover')) {
                loginForm.style.display = 'none';
            }
        }, 100);
    });

    loginForm.addEventListener('mouseover', () => {
        loginForm.style.display = 'block';
    });

    loginForm.addEventListener('mouseleave', () => {
        loginForm.style.display = 'none';
    });
});


/*cadastro imovel */
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('propertyForm');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        alert('Imóvel cadastrado com sucesso!');
        form.reset();
    });
});

/*reserva */

function calculateTotal() {
    const checkin = new Date(document.getElementById('checkin').value);
    const checkout = new Date(document.getElementById('checkout').value);
    const oneDay = 24 * 60 * 60 * 1000;
    const diffDays = Math.round(Math.abs((checkout - checkin) / oneDay));
    const total = diffDays * 200;

    document.getElementById('total-value').textContent = total > 0 ? total.toFixed(2).replace('.', ',') : "0,00";
}


function showCreditCard(show) {
    const creditCardDetails = document.querySelector('.credit-card-details');
    creditCardDetails.style.display = show ? 'block' : 'none';
}

function finalizeReservation() {
    alert("Reserva realizada com sucesso! Os detalhes foram enviados para o seu e-mail.");
}

document.getElementById('contact-form').addEventListener('submit', function (event) {
    event.preventDefault();

    // Clear form fields
    document.getElementById('name').value = '';
    document.getElementById('email').value = '';
    document.getElementById('message').value = '';

    // Show thank you message
    document.getElementById('thank-you-message').style.display = 'block';
});


/*formulario*/

document.getElementById('cadastroForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const senha = document.getElementById('senha').value;
    const confirmarSenha = document.getElementById('confirmarSenha').value;
    const aceitoTermos = document.getElementById('aceitoTermos').checked;
    const errorMessage = document.getElementById('errorMessage');

    if (senha !== confirmarSenha) {
        errorMessage.textContent = 'As senhas não correspondem.';
        errorMessage.style.display = 'block';
    } else if (!aceitoTermos) {
        errorMessage.textContent = 'Você deve aceitar os termos e condições.';
        errorMessage.style.display = 'block';
    } else {
        errorMessage.style.display = 'none';
        alert('Cadastro realizado com sucesso!');
        this.submit();
    }
});

// slider imovel 

let slideIndex = 0;
showSlides(slideIndex);

function changeSlide(n) {
    showSlides(slideIndex += n);
}

function showSlides(n) {
    const slides = document.getElementsByClassName("slides")[0].children;
    if (n >= slides.length) {
        slideIndex = 0;
    } else if (n < 0) {
        slideIndex = slides.length - 1;
    }
    for (let i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex].style.display = "block";
}
