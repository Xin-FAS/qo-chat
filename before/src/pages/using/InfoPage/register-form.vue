<script setup lang='ts'>
import { 
    User,
    Lock,
    Message as ElMessage,
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
                    mass: 0.6,
                },
            }">
            <el-input
                clearable
                placeholder="账号"
                :prefix-icon="User"
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
            <el-input
                placeholder="邮箱号码"
                :prefix-icon="ElMessage"
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
                    delay: 80
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
                    delay: 120
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
                    delay: 160
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
                    delay: 200
                },
            }">
            <el-checkbox>
                <template #default>
                    <span>我已仔细阅读并接受</span>
                    <el-link @click.prevent type="primary" :underline="false" class="-mt-[2px]">《隐私政策》</el-link>
                </template>
            </el-checkbox>
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
                    delay: 240
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
                    delay: 260
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
