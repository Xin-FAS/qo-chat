<script setup lang='ts'>
// Message取个别名，和不知名的地方重复了
import { Message as ElMessage, Connection } from '@element-plus/icons-vue'
const emit = defineEmits(['back'])


// 账号
</script>

<template>
   <el-form class="form-content">
        <el-form-item
            size="large"
            v-motion
            :initial="{
                opacity: 0,
                y: 150,
            }"
            :enter="{
                opacity: 1,
                y: 0,
                transition: {
                    type: 'spring',
                    mass: 0.6,
                },
            }">
            <el-input
                placeholder="邮箱号码"
                :prefix-icon="ElMessage"
            />
        </el-form-item>
        <el-form-item
            size="large"
            v-motion
            :initial="{
                opacity: 0,
                y: 150,
            }"
            :enter="{
                opacity: 1,
                y: 0,
                transition: {
                    type: 'spring',
                    mass: 0.6,
                    delay: 40
                },
            }">
            <div class="flex w-full h-full">
                <el-input
                    placeholder="邮箱验证码"
                    :prefix-icon="Connection"
                />
                <el-button class="ml-[10px]">获取验证码</el-button>
            </div>
        </el-form-item>
        <el-form-item
            v-motion
            :initial="{
                opacity: 0,
                y: 150,
            }"
            :enter="{
                opacity: 1,
                y: 0,
                transition: {
                    type: 'spring',
                    mass: 0.6,
                    delay: 80
                },
            }">
            <el-button class="w-full" type="primary">登录</el-button>
        </el-form-item>
        <el-form-item
            v-motion
            :initial="{
                opacity: 0,
                y: 150,
            }"
            :enter="{
                opacity: 1,
                y: 0,
                transition: {
                    type: 'spring',
                    mass: 0.6,
                    delay: 120
                },
            }">
            <el-button class="w-full" @click="emit('back')">返回</el-button>
        </el-form-item>
    </el-form>
</template>
<style scoped lang='scss'>
.form-content {
    .more-login {
        @apply
        flex
        w-full
        justify-around;

        > svg {
            @apply
            text-[#666]
            hover:text-[#60a5fa]
            cursor-pointer;
        }
    }
}
</style>
