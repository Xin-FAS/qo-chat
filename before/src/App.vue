<template>
    <router-view v-slot="{ Component }">
        <transition
            mode="out-in"
            enter-active-class="animate__animated animate__fadeIn"
            leave-active-class="animate__animated animate__fadeOut"
        >
            <component :is="Component"/>
        </transition>
    </router-view>
</template>

<style lang="scss">
body {
    font-family: Alibaba-PuHuiTi-Regular, sans-serif;
}

* {
    &::-webkit-scrollbar {
        @apply w-[4px] h-[4px];
    }

    &::-webkit-scrollbar-thumb {
        @apply
        bg-[#ccc]
        rounded-2xl;
    }

    &::-webkit-scrollbar-track-piece {
        @apply bg-transparent;
    }
}

@font-face {
    font-family: 'Alibaba-PuHuiTi-Regular';
    src: url("@/assets/font/Alibaba-PuHuiTi-Regular.ttf");
}

.super-absolute {
    @apply 
    absolute
    left-1/2
    top-1/2
    transform
    -translate-x-1/2
    -translate-y-1/2;
}
</style>
