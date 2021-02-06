function popup () {
    const newPop = document.getElementById('new-pop');
    newPop.addEventListener('click', () => {
        const popedUP = document.getElementById('popup');
        const jsPop = document.getElementById('js-pop');
        const formEvent = document.getElementById('form-event');
        const formTime = document.getElementById('first-show');
        console.log(formTime);
        console.log(formEvent);
        console.log(popedUP);
        console.log(jsPop);
    });
    
    // const newPop = document.getElementById('new-pop');
    // closePopUp(newPop);
    // function clolsePopup(element) {
    //     if(!elemtnt) return;
    //     element.addEventListener('click', function() {
    //         popup.classList.toggle('is-show');
    //     });
    // }
};

window.addEventListener('load', popup);