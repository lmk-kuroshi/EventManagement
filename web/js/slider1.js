/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const prev  = document.querySelector('.prev');
const next = document.querySelector('.next');

const track = document.querySelector('.track');

let carouselWidth = document.querySelector('.carousel-container').offsetWidth;

window.addEventListener('resize', () => {
  carouselWidth = document.querySelector('.carousel-container').offsetWidth;
})

let index = 0;

next.addEventListener('click', () => {
  index++;
  prev.classList.add('show');
  track.style.transform = `translateX(-${index * carouselWidth}px)`;
  
  if (track.offsetWidth - (index * carouselWidth) < carouselWidth) {
    next.classList.add('hide');
  }
})

prev.addEventListener('click', () => {
  index--;
  next.classList.remove('hide');
  if (index === 0) {
    prev.classList.remove('show');
  }
  track.style.transform = `translateX(-${index * carouselWidth}px)`;
})












const prev2  = document.querySelector('.prev2');
const next2 = document.querySelector('.next2');

const track2 = document.querySelector('.track2');

let carouselWidth2 = document.querySelector('.carousel-container2').offsetWidth;

window.addEventListener('resize', () => {
  carouselWidth2 = document.querySelector('.carousel-container2').offsetWidth;
})

let index2 = 0;

next2.addEventListener('click', () => {
  index2++;
  prev2.classList.add('show');
  track2.style.transform = `translateX(-${index2 * carouselWidth2}px)`;
  
  if (track2.offsetWidth - (index2 * carouselWidth2) < carouselWidth2) {
    next2.classList.add('hide');
  }
})

prev2.addEventListener('click', () => {
  index2--;
  next2.classList.remove('hide');
  if (index2 === 0) {
    prev2.classList.remove('show');
  }
  track2.style.transform = `translateX(-${index2 * carouselWidth2}px)`;
})









const prev3  = document.querySelector('.prev3');
const next3 = document.querySelector('.next3');

const track3 = document.querySelector('.track3');

let carouselWidth3 = document.querySelector('.carousel-container3').offsetWidth;

window.addEventListener('resize', () => {
  carouselWidth = document.querySelector('.carousel-container3').offsetWidth;
})

let index3 = 0;

next3.addEventListener('click', () => {
  index3++;
  prev3.classList.add('show');
  track3.style.transform = `translateX(-${index3 * carouselWidth3}px)`;
  
  if (track3.offsetWidth - (index3 * carouselWidth3) < carouselWidth3) {
    next3.classList.add('hide');
  }
})

prev3.addEventListener('click', () => {
  index3--;
  next3.classList.remove('hide');
  if (index3 === 0) {
    prev3.classList.remove('show');
  }
  track3.style.transform = `translateX(-${index3 * carouselWidth3}px)`;
})

