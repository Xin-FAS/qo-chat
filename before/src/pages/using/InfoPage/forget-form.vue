<script setup lang='ts'>
import { 
    User,
    Lock,
    Iphone,
    Connection
} from '@element-plus/icons-vue'

const emit = defineEmits<{
    (name: 'back'): void
}>()
</script>
<template>
    <el-form
        size="large"
        ref="formRef">
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
                    mass: 0.6
                },
            }">
            <el-input
                placeholder="手机号码"
                :prefix-icon="Iphone"
            />
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
                    delay: 40
                },
            }">
            <div class="flex w-full h-full">
                <el-input
                    placeholder="短信验证码"
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
            <el-input
                clearable
                type="password"
                show-password
                placeholder="密码"
                :prefix-icon="Lock"
            />
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
            <el-input
                clearable
                type="password"
                show-password
                placeholder="确认密码"
                :prefix-icon="Lock"
            />
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
                    delay: 160
                },
            }">
            <el-button
                class="w-full"
                size="default"
                type="primary">
                确定
            </el-button>
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
                    delay: 200
                },
            }">
            <el-button
                class="w-full"
                size="default"
                @click="emit('back')">
                返回
            </el-button>
        </el-form-item>
    </el-form>
</template>
<style scoped lang='scss'>
</style>
