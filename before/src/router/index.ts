import { createRouter, createWebHistory } from 'vue-router'
import type { RouteRecordRaw } from 'vue-router'

// 展示
import OpeningMain from '@/pages/opening/MainPage/index.vue'
import OpeningHome from '@/pages/opening/HomePage/index.vue'

// 功能
import UsingInfo from '@/pages/using/InfoPage/page.vue'
import UsingMain from '@/pages/using/MainPage/page.vue'
import ChatList from '@/pages/using/MainPage/ChatList/page.vue'
import ChatGPT from '@/pages/using/MainPage/ChatGPT/page.vue'
import ChatUser from '@/pages/using/MainPage/ChatUser/page.vue'
import ChatGroup from '@/pages/using/MainPage/ChatGroup/page.vue'
import ChatInfo from '@/pages/using/MainPage/ChatInfo/page.vue'
import ChatSetting from '@/pages/using/MainPage/ChatSetting/page.vue'

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        redirect: '/opening'
    },
    {
        path: '/opening',
        name: 'MainPage',
        redirect: '/opening/home',
        component: OpeningMain,
        children: [
            {
                path: 'home',
                name: 'HomePage',
                component: OpeningHome,
            }
        ]
    },
    {
        path: '/using',
        component: UsingMain,
        redirect: '/using/chat-list',
        children: [
            {
                path: 'chat-list',
                component: ChatList
            },
            {
                path: 'chat-gpt',
                component: ChatGPT
            },
            {
                path: 'chat-user',
                component: ChatUser
            },
            {
                path: 'chat-group',
                component: ChatGroup
            },
            {
                path: 'chat-info',
                component: ChatInfo
            },
            {
                path: 'chat-setting',
                component: ChatSetting
            }
        ]
    },
    {
        path: '/info',
        name: 'InfoPage',
        component: UsingInfo
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
})

router.beforeEach((to, from , next) => {
    console.log('从：', from)
    console.log('去往：', to)
    next()
})

export default router