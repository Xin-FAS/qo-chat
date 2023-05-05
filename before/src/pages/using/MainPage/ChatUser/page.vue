<script lang="ts" setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { Search } from '@element-plus/icons-vue'
import UserDetail from './user-detail.vue'
import UserList from './user-list.vue'
// import type { UserChat } from '@/constant/types'
import { useDebounce } from '@/utils/useDebounce'

// 搜索框
const searchValue = ref('')
// 当前打开的消息列表
const openList = ref<any>()
const isSm = ref(true)
// 监听屏幕大小变化
const changeSide = () => {
    const clientWidth = document.documentElement.clientWidth
    isSm.value = clientWidth >= 640
}
// 防抖hook
const onResize = useDebounce(changeSide)

onMounted(() => {
    window.addEventListener('resize', onResize)
    changeSide()
})
onUnmounted(() => {
    window.removeEventListener('resize', onResize)
})
// 抽屉展示
const drawerModel = ref(false)
const swipedown = () => {
    // 关闭抽屉
    drawerModel.value = false
    // 清空当前
    openList.value = undefined
}
// 选中用户
const selectedUser = (userItem: any) => {
    drawerModel.value = true
    setTimeout(()=>{
        openList.value = userItem
    }, 500)
}
</script>

<template>
    <div class="chat-content">
        <!-- 消息列表 -->
        <div class="chat-list">
            <div class="list-top">
                <!-- 简单搜索框 -->
                <el-input
                    v-model="searchValue"
                    size="large"
                    class="bg-[#f1f1f1] ml-[10px]"
                    placeholder="好友昵称（Enter）"
                    :prefix-icon="Search"
                    clearable
                />
            </div>
            <div class="flex-1 min-h-0">
                <!-- 消息列表，绑定 -->
                <UserList @click="selectedUser"/>
            </div>
        </div>
        <!-- 聊天窗口 -->
        <transition
            mode="out-in"
            enter-active-class="animate__animated animate__fadeIn animate__faster"
            leave-active-class="animate__animated animate__fadeOut animate__faster">
            <div v-if="isSm" class="flex-1">
                <UserDetail :data="openList"/>
            </div>
        </transition>
        <!-- 移动端窗口 -->
        <el-drawer
            v-if="!isSm"
            style="--el-drawer-padding-primary: 0;"
            v-model="drawerModel"
            direction="btt"
            :with-header="false"
            size="100%">
            <div class="h-full">
                <UserDetail :data="openList" @swipedown="swipedown"/>
            </div>
        </el-drawer>
    </div>
</template>

<style lang="scss" scoped>
.chat-list {
    @apply
    h-full
    w-full
    sm:w-[220px]
    xl:w-[280px]
    bg-[#f7f7f7]
    flex
    overflow-hidden
    flex-col;
    transition: all cubic-bezier(0.74,-0.02, 0.44, 0.82) .4s;

    .list-top {
        @apply
        flex
        items-center
        p-[10px];
    }
}
</style>