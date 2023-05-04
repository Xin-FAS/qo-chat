import axios from 'axios'
import type {
    AxiosInstance,
    InternalAxiosRequestConfig,
    AxiosResponse,
    AxiosRequestConfig
} from 'axios'
import router from '../router'

// 请求拦截器
const beforeFilter = (req: InternalAxiosRequestConfig) => {
    req.headers!.token = localStorage.getItem('token') || ''
    return req
}
// 响应拦截器
const afterFilter = ({ status, statusText, data }: AxiosResponse) => {
    if (status !== 200) {
        // ElMessage.error(statusText || '系统异常！')
        return Promise.reject(statusText)
    } else {
        // token过期
        if (data.code === 1002) {
            // store.commit('logout')
            router.push('/login')
        }
        if (data.code !== 200) {
            // ElMessage.error(data.msg || '请求失败！')
            return Promise.reject(data.msg)
        }
    }
    return data.data
}

const initAPI = (...apis: AxiosInstance[]) => {
    apis.forEach(v => {
        v.interceptors.request.use(beforeFilter)
        v.interceptors.response.use(afterFilter)
    })
}

const BaseAPI: AxiosInstance = axios.create({ baseURL: '/api', timeout: 6000 } as AxiosRequestConfig)
const UserAPI: AxiosInstance = axios.create({ baseURL: '/api/user', timeout: 6000 } as AxiosRequestConfig)
const LocalAPI: AxiosInstance = axios.create({ baseURL: '/src/assets', timeout: 6000 } as AxiosRequestConfig)

initAPI(UserAPI, LocalAPI)

export {
    BaseAPI,
    UserAPI,
    LocalAPI
}