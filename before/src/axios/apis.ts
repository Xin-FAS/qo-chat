import { BaseAPI } from './filter'

// 登录
const Login = () => BaseAPI({
    url: '/login',
    method: 'post'
})


export {
    Login
}