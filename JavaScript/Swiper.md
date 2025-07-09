Слайдер

```bash
npm install swiper
```

```html
@props([
	'slides' => ['1.jpg', '2.jpg', '3.jpg', '4.jpg', '5.jpg'], 
	'path' => '/img/slides'
])
 

@if (count($slides) > 0)
    <div class="swiper w-full">
        <div class="swiper-wrapper">
            @foreach ($slides as $slide)
                <div class="swiper-slide">
                    <img src="{{ $path }}/{{ $slide }}"
                         class="h-full w-full object-cover"
                         alt="slide">
                </div>
            @endforeach
        </div>

        <!-- Навигация (по желанию) -->
        <div class="swiper-button-prev z-50"></div>
        <div class="swiper-button-next z-50"></div>
        <div class="swiper-pagination"></div>
    </div>
@endif

@vite(['resources/js/slider.js'])
```

```js
// slider.js

import Swiper from 'swiper';
import { Navigation, Pagination, Autoplay } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
 
const swiper = new Swiper('.swiper', {
    modules: [Navigation, Pagination, Autoplay],
    direction: 'horizontal',
    loop: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true
    },
    autoplay: {
        delay: 3000,
        disableOnInteraction: false, // Не останавливать после взаимодействия
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    },
});
```