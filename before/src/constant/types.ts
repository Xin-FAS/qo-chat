// 基础表单
interface BaseForm {
    username: string;
    password: string;
    code: string;
}

// 消息列表信息（需要与user-message，chat-content统一）
interface UserChat {
    chatId: number;
    // 昵称
    nickname: string;
    // 最新消息
    text: string;
    // 最新消息时间
    time: string;
    // 头像
    avatar: string;
}

// 聊天用户基础信息
interface ChatUser {
    userId: number;
    username: string;
    nickname: string;
    avatar: string;
    sex: '0' | '1';
}

// 聊天记录
interface ChatContent {
    id: number,
    type: 'image' | 'text';
    imageUrl?: string;
    text?: string;
    time: string;
    userInfo: ChatUser;
}

export type {
    BaseForm,
    UserChat,
    ChatUser,
    ChatContent
}