<script setup lang='ts'>
import { ref } from 'vue'
import type { UserChat } from '@/constant/types';

const emits = defineEmits<{
    (name: 'click', content: UserChat): void
}>()

// 点击列表
const openChat = (content: UserChat) => {
    const { chatId } = content
    selectListId.value = chatId
    // 传递给上一个组件
    emits('click', content)
}

// 当前选中列表id
const selectListId = ref<undefined | number>(undefined)

const demoList = ref<UserChat[]>([
    {
        chatId: 1,
        nickname: 'Xin1',
        text: '啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意',
        time: '2022-02-02T16:11:11',
        avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
    },
    {
        chatId: 2,
        nickname: 'Xin2',
        text: '啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意',
        time: '2022-02-02T16:11:11',
        avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
    },
    {
        chatId: 3,
        nickname: 'Xin3',
        text: '啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意啥玩意',
        time: '2022-02-02T16:11:11',
        avatar: 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'
    },
])
</script>
<template>
    <!-- 消息列表 -->
    <div class="h-full overflow-auto bg-[#e8e6e6]">
        <div
            class="h-[70px] px-[10px] flex items-center cursor-default hover:bg-[#cac8c7] transition-all duration-150"
            :class="{
                'isSelected': selectListId === chatItem.chatId
            }"
            v-for="chatItem in demoList"
            :key="chatItem.chatId"
            @click="openChat({...chatItem})">
            <el-avatar class="flex-shrink-0" :src="chatItem.avatar"/>
            <div class="ml-[10px] min-w-0">
                    <p class="text-[14px]">{{ chatItem.nickname }}</p>
                    <p class="text-[12px] text-ellipsis whitespace-nowrap overflow-hidden">
                        {{ chatItem.text }}
                    </p>
            </div>
        </div>
    </div>
</template>
<style scoped lang='scss'>
    .isSelected {
        @apply bg-[#cac8c7];
    }
</style>
