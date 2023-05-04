import type { FormInstance, FormItemRule } from 'element-plus'
import { Arrayable } from 'element-plus/es/utils'

type BaseRule = Arrayable<FormItemRule>

const username: BaseRule = [
    {
        required: true,
        message: '账号不能为空！',
        trigger: 'change'
    },
]
const password: BaseRule = [
    {
        required: true,
        message: '密码不能为空！',
        trigger: 'change'
    },
]
const code: BaseRule = [
    {
        required: true,
        message: '验证码不能为空！',
        trigger: 'change'
    },
]

// 校验表单
const validForm = (formRef: FormInstance | undefined, cb: () => void) => {
    console.info('===开始校验')
    if (!formRef) return
    formRef.validate(valid => {
        if (!valid) return
        cb()
    })
}

export {
    username,
    password,
    code,
    validForm
}