<script setup lang='ts'>
import { onMounted, ref } from 'vue';

// @ts-ignore  这是一个js库，使用ts忽略检测一行
import { pinyin } from 'pinyin-pro';

// 加载状态
const isLoading = ref(true)
// 好友列表数据
const renderList = ref<any>(new Map())
// 获取好友列表
const getDataList = () => {
    // TODO 模拟异步获取数据
    setTimeout(() => {
        const dataList = [
            {
                qoNum: 'qo_xin0313',
                avatar: '',
                nickname: '测试用户',
                sex: '0'
            },
            {
                qoNum: 'qo_xin0311',
                avatar: '',
                nickname: '测试用户2',
                sex: '0'
            },
            {
                qoNum: 'qo_xin0315',
                avatar: '',
                nickname: 'D测试试用户11111111111111111111',
                sex: '1'
            }
        ]
        renderList.value = handlerRenderList(dataList)
        isLoading.value = false
    }, 1000)
}

onMounted(() => {
    getDataList()
})
// 根据nickname的首拼音字母排序
const handlerRenderList = (data: any) => {
    const renderMap = new Map()
    for (const user of data) {
        // 获取第一位没有音标的拼音首字母大写
        const indexKey = pinyin(user.nickname[0], { pattern: 'first', toneType: 'none' }).toLocaleUpperCase()
        // 待添加
        let waitArr: any = [user]
        // 已存在就追加
        if (renderMap.has(indexKey)) waitArr = [...renderMap.get(indexKey), ...waitArr]
        renderMap.set(indexKey, waitArr)
    }
    // 转数组取key排序后转回map
    const arr = Array.from(renderMap)
    arr.sort((a, b) => a[0].localeCompare(b[0]))
    return new Map(arr)
}

// 当前选中用户qo
const selectUserQo = ref('')
const emits = defineEmits<{
    (name: 'click', content: any): void
}>()
// 选中
const selectedUser = (userItem: any) => {
    selectUserQo.value = userItem.qoNum
    emits('click', {...userItem})
}
</script>
<template>
    <div class="h-full overflow-auto bg-[#e8e6e6] select-none" v-loading="isLoading">
        <div
            class="py-[5px]"
            v-for="renderItem in renderList"
            :key="renderItem[0]"
        >
            <span class="mx-[10px] text-[#999999] text-[14px]">{{ renderItem[0] }}</span>
            <div 
                v-for="userItem in renderItem[1]" 
                :key="userItem.qoNum" 
                class="flex items-center h-[70px] gap-[10px] transition-all hover:bg-[#cac8c7] px-[10px] duration-150"
                :class="{
                    'isSelected': selectUserQo===userItem.qoNum
                }"
                @click="selectedUser(userItem)"
            >
                <el-avatar shape="square" class="flex-shrink-0" :src="userItem.avatar"/>
                <p class="text-[14px] truncate">{{ userItem.nickname }}</p>
            </div>
        </div>
    </div>
</template>
<style scoped lang='scss'>
    .isSelected {
        @apply bg-[#cac8c7];
    }
</style>
