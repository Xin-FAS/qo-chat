<script setup lang='ts'>
import type { UserChat, ChatContent } from '@/constant/types'
import ChatRoom from './chat-room.vue'
import ChatInput from './chat-input.vue'
import { Icon } from '@iconify/vue'
import { onBeforeMount, ref } from 'vue'
import avatar from '@/assets/img/avatar.jpg'
import moment from 'moment'
import { handlerTime } from '@/utils/moment'
import emojipedia from '@/components/emojipedia.vue'

const props = defineProps<{
    data: UserChat | undefined,
    isMobile: boolean
}>()
// 聊天记录加载状态
const isLoading = ref(false)
// 等待状态, true 未选择聊天
const isNoSelected = ref(true)

// 根据列表信息获取聊天记录
const getChatRecord = () => {
    console.log('刷新获取聊天记录', { ...props.data })
    isNoSelected.value = !props.data
    // 未选择
    if (!props.data) return
    isLoading.value = true
    // TODO 异步请求获取聊天数据
    setTimeout(() => {
        chatContent.value = [
            {
                id: 1,
                type: 'text',
                text: '测试消息测试消息测试消息测试消息测试消息测试消息测试消息',
                time: '2022-03-01T14:00:00',
                userInfo: {
                    userId: 1,
                    username: '测试用户',
                    nickname: '用户昵称1',
                    avatar,
                    sex: '0'
                }
            },
            {
                id: 2,
                type: 'text',
                text: '测试消息测试消息测试消息测试消息测试消息测试消息测试消息',
                time: '2022-03-01T14:00:00',
                userInfo: {
                    userId: 2,
                    username: '测试用户',
                    nickname: '用户昵称1',
                    avatar,
                    sex: '0'
                }
            },
            {
                id: 3,
                type: 'text',
                text: '测试消息测试消息测试消息测试消息测试消息测试消息测试消息',
                time: '2022-03-01T14:00:00',
                userInfo: {
                    userId: 2,
                    username: '测试用户',
                    nickname: '用户昵称1',
                    avatar,
                    sex: '0'
                }
            },
            {
                id: 4,
                type: 'text',
                text: '测试消息测试消息测试消息测试消息测试消息测试消息测试消息',
                time: '2022-03-01T14:00:00',
                userInfo: {
                    userId: 2,
                    username: '测试用户',
                    nickname: '用户昵称1',
                    avatar,
                    sex: '0'
                }
            },
            {
                id: 5,
                type: 'text',
                text: '测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息测试消息',
                time: '2022-03-01T14:00:00',
                userInfo: {
                    userId: 4,
                    username: '测试用户3',
                    nickname: '用户昵称3',
                    avatar,
                    sex: '0'
                }
            }
        ]
        isLoading.value = false
    }, 2000)
}

const emits = defineEmits<{
    (name: 'clickMenu' | 'swipedown'): void
}>()

// 主题环境
const themeMode = ref<'dark' | 'light'>('light')

const chatContent = ref<ChatContent[]>([])
onBeforeMount(() => {
    getChatRecord()
})
// 点击头像
const clickAvatar = (data: any) => {
    console.log(data)
}
// 模拟数据
const createData = () => {
    return {
        id: Math.round(Math.random() * 10000),
        type: 'text',
        text: '测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长测试超长',
        time: '2022-10-10T12:12:12',
        userInfo: {
            userId: Math.round(Math.random()) + 1,
            username: '测试用户2',
            nickname: '测试用户2',
            avatar,
            sex: '0'
        }
    }
}
// 加载更多
const loadMore = () => {
    const arr: any = []
    for (let i = 0; i < 10; i++) {
        arr.push(createData())
    }
    setTimeout(() => {
        chatContent.value = [...arr, ...chatContent.value]
    }, 1000)
}
// 模拟发送
const send = (value: string) => {
    chatContent.value.push({
        id: Math.round(Math.random() * 10000),
        type: 'text',
        text: value,
        time: moment().format('YYYY-MM-DDTHH:mm:ss'),
        userInfo: {
            userId: Math.round(Math.random()) + 1,
            username: '测试用户2',
            nickname: '测试用户2',
            avatar,
            sex: '0'
        }
    })
}
// 当前消息列表状态
const isMsgShut = ref(false)
// 点击收缩icon
const changeMsgShut = () => {
    isMsgShut.value = !isMsgShut.value
    emits('clickMenu')
}
// 监听向下滑动头部关闭
const swipedown = () => {
    if (!props.isMobile) return
    emits('swipedown')
}
const chatInputRef = ref()
// 选中表情
const selectedEmo = (emo: string) => {
    console.log(emo, '选择了')
    chatInputRef.value.insertTo(emo)
}
</script>
<template>
    <div class="flex flex-1 flex-col">
        <!-- 聊天窗口头部 -->
        <div class="chat-head" v-hammer="{ swipedown }">
            <!-- 左侧收缩 -->
            <div class="chat-head-left" @click="changeMsgShut" v-if="!isMobile">
                <!-- 收缩消息列表 -->
                <Icon
                    :icon="!isMsgShut ? 'bi:menu-button-fill': 'bi:menu-button'"
                    class="text-[#333] text-[20px] ml-[15px]"
                />
            </div>
            <!-- 聊天对象 -->
            <div class="pointer-events-none text-center flex items-center" v-if="!isNoSelected">
                <el-avatar shape="square" :size="40" class="mr-[10px]" :src="data?.avatar" />
                <div>
                    <p class="text-[15px] flex items-center">
                        <span>{{ data?.nickname }}</span>
                        <Icon icon="tabler:message-chatbot" class="ml-[5px]" color="#333" width="17" />
                    </p>
                    <p class="text-[10px]">{{ handlerTime(data?.time || '') }}</p>
                </div>
            </div>
        </div>
        <div class="flex flex-col flex-1 min-h-0 bg-gray-100" v-loading="isLoading">
            <div class="flex-1 min-h-0" v-show="!isNoSelected">
                <ChatRoom
                    :themeMode="themeMode"
                    :chat-content="chatContent"
                    :user-id="1"
                    @clickAvatar="clickAvatar"
                    @loadMore="loadMore"
                />
            </div>
            <div class="h-auto flex flex-col sm:h-[230px]" v-show="!isNoSelected">
                <div class="flex items-center p-[5px]">
                    <!-- 表情模块 -->
                    <emojipedia @selected="selectedEmo"/>
                </div>
                <div class="flex-1">
                    <ChatInput ref="chatInputRef" @send="send"/>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped lang='scss'>
.chat-head {
    @apply
    relative
    h-[60px]
    p-[10px]
    flex
    justify-center
    items-end;
    background: linear-gradient(90deg, #F7F7F7 0%,#FFFFFF 10%);

    .chat-head-left {
        @apply
        absolute
        left-0
        top-0
        h-full
        w-[50px]
        flex
        items-center;
    }
}
</style>
