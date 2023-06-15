import { AddGroupReq, ChatData, GetGroupMsgResp, Group, Gu, MessageList, PageType, SendReq, SendToGroupReq, UpdateSelfReq, User } from "@/constant/types"
import { UserAPI } from "./filter"

// 获取自己的信息
const GetInfo = () => UserAPI<any, User>({
    url: '/info',
    method: 'get'
})

// 获取消息列表
const GetMessage = (nickname: string) => UserAPI<any, MessageList[]>({
    url: '/message',
    method: 'get',
    params: { nickname }
})

// 获取聊天记录（指定页数）
const GetChatData = (current: number, qoNum: string) => UserAPI<any, ChatData[]>({
    url: '/record',
    method: 'get',
    params: {
        current,
        qoNum
    }
})

// 获取聊天记录（直到页数，包括）
const GetChatDataAll = (current: number, qoNum: string) => UserAPI<any, ChatData[]>({
    url: '/record/all',
    method: 'get',
    params: {
        current,
        qoNum
    }
})

// 发送消息
const Send = (data: SendReq) => UserAPI({
    url: '/send',
    method: 'post',
    data
})

// 获取好友列表
const GetUserList = () => UserAPI<any, User[]>({
    url: '/friend',
    method: 'get'
})

// 退出登录
const Logout = () => UserAPI({
    url: '/logout',
    method: 'delete'
})


// 获取消息列表中的群组
const GetGroupMsg = () => UserAPI<any, GetGroupMsgResp[]>({
    url: '/group/msg',
    method: 'get'
})

// 获取群组中的聊天数据（直到）
const GetGroupAllRecord = (current: number, groupNum: number) => UserAPI<any, ChatData[]>({
    url: '/group/record/all',
    method: 'get',
    params: {
        current,
        groupNum
    }
})

// 获取群组中聊天数据（页数）
const GetGroupRecord = (current: number, groupNum: number) => UserAPI<any, ChatData[]>({
    url: '/group/record',
    method: 'get',
    params: {
        current,
        groupNum
    }
})

// 在群组中发送消息
const SendToGroup = (data: SendToGroupReq) => UserAPI({
    url: '/group/send',
    method: 'post',
    data
})

// 获取群组列表
const GetGroupList = () => UserAPI<any, Group[]>({
    url: '/group/list',
    method: 'get'
})

// 获取群组用户列表
const GetUserByGroup = (groupNum: number) => UserAPI<any, User[]>({
    url: '/group/user',
    method: 'get',
    params: { groupNum }
})

// 退出群聊
const OutGroup = (groupNum: number) => UserAPI({
    url: '/group/user/' + groupNum,
    method: 'delete'
})

// 删除好友
const DelUser = (qoNum: string) => UserAPI({
    url: '/del/' + qoNum,
    method: 'delete'
})

// 获取待同意用户列表
const GetWaitUser = () => UserAPI<any, User[]>({
    url: '/wait/user',
    method: 'get'
})

// 获取待同意群组列表
const GetWaitGroup = () => UserAPI<any, Group[]>({
    url: '/wait/group',
    method: 'get'
})

// 同意好友
const AgreeUser = (qoNum: string, status: '0' | '1') => UserAPI({
    url: `/agree/user/${qoNum}/${status}`,
    method: 'put'
})

// 同意群聊邀请
const AgreeGroup = (groupNum: number, status: '0' | '1') => UserAPI({
    url: `/agree/group/${groupNum}/${status}`,
    method: 'put'
})

// 获取不在群组中或未发送请求的用户
const GetAddGroupUser = (groupNum: number) => UserAPI<any, User[]>({
    url: '/add/group/user',
    method: 'get',
    params: { groupNum }
})

// 邀请人进入群组
const InviteUserToGroup = (qoNum: string, groupNum: number) => UserAPI({
    url: `/group/user/${qoNum}/${groupNum}`,
    method: 'post'
})

// 获取可添加用户
const GetAddUser = (nickname: string) => UserAPI<any, User[]>({
    url: '/add/user',
    method: 'get',
    params: { nickname }
})

// 添加好友
const AddUser = (qoNum: string) => UserAPI({
    url: '/to/' + qoNum,
    method: 'post'
})

// 新增群组
const AddGroup = (data: AddGroupReq) => UserAPI({
    url: '/group',
    method: 'post',
    data
})

// 修改个人信息
const UpdateSelf = (data: UpdateSelfReq) => UserAPI({
    url: '/update',
    method: 'post',
    data
})

export {
    GetInfo,
    GetMessage,
    GetChatData,
    GetChatDataAll,
    Send,
    GetUserList,
    Logout,
    GetGroupMsg,
    GetGroupAllRecord,
    GetGroupRecord,
    SendToGroup,
    GetGroupList,
    GetUserByGroup,
    OutGroup,
    DelUser,
    GetWaitUser,
    GetWaitGroup,
    AgreeUser,
    AgreeGroup,
    GetAddGroupUser,
    InviteUserToGroup,
    GetAddUser,
    AddUser,
    AddGroup,
    UpdateSelf
}