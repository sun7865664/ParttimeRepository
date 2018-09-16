/**
 * 配置编译环境和线上环境之间的切换
 *
 * baseUrl: 域名地址
 *
 */
let baseUrl = '';

if (process.env.NODE_ENV == 'development') {
	baseUrl = 'http://47.96.91.129:18081';
}else{
	baseUrl = 'http://127.0.0.1:8080';
}

export {
	baseUrl
}
